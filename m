Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CA3C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 17:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1C710F6F1;
	Mon, 22 Apr 2024 17:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOE9Wywn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CF010E880
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713805874; x=1745341874;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UMBJJfowy/VB8T3R2qDhA2CM6covI2+YmCgCVGU9sks=;
 b=cOE9WywnfjGyWwH5sNnDWXxnToto2vPmbOovpLrh+SBSuakS5m4XgCeR
 vN2JHA2KvzfltOMmCF4AA9htadn+NJz/8uY4jUz4oL1iWcTcUi4GpqH3H
 Isvx/Kp6iqisD0d0+U8xmM/sk9nkJHcLiEOM8aMVl0NFxQ2cRfrJZI78R
 5s9CUk9HGNypViG8QieZlaOnZ60tIDcd0GfzrVRGauElaFmkFtUVBf2WU
 iiW/SgIOMVsCSSxZ3zC5ODICrsVjDgfeuwkiUIF7rfHbPdRO7Cm3gIdMU
 Ask1H34MNeZ7/G/5hRQ5iDC7DLYa2aq/8qvsVfmONPnQKBHsngrt0nQ2j Q==;
X-CSE-ConnectionGUID: vnQPuBTvT1aPdd8vJwM1ZQ==
X-CSE-MsgGUID: HuQ4/rYBTumtRwcY6HuPOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9222555"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="9222555"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 10:11:14 -0700
X-CSE-ConnectionGUID: nc9zQBJlQXO8J6N9FjUj0A==
X-CSE-MsgGUID: GcUiqvGfSnS9gDgPTdAqfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="55288629"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 10:11:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 10:11:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 10:11:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 10:11:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASMzWzfrg5vK7c0/Lq6VmEc2lkbkJoLyltIUEhPbWMv0NSUI4edV40ajw+iYu8ZaTmapEEmmUicxUV9lJ/3cEEXgcxiJzP1pruZjCYYp+mVnOHM0Nq2g1PRR9HTr1kO7hayv6iCsGghEPdu3XF/h+2xo1kpu36n6SJHEA0N0AC1fFA4Tu9hEa8meObLuUc3l4XNfq6Z8RDxPWdadrf1Qt/Ttj4mcpv2/q1FoOA1vIQ3rpxvvHzbCHpOgFLcY6ybtD0m4q5YYk5LsgJWq82K98y8yIvFQmfpMiCRoBLSOwFSBLui3arzYlLfA1tjlVdTs3OeAyKNUuX4BTDxICAa7Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZVXWxF2XmNZ0LOsulahNJaITmZKzWoZgwO7S67UsVc=;
 b=b0CWTq13KqF/N3vUl6ioRht9MLs3/iZo8YWVRYh12l1DBB06ijAdV1QZBw0ruzTeUATUuEJKhSu2YoEXZDaYtHLOJ04nWqth3vxP5E3F6VSEHTSf+9MUuH4BKrMOL6+luaDhPLM3/JDjXsU5PqV6OmbueVoSm6pC/KMK9k5BIzk0C83nbFojhqcJ5h7yNkI9jh6z8dYXjwHCdfDFjpZ/DMa1HevaWYEE3iWizW3j8eP3Gt8Tw14Nbj0OvJqQK0lNXICXtUiRdCpYf7bebDQVj/qg3M34yZULm0zwU7fMydAD14MRjD18VfEY2hmAlP3w+AAzaxo7+V73ajtgvi6ASQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW4PR11MB7031.namprd11.prod.outlook.com (2603:10b6:303:22c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.11; Mon, 22 Apr
 2024 17:11:09 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 17:11:09 +0000
Date: Mon, 22 Apr 2024 19:11:07 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Fix arguments passed to relay G2H handlers
Message-ID: <20240422171107.g4tttdeji6fyzuv6@intel.com>
References: <20240419150351.358-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240419150351.358-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI2P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW4PR11MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: 4284030f-0c9e-4df3-eca7-08dc62ef3430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUo3dW1jNWYyemxiTmhOV0dPVVZFT0JTK3ZKdmpuYWVVVXdQck1YY3gzWjdj?=
 =?utf-8?B?d3NhemI1RW9HN1lrZmJNWERyOFVLM1loOStUU3VpM1V5bHQza2hjazJOcmxo?=
 =?utf-8?B?SDhLQnh3UXArQjh3dGNqWWRkcndhdW1Vd2NwbVBMZUtubzhMdCtGK3hreEhS?=
 =?utf-8?B?MldrRUMzeWlSc3h5UjJlc21aRDh3SFppeTFSRDhVak9Oa3VHaGQ2SExyZ1A3?=
 =?utf-8?B?WWpmRS9jSjJJYi9LTnJ6aFNvUGcrU2hiK1hJR1VUM0Q5YUZaZ2Ntd2xFMVZ4?=
 =?utf-8?B?M3FLVDVwOWRwbFlrdUpmUWtEZHcrdDQvaW94a2NWSUc0YmdmUCtRdzIzMVp4?=
 =?utf-8?B?c09wRzEzNUNaVVB6aTR3em1wUklSSEI5SmRZT1JvZm9FeGFXU2dXenY5bjR3?=
 =?utf-8?B?Y3k3SmJPUkhwMURuenNjRGlpakt1dTQzMEc5Y3hrQkdFU3JmQk53eFcxVWt5?=
 =?utf-8?B?QWJSekM0TzB6V3RET2pjeXV1QjNpQS83MzVIVEZiOFo1bTMzWTNMUVp6NTNH?=
 =?utf-8?B?VHRPWXN1dWhTZktwSzNSRTF2R3JzZkNmaUxhMWd5Z3NTMmpjSllBWEtUMm95?=
 =?utf-8?B?anBNVm1MT0Q0aDBGUkxDUk4rVlRCV0JFL3gxNmJnSmh0bnMwOWRDL1lySnls?=
 =?utf-8?B?R2NHUmNsWjYxTVRVSklGaGdUWWtBZXBNWFRacjlyRWpxSUljTHB2M29zZnRZ?=
 =?utf-8?B?U0VqQlRPNTBwYjVyemlzd0lJdThIbEs4OThaeUhDMG4zMWdJbFZTN1pxZm5u?=
 =?utf-8?B?cTEvSlFlbGd5cDdFV0lNMG15dklCZHJSQnVnb0hzYTRTUUJhNERTZWI4ZStN?=
 =?utf-8?B?bXpxTVZpUXc1UndIcHdVTjhZZEcyOENwQmt5OUgyR2NFTWFLSndwRlZ0aGEz?=
 =?utf-8?B?OVhRQXphLytTOVM4RjlrZnRqcitTV2xJREUwMDBzdmJyYVpxc3pZVCtQT1VX?=
 =?utf-8?B?eThuMkt0a01hWGt0WEZlZkozZ3liWmlram5IOUxTbTRBbjdXSHFjbmp5Vnps?=
 =?utf-8?B?Tkd3ZXZGeStWYWd4dXMvem9XYW5pRUJKUnFxMW54eFRsZDV2aGJwZTFjTjgx?=
 =?utf-8?B?K3ZQMExxeTAva0cxUnc4UXpqRnhsQXYweVNydG85YUJKUHZVdXlYNmd3V2tv?=
 =?utf-8?B?ckI4dXk5RmFMN0dLekNQM0NtMU42REhUamFZUWNOdDlKU1UxcklONXZ3UHlz?=
 =?utf-8?B?L0tFeHF0T0Robi94NFRsbVRBaHlXdDlpb2UxWkoxYm1va3llNm8zVnNxS0RU?=
 =?utf-8?B?T3BtMHd3bnJlckR1U3Y3TWUvNFJYWUcxb3lrdW1uNUJ0Q3RMc0pKeDFLUmQ1?=
 =?utf-8?B?OVJPanlpVzJ3LzU4Z3lPVm9qZG9KNXlDbUd2dFoxTm1qcEdsMUR5T1Z4ZTJQ?=
 =?utf-8?B?ejFFc0lNUFVFZE1RbGptMVFhZXZPRWNyUE8zb2tJVGdsVUhUajVIOENiZWpN?=
 =?utf-8?B?RlcwT1A3N3kxcElLVlJpWVl0QXFvK2llYllCMm11UE1JUm4rQlYzWkF3dFg4?=
 =?utf-8?B?VXhYbkg3bkNUenRxZnQ5L0FzRHQ5dmoyczYxdEJpQVFRdGVPQk5JQXowMlhK?=
 =?utf-8?B?UVVBcDlub1BVUm5KRmU4UGUxYmZUQWpSQUx5cm5MWTArRWllK2hhRWxzYUlF?=
 =?utf-8?B?RXMwYmp3U1Z6WTBlaGkremJGT2tkODRBQ21STndHNUk2bkJKOS9LVncxWVRo?=
 =?utf-8?B?N29hVnhXVGZwS2U3OUI4TG8rZFZnaEhNKysyT1B3N3ovUEk5cHhQTllRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVZ4cHpCcEJSeFc1dFpWa245OXZsNWhIZEpSSnRLODZlV2NtRUpVVzBXWVIr?=
 =?utf-8?B?QnJTNnhkNTlRc21xY21QUUlKY0FGdGx0aVJmaVovbHg5Y0ZsZFpJTmtlZ1VH?=
 =?utf-8?B?RXc5Q3AyVVl3OWdEVEwvdjNqMlg1elNoendQT1RlQ0JibnhnOFViMkFXZ2hl?=
 =?utf-8?B?S1h4QjBURWJPYzlyVFNiWjhHSUY5bjgzWXVzMW10YmpsZWxvODIzUU5JLzlP?=
 =?utf-8?B?QStPVDZka0kxVDBNN0RwVlNaWmJBcVppbmhIUEdjY0NhK3hFUTJjR0ZFbkZt?=
 =?utf-8?B?YWZ1Y1VpQW1EdzJjZFBDSkE1a21hNkhUR2R0bm5QcFpnSUNsVmR4dlVqMlg0?=
 =?utf-8?B?Vk1GTjQyYlBpbXdOMkRocm50Rjg1QVU5K2o5T01FOXJLd25TdmZlSS8wMjlO?=
 =?utf-8?B?bDEwY1F4V3o1aWMyQ212N3JrSENSbU9UelBJS3UyZGt4MVB1VHFpUm9wRXlI?=
 =?utf-8?B?d3d0d0FZREc2NkhxOFpIUVZacGk2OGVWMGhobDhUZkd0QTd4OWxWTGdLUVhM?=
 =?utf-8?B?dXRvaW8xV2NLcEFhR2dQK3BVRzNkU3dwcVpvWDY1YmFqaERYU2NJTjBnN3o5?=
 =?utf-8?B?TGtkODBKRlRxcDd4SmlvWk00RTVzc3JDN0pwZTZvZjF3RVFueGw2UEVKcXI1?=
 =?utf-8?B?ZnVydmdNUTNQS1NRWTIzdGlVZENvSDBicEx5SGdkSjJ2STJxZ0s1aFVsekc5?=
 =?utf-8?B?NFZ6UkFZM1h1ZnFyZ2YySEtLbjBBWlBhV0VCWGFJbVdYemNxYUc1UGV4dFZt?=
 =?utf-8?B?MFFOSzI1TFZtYlJHZFluTG9KTElJOEtaTE42WXNUQ085OFR0QVh0UWRuOFFE?=
 =?utf-8?B?eUZUTHh5Ump2UWRSangzb1puN1VIbFQ4NG9JbFRuNHoySm1wRGRLRjZ1Umxj?=
 =?utf-8?B?Y0F5bms2ZEVXOUN1VDVJZzdMazhQR2VTWnV0bDg1elBIUzMrMFd0enlJOXdO?=
 =?utf-8?B?emYrSUY1THJQY1dyMW1YaTh6b1EyNGpVSmJoTm11WEdoNkltTXRUWTdpWEdq?=
 =?utf-8?B?aCtJZ1Y3c2NTSEJsVjErc1djZ2htb3pmTWQ3RHpuQVUrZGZKMTF6Tm05K05F?=
 =?utf-8?B?ZllGVXBQTmJvUGN3alg4V1JscGFockJ4NmRTcE11MnRWcWl1TmNUanRSSHlr?=
 =?utf-8?B?YlEwSGJEc0MvRy83ZnJCNWxHS0tLbjg1SW1lanNjVGxhRnZRNzFIdzFUZmdY?=
 =?utf-8?B?ZXh1eWw2NHd0d3Q1WTRCdG1JSnNoeE9zbE44ZDk1M29qVDIrTVc0SGRXSEZW?=
 =?utf-8?B?ek5MOFplMEVWNFROQTVGWkxIdndJMlhaUWxwdHBZU1hib2EydldYMmxjenRG?=
 =?utf-8?B?NjJWcVlhNjhXd09wOWpkdFljbFhLdWd0K3UxWm42YTNFZUtNMWJzVXNCendq?=
 =?utf-8?B?d2MycXNqUGdmNzdIMVlneDAvWlI5MWVUL3Z2NHMrclNBNTA3WGt6YVZMUGRD?=
 =?utf-8?B?MEpRL2Z1aEpkOU8yTHppNHVLNkxBa216SWdSRnBMQXZpc21SRFFoQzVnM3Jl?=
 =?utf-8?B?QTFVbXozUkVZMWZSeXI3cng5YTRWZ2ZpQkZZTkpxTzdXOHZFWGRvYXU2MFBZ?=
 =?utf-8?B?cEpabTJsVkFiYVRycVpCdWh0Ty95L1U0ZU9uc3lhMTZNMTlJWk94Mkx6eUJQ?=
 =?utf-8?B?eUJTK1BFb21lbHNVYVRRdDBYLzY3c0g0U2lhS29zZWpKRW5SbHJDTmZQNkJv?=
 =?utf-8?B?MHV5VDNDOXI3RVk4aFQvZ3hiZEltdjBOOFM3amRIS2FCZkZRTjhqRUFNUGlm?=
 =?utf-8?B?R05ZOXlwemx0QkFUM2R2YnJsaGx3TnY0OEkxVDFucDVHdG1IS3Y4UDdrc1N5?=
 =?utf-8?B?MVkzM1RTc01DZEhBNnZzN0Rlc3dCcG5SM003aExyKzdXaFJSaWxuZTZta1U5?=
 =?utf-8?B?ckFOMkd3cEVBcEtUTUJNNSt4ZTNkTEkzWGtyamhSTlR0S04rQ0lqYjQ5UXI2?=
 =?utf-8?B?cXF2NkhxSTVZMWNHMEd5a2c0TkEzNmdqUzd6YlJQMG4vOXBHTFc4S0J6Tk5R?=
 =?utf-8?B?NXZaeGZsaVhkdHVkYVpLUEhpSWRudmtPbXVYMGptcTRrTTZLWHZkWXVTNU51?=
 =?utf-8?B?Y1V5OXY0dmk4ZXVqUmdxbDJBWmsrMjUxeGRkR1VtOWtjbU9hKzIrazRQdDUz?=
 =?utf-8?B?cUx0Y1BDT3B5QzNHMjRxelJFRkRzdTJuTklXbDVJY3JKZkJQZDRib1NPWnRO?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4284030f-0c9e-4df3-eca7-08dc62ef3430
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 17:11:09.3217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDHLNUet/F0qP1Kg+eaa1Zht5feN2H43NBUlUxTR+NYmDrqL4A7ytKVfGsgWBYPSAWwM1p2fv8NcFA2cPuOpOezFJa2klnTn/W5xT0DqOT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7031
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-kwi-19 17:03:51 +0200]:
> By default CT code was passing just payload of the G2H event
> message, while Relay code expects full G2H message including
> HXG header which contains DATA0 field. Fix that.
> 
> Fixes: 26d4481ac23f ("drm/xe/guc: Start handling GuC Relay event messages")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index ac9324338ccf..8ac819a7061e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1058,10 +1058,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  							   adj_len);
>  		break;
>  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
> -		ret = xe_guc_relay_process_guc2pf(&guc->relay, payload, adj_len);
> +		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, hxg_len);
>  		break;
>  	case XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF:
> -		ret = xe_guc_relay_process_guc2vf(&guc->relay, payload, adj_len);
> +		ret = xe_guc_relay_process_guc2vf(&guc->relay, hxg, hxg_len);
>  		break;
>  	case GUC_ACTION_GUC2PF_VF_STATE_NOTIFY:
>  		ret = xe_gt_sriov_pf_control_process_guc2pf(gt, hxg, hxg_len);

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
