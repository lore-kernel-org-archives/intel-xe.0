Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA78EC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 20:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F32C10F90C;
	Fri,  3 Jul 2026 20:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZ5X4yCJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA9010F90C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783111260; x=1814647260;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=N/JYXmcwWeMPt3Gd8Suq1Xe/IoPEx2yXKZqZVMhjPMM=;
 b=UZ5X4yCJPleispGkG8zLMqppoXxz1dXOa1+jEqz4N0Wp7XBH3Dra7/rR
 dFXyJN+91E4U3rfIiqznCSwkZsex03WkECKVQGaw4K1IurjV5oSR/R5PJ
 7SicsD91bw/2scRgChWExqxs6hjZsgyPlitzX1BKtuMgoWHKV6+I9t2iT
 PPQzZ0g3QLDF9Qafu522vRtuow2Olp2D4mKA5NBe0VP/+l2uEobIQAq1V
 zkhFSiOOAk37ukAbY9GVKMSFi37iV0phivjW76UAlf+zdsA4TokTnEkHs
 Lxzm+vtQZ1q3+y34d7Eh2iSNgGin0y6CBBb8hBPYoZjAJTAFLuDBEKkTw Q==;
X-CSE-ConnectionGUID: w8knCtA7TJ+qwgUeIkARqg==
X-CSE-MsgGUID: 9UUDONqgRkaJNNdHXIpWKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="94507449"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="94507449"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:41:00 -0700
X-CSE-ConnectionGUID: aeZpjefnRuCAyZqZrzWxdA==
X-CSE-MsgGUID: J4KahvbtQ7udfWw6eh1yPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="253325689"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:40:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:40:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 13:40:59 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:40:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUGeP2KEwRJmuD2oDXSKj3bN+UWGaC4SILiBFEoSFVcapeIqRXX0sHJfRVsFqDlP1LKQGFtJ6epjNw+vf9UEXCKa4px0DtxABCk+SB5mJQQaJMUzYIR111USgDcMLGTmRelXonutP6Fc0f32vrKS21RVAGp0F+hc5Oi4D1qxGhD7ZeyUFdGnffjpRRep5eIfbxGObTukgKVKPk48LKT/r/m3LZfDT0u/l2HgnsFxeNNxhS1upOrKRCNj1iH5RC0Nndcs/rsMDeCYaSAZIXPKHbnj+NVM8MZ2Qtwr0m/0/4uFy8UzYF8peYSwRVVQ+N+yBvJqpYmz5LnNh+TX7S1Ayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anTGG+2YM+ph74RJK53vZHoHvo5edAg/C5EV1HPw0o4=;
 b=PjzWLueT1LBUXlohYksfEQ8jkuUejXtFtMLQIC0zUJuOtEFDUeLniMnx1WIqnp5bcKG391h5BdK3IbCqUQqzbADfnubUm+HIbkb0d4Qauxec4ow6ko6Mha444LWLiX0d2rV7Rs7asHOappS3HDcWa/Jq9ekAND2Eb516a5F2Ptfq0J/DMH1RrdcEDI4G+zxMDsB5wtj36EDuIUQJM4INqGq+I4yjSkXJrVOJJXiNKSDib0R5+J7bxzx0KgPTAAXE1YHjE6G9UbWvjpKmVz3uY3nWq8AA3R9IVI+V3xHQnywk3Iuad3em7ahZN+N0fMmGRtxkvKMO2Z7bQbocrxDiBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 3 Jul
 2026 20:40:51 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 20:40:50 +0000
Date: Fri, 3 Jul 2026 22:40:46 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 09/13] drm/xe/tests: Add string encoding helper test
Message-ID: <akgeKzx9sLkCNiY2@nostramo>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630132633.32804-10-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR09CA0150.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::34) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|DM6PR11MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: 1adcf167-87d5-4df3-c3b0-08ded9435e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Aj5U12r/gj1XcM1Z53PnwHi4mjI02FKOkUU1OKGBsXrTo1wMbz+Z+27cvzf06RguEDkOQRZJq422VTFM80Z4/J6rSUjmbzfXjAoE6F+RAB4tbVUmsoGxq2+kP43/OX3uNVKgZdB3wZHrvfMXI4hXh/3E8q7kHynxMTGVGgueOgCvRDeDKxmxoOBkcEe6KhX1MIFlKCwVMZbKuwi8MF+Yvn4w9g2QHkndMb59nd+giBixul0WM2tO7YBfQaSUblxK4C9IyN2qBN5mXet8S2KjcC3KB90jHxLYiEnZC/IyqI+vN/FHbR28xUTUGf41tm14dEgih8GUaOLXA7P09fD972c9R2PmHE0ng7QOINzCZPqOFG2fk+0mPPtMbU/1bjrfAhBn5JxPxHJXjtI/opu3dIVIxlIaiVW4kW7ZKGFoii0v2UXZQcgi6dZf5XhKdPf13gQpSmXfyoObTkYRtCDKR6VLnSHgZJnWryP97BhX+WGLLqha8DdfAvVPz0nVRqDaC/wEB7fMc2LyacWCghRLNptx0MLC9zO2nHoFtqujOJEJoftj/UMQXnjkPbkM+1Hlj/TeUYmnbY7u2mGnAoeXKIkt4yKOltYBF7P38o+FNY3yvomngmWAtV3ogLN07qrscxrntxADURa/1TEViUXpQ4lYokY16VaeorQXwaRQLfo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlFvL1JtWFI1ZGJGZ09VdHFpcVMxZ0liMUxHRjU1WmxTVzZHQWtEQ1htRktk?=
 =?utf-8?B?WkRvY05NSm5CSll3dmFGOVZScXgvLzllcVJqUVlSSlFBendLTTVDdUhlTkU2?=
 =?utf-8?B?LzNETUpuTmlyWldXcFVSSWJnM0swSkM2LytnMnJ6R2NDYngvQnpLcTBDdkJD?=
 =?utf-8?B?UGQvWldKYXJlcTJzTXRjUGRzRmxOcEJacllsWW9oVjNtNmwvTEZySXdDWG1V?=
 =?utf-8?B?eW9JMmEzdlFXcGRZK0p3SWZVbTJZdGtUOGJqQzYxNGJmcmh4VWg1M3REV2Q4?=
 =?utf-8?B?cTd0QXQ0aDZlTWl6UkNlcnpiazh0eWdRUGpSTWRvZDZ5TXl6TnNMUUFRdGFW?=
 =?utf-8?B?Q1N4VGt3N216RU9la2FFZkRyRW14OWJ0S1lEeDEvRTdDbm1kNXJkWGdxSzd5?=
 =?utf-8?B?aUV0bE5kMkU3T2NlVVpIQUE1UmhISGJ5bWtLRXRHZzVFUzVXVmZJd3hVdkdv?=
 =?utf-8?B?WFZ4SFU3MGEzZ1dsc040ZmdNNU9XM1VHdHdvbjNzUHFkUy9JWXdzK3RhWDZv?=
 =?utf-8?B?SHNaZ1VPU1BvR0xmTU90RHhmZnBHUGIxMnI5RVVEZVAzWmlWa0w3RDNrS2tu?=
 =?utf-8?B?MEEzdGc4NC9jS1ZNN1ZtYm1MVWtpWlVuQytOVFZCSjduWHNFYmV1QnNqcGdJ?=
 =?utf-8?B?T0g2QStCdlNBVVoxVEdkTzZvNWxOOFZpa0pVQkpqbFVDK0VXYldQUDhhUHhp?=
 =?utf-8?B?RUhuQ0w1ZHVaZWM2bmdCSDVSbGFkMUQ3V2N6Q1NFT29IWkRlV3lhRlVlOFhk?=
 =?utf-8?B?dXEzUERweXVmcnJxbkZvS0FoaU1NWVBxR2lnNERaWHNLS3dLdlN5aEdXdFg3?=
 =?utf-8?B?Z3NmMWxmcy83a0lQY0hHUTU1eFpCNzJJTUFHMW5waDhtTmJwblhudEp2TEo0?=
 =?utf-8?B?WFJXOXVuMWhpN0l6TnJsWXI2aGx0cWFWTXpjL0hRa0NJeTNOL3RSZmYzc1hZ?=
 =?utf-8?B?a1psdGhYSnNMMjhUUlhab3dvdS9mOHgzVklRUDZzU0g5ZzNtKzN6Zy92OUM0?=
 =?utf-8?B?WFFyY3hhTlJ5REQxSm1pM0VOSFI3ZFBzVzMxVjdlT20rQzFZa09oVk1Uejdn?=
 =?utf-8?B?UWYyN0dvdVRFODNjOEVid0hxWUdSREdhVDArYTJrUWJuWWZvWlVFNm9heFp0?=
 =?utf-8?B?eEpQbEFFVjZueTRJckZVS3dEMDFJSnhCQ0NYRDllU3ZLNUtrTHlaK3JRMkZi?=
 =?utf-8?B?QjhWVmJqdk5YQUVtSXlNZ2x2SWMwQStWS29iSGtxNFF6dDArcUxNRll1YWFs?=
 =?utf-8?B?UWhnbndNQzZOa3BvVytwN3k1cVR1ZVlxOUxIaWZEcWl2VDdBS2tpN0JBZDlQ?=
 =?utf-8?B?SG50Qk9MR2xyR0F2WFpVbEpBSVZlMjNhVW11Tjk0am5kTk11eEl6cWo1eVRs?=
 =?utf-8?B?MEovcDBXZFJGQSs5SVZ5RThpUWZBY2xwRkMrd0JsWmFIV1ZjdDJsQnVlUUs3?=
 =?utf-8?B?aHFYQkFFR1NDR0E4WjdjTmlucmNrczd3VmJPUFZDWHpFVHlDVS9yb2Roa09a?=
 =?utf-8?B?NjhlYVgxV0RhVTJnS09tMnV5YzdCS0grT1N6ZEhkdXYxOWVhbVUwd0o2VnUy?=
 =?utf-8?B?NUpHWEJOdWNudUZraUEwTHl6cHRwOXB4czVWd1BoM1ZuWVpHNHBMbFdNVVgy?=
 =?utf-8?B?MkJreFFYRUdWdTRNYk95TEdoRXBDaHYzRVJvaFhzRXlLdkNIUThmRi9jQjY2?=
 =?utf-8?B?czVnWXU0WjhTbDRKOEF3R1RJRyszdG9PSmRXNU9OQTVtUlJjekJCWXF6SlNQ?=
 =?utf-8?B?Znl1NHZ1WFNLdnhITEhHNFkzWjR5MXJ0bjBzMjl1NXVLTlBHbUVndWlyR1pu?=
 =?utf-8?B?ZWFNd0R2b3N4TnRabEZ4QngzZHl3WUdLSTUvQmhSYW1acjk1VUx2aXRDNzJG?=
 =?utf-8?B?QS9hWjcrZnRobmlzaGV2N3JFQ29LUFVlRVBzZlB4T3FHaElNc2swclVlQzZm?=
 =?utf-8?B?ZGpPL1hXZ2pvQWJ1RkROdUt1RTg4L1kyazdINWhGa21IRXhCVjYvWWFmVFNs?=
 =?utf-8?B?aElQSjUycWJlaHduL2NYYTJvTmFKTktJSGNWaHFJNFNGanMxNHNua3ZSVklj?=
 =?utf-8?B?SGIzRHZyYXV3dEFzbDR6TzhtbnJkdDJUR2hlRjVULzR3MjIyVGh2ajhOUFox?=
 =?utf-8?B?L0llWEZucTUwMHNKZng0TUJVTTBxYkVCTWxDZ1JZeHUralJsUVppcWI3dG9s?=
 =?utf-8?B?bC95R0FJOHlZbU01ZzJ4Z1J0YVdYd3NtMER2RXJRL3FxVzF4SFYvOGkzWll0?=
 =?utf-8?B?ZDRjU1JmeXg5ZmRFVG93aGpsc3BNaS9QVmFtMnZ6dTE1alNVSDR4TVc4cGFE?=
 =?utf-8?B?aGlJQkRXSlNsTzVCNmNDY09sUVlPTHFwTG1GOExjS0t1VXpGeDRBWGNqQk9p?=
 =?utf-8?Q?ZjvVJbatGSU3hzP8=3D?=
X-Exchange-RoutingPolicyChecked: s7f/JnHvxljNJInzFl/SDvvmmwHpZfzJJpJJ6L0MHD79ppZjVuZWML9K0XGISOUv8O5K5dAbOS5mM74/0Lt1bXipClt1ueOufULzRow/bahEkaWe6VLGLFQ3WhAzpwgE6TJGB1JNN1Rpz8CcnFBs1arMqSvreRLp44+0mzMXjbA3WC4PA3Xu2646manT3XZieDtaU3/b+lZH9R4bpkm1YcV7R74piHIW1sujwkGFy1fnaDh7PA2xIqbQOF3SaSTGAm+iB77dBtVxRqondezE720htb4XQb9Yv+9hqEqseX7Bqe2eUQIB3J15/1iz4lX+/Z2HkhwNy2/XCZL6u+NZaQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1adcf167-87d5-4df3-c3b0-08ded9435e97
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 20:40:50.9203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHnuPKkQ8ID0b3jJqAt3RhganleI4z+o8vbZJBWcAwteYSk3lAoFaS7Rvjd4t+pOuayaLIDNfsMlusddbT595wQNfV0tqlDSczHyjhOv6Js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
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

On Tue, Jun 30, 2026 at 03:26:28PM +0200, Michal Wajdeczko wrote:
> Before we start using string to KLV encoding helper, add a simple
> test to make sure it works as expected.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
