Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8381C83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 17:29:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A3610E1AC;
	Thu,  3 Jul 2025 17:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cMZryTep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C1D10E1AC
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 17:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751563788; x=1783099788;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YOriOct2S8xRst9M0v2JMHnnS3ugBZZ7W23WSVHVfF8=;
 b=cMZryTeplbVm5DvQMmFWWHjOJpAquvseqriCG35Jq+jQTNISH2etFQVH
 +mlQaJQrJTuqRSGLB4mpp6rSWzOpYqhxX7X6doGbYirevWFrZ/6JYasVu
 6+vmVjk/ESUHvXxXX+5mebqw6S7YbRT0ko+C3ac4aD+8kl4B18FeY3Vmb
 yKIzRQInIEFMig7f34BccGNKq279dAiJSTGqLHcb/LfyBJVOaTWAOTIkq
 H7xv8ZXa5Bsx0PRW9HZyQIGtO+zdbQZrdO+Ei3tVbT48i/mxJ4KIecDYA
 ylA7q8Emz/qPsvvzSbHgIdv1CPBHBBsFQuOeh43OeHBN/8etgezzgnERl Q==;
X-CSE-ConnectionGUID: ei45U3OPQeOST3Xtt/Icsg==
X-CSE-MsgGUID: iDzyrqGxTgeeDXxWCgE63w==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65352585"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="65352585"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 10:29:48 -0700
X-CSE-ConnectionGUID: ZxdCEyhpRiOA6+lb/YPIOQ==
X-CSE-MsgGUID: eisvq+0uSNWWbR2M1kId9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="153840920"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 10:29:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 10:29:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 10:29:47 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 10:29:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/iRlgJL6Z6FCD15GjJj8TCB1hVrXX+EICTiIj7Vz4r/0XcqI0WcW+GHxRHImr8os0+jToyeW9Y3X7/YSga7CMxqhAorcmcU6+SqRkH/Dyzt5NTgRYEkwYaYg2luP6M6tTUVodDz+YQFo025JJqd7XGHlsIaoULxE+O+mctf1xrztOmHlhFPa//Y+FJrw3rBS4hR83ny8lPGWB0768+3eSLxfgO9X2OBUyDMJBbdHq2i2+Iy5r1MLRef+Bj2R47hhXyn5vaVphzK1zqyYaERdctlCTq3N3OYb5vT27pqJoDdo6ej5glIvTnHa/WCbO9p1Dv4tOxVpNnJnPVQopLU6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DS3Be+5GoM7Q5bfRILGGcgsAP5raciMfB0UG/ZR/oMw=;
 b=wfFqyQGKEkTHyfdb/soSOOM7kDex67Si1Rve1BL4T94SD44qzO8cBE7+xbRarGiqmvu4emWM+ehPEJsfokmx2J5eTs+6DQFMLRWgPs8wmBy+LfwX8vA3hsf1nQnBevgNdVQEG77o1NZr0beX16e4sR5oBju7dQaHUTC9D9Hddu447ipdNAjvcUgr7slsQb+G9s0i1FCKbcwzBb6GSr9h07K0v3qmaE+UmH0LWKnZdPakGaGp4fiCUX4wblkcgPpVGV0zDfPo2qeOu/swQcNgYWbumX0By+y8Dm01hFV6vpSdqZEznhU7XmUlWSyx+IyyqcGlMIqz0RMtWpbCw6zvTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7003.namprd11.prod.outlook.com (2603:10b6:510:20a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Thu, 3 Jul
 2025 17:29:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 17:29:31 +0000
Date: Thu, 3 Jul 2025 10:31:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/pf: Invalidate LMTT during LMEM unprovisioning
Message-ID: <aGa+YbxiJSW7EjbI@lstrano-desk.jf.intel.com>
References: <20250702223041.1700-1-michal.wajdeczko@intel.com>
 <20250702223041.1700-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702223041.1700-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:303:8c::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 65436d61-6ba7-40c4-31a3-08ddba572bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWpYbFRTWkV5dkRPODZuSVRFZCtjbURxWllCTkNFM3NxTTV0LzA5dG9KYjlP?=
 =?utf-8?B?cUpROUlESVFxYW53NXFLNElKZWEzYWxybEFSY2JGenFDNXNzYkhkQ1drTm5Z?=
 =?utf-8?B?UGlZcE00eFlra1BwV0hsV1hRYldnOTB5bERJVEhNWWFrV2ZZSXRGSVoyUlNX?=
 =?utf-8?B?YXdUN3REZWpjL24wVXhMRzBQRHhYa012OVRQOGpjblRvSzdCUE1hZVNyTVBk?=
 =?utf-8?B?K2xzd3lQNUdlSWovMU1FQUpHZGhZYzY2Y0JTaU9qWUhHRnk1SzNyYklET0Yy?=
 =?utf-8?B?cUFJekduVFZjYUJ4RkNYZVE5dmtYN3dVa240UTRaMmxiT0Q1Z0tUV0EzV3lt?=
 =?utf-8?B?UUFpUmZ3Wkd5d3kzUHhtbUdFQ2FFMnk3WFJKYmIxUzB3RzF5RlZ4dFpkY0I5?=
 =?utf-8?B?WFZUdTdKY2UyNWhzdG9yQUhzdm8rZWN0Z0hHcFhLbkU2elZ4WFZoME1QVUhD?=
 =?utf-8?B?MDFLY1YwbUo5cG5YNmMrNjBDUTErTVhNNXJWYUhMTHJJajJTeFdUZTYwejlw?=
 =?utf-8?B?WUUvVFVxZWdCN05wVGZmWXVrcDE2REhyU3lKMkNPUS9lU3p4a2oxM0RlTUdO?=
 =?utf-8?B?eXd1RmNKOENycjZHcHVtNk52OEkzcXN1YWE4ejYxTi8vSTR5SzdPRzFrM2c5?=
 =?utf-8?B?bEx4em1OWjh3bFdyVFNtRElqUUdHQldiWmE3citYYmFWa3NmcFhiT2dkbURs?=
 =?utf-8?B?Z1N0SG5TcmROYXhqak02RnJkQ1FBU2VUR0lXeTduUFR4RXdIRFkxU29QM2NZ?=
 =?utf-8?B?a0EzalVHUzVOS0IrL0FtM3p1ZTdFRlBDRytvTzVpY1BKZUJ4bnMwcmo0WXdh?=
 =?utf-8?B?R3FSTXZVMTQ3MHZUWkNXWmZFR1FCUW1YYnIvWjIrQWdMbTNYQ1dTTG81QUNp?=
 =?utf-8?B?b04zbXFpTTBoTGk5dlpGbW1GeWpkUFNWOFVnWUhIVVlqNE9URlVHNjA3WjRt?=
 =?utf-8?B?RUhrZjNob2VBbE9ud1VoZlNoNENIZXI1N01WbzB4VnN3MVJ3WEdkT1hwTlJt?=
 =?utf-8?B?ZzFtR25JMVVjSEliUHJYd2V0Vk9EVmM0U1h6N0ZzL1BJMFpZNlBqK1R4UGh3?=
 =?utf-8?B?ZVdURnlXZTRmSVRzSUlLblhJT3dCS3EyNXZOeDAwK1NiRU1zc002aS8rU0FX?=
 =?utf-8?B?ZlJwYnZyZFJNYmJ5c0daZE1LdVYzRlJiWEdZalFvcWxjTDdqM25ZVGFBWjFx?=
 =?utf-8?B?QkFWRXRjNTRZQ1IxYWJTSThyQjhXSTRKdDUyZi9GVGRHWExhY0xpYjB2NWRE?=
 =?utf-8?B?bHVUaDZBd28rUyt0elkyRGtVWWM1M3IyRTlNYTNzMHk2SSs0T2VvQkU0dHk4?=
 =?utf-8?B?emtuTFhFOUxDc2hIbjRqSm1OT1pEdnQvZmpsMnkybVFIdTZkUVB2WGNEUHFt?=
 =?utf-8?B?QjhDMDA1WW8rT3JoL3hOdUEvQWVLdjBSUVVjUVpreGpXMGxGWkk1Wngxc1lF?=
 =?utf-8?B?VmlkZWpObkRaWCtWRWhTQm9aclZYZ0J1YnZVVGQ5U1FMKzZ6RVpzZHA5RUFx?=
 =?utf-8?B?Wjgwb0JrTjNYRlhxbkZ4T2Zwc1BTWllhSHl4ZHNRMmpHYlBwbWs1cEdtbEg5?=
 =?utf-8?B?a2daZUhwcW45Z21XaEdYc2dUSXlCSXQ4UU82OThpaXgvZUxOSGJjc0Q0dEFU?=
 =?utf-8?B?Rmk1SDRTcGR1djR2eHFMU3VvdDBhL1dsSmNLNEtaUzJKb1JuTENjdUhiZENj?=
 =?utf-8?B?STVkYUtjakhjVHIrNjVsRkNQOEc1RGc2OUZsalBYN0pIaUVGU1J1dTRrcDM2?=
 =?utf-8?B?RWZxY0t6OXUvdi9GSDNnZnpCY1J0N09PMzd4SmV2VTNXenpmamx1ZCtWMWZa?=
 =?utf-8?B?dGZFUkpBZ1VCMVBtbEZhWEwvbnlSWGJOd0tqYi8wanVKZDhlbFZNdVRkVVlo?=
 =?utf-8?B?dkt4WHdsL0lMc00rK1U4TllrVzdDVm1XdzFuT0dnaVZKWnVpOTIrU3F0RjhW?=
 =?utf-8?Q?I+dhgAS7D2I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEg2blpWU29XeEQrdEFQQWIwajA2cDlvaDBFZnNVU1lBNDNtZkpQRUNLSWt3?=
 =?utf-8?B?TGRzeXdNeFh5QnVkclJsTXJBZ1h3dHd4ZWZsNWFTVkxKcHVIWDVBQ01xZ2J2?=
 =?utf-8?B?NmZIanlsaks4eXkxVWpnK0lxSWtUcm5sVGZPYnpVLzVRamFLaUxnZ2kvdGN1?=
 =?utf-8?B?ZEV5ZWxCbFVaaldPaXh4UnhBOXdvazROSlY1KzhrbWZFVXhFYUZWRHpkWHZ0?=
 =?utf-8?B?SGFwajVndVJPd2hzSXNGN2doYisreTFMbGJxczMvZEVsZGpGUlc3SXYyUlFt?=
 =?utf-8?B?VDdqZnFuYm1uNU0zUUFQaksydnFFUk9oNUQ0azhPRU11NmIxOGw4NXFhd2g3?=
 =?utf-8?B?MFUvT2lsVnZaMS8zNm5DTzdSYzlJalB2ZzlDK1Z0ZVNZZzlzOHdRQU03bzI3?=
 =?utf-8?B?RWlWTWozd2tCM3V3SGhQcnlxcE5jeGRHbTlQUWg5TGZCVXlyZEk4TFc5bXdu?=
 =?utf-8?B?cVZsQWVrTXcrV1BWNUZIYnYvWi9TeUFTVDBLdjVpM0FleE8ySmxpM0FuemVI?=
 =?utf-8?B?SEtoaks0VzJlSG05VDlNTG5ydHNpYU9mK2czcnMvd285TjIwUUdkY1pQNFJt?=
 =?utf-8?B?ZjVsNy9MM2tIcXJjRnQ2RXBQVFZNVGwzM0dFM0k2SklyRUlLb0dIbk0weUJw?=
 =?utf-8?B?d29jbWZIOUVYNUFob1dMMEM0WWFZMGJyNnVKOXZXTUhnaUFBT1pRNGVkSE9U?=
 =?utf-8?B?dUFpMk4xWURwM3Z1RDltQml0VHFOMEpPVGFEcHhhekNTZXVDdnB6RmxucVFv?=
 =?utf-8?B?cElVazNzWXdJK0pYeUZFSVVBNkVVMm5NZm9SYmJZeThWK2NSWWhaVTRscmhD?=
 =?utf-8?B?MEdiaUxMQ21FYW5BejdleFZpekxQb0wwbXVtODA4UmFubU0rRWNLTTVIOEtC?=
 =?utf-8?B?NE5ZM2FtM2dSdmNKUmlGbWx1M1YzUHNNRWNsVjJxUzlvdGo3cHVMVTI2ZklI?=
 =?utf-8?B?Qy9kclVWNlZVL1lIaEhER2NVSXNBZEUxRStxUjhFWGdadWMzSzltaWRYS3By?=
 =?utf-8?B?d3ZibmFSS2wwWGJUWjlha0VOcnkvZjAyWEN5V2FSOXJSbWo4SHJuZ0tuOTdx?=
 =?utf-8?B?Z0tsUjNZVXlmb0tDcXM2VTJldkJLTFBGaHNsZzRKMlZwQjdmR3k3TVhQTzVt?=
 =?utf-8?B?NXRyai9Xb3dlRmtqUG5LWDlDcURtdkdrbXNNckE1cktUcXBMSWhRRUd5aXBG?=
 =?utf-8?B?TU9sWGtxVk5SaVJpRDAySFhIRHFCeWZsOGUwNzRoVUVHbE8rdyt4T3IrdXRM?=
 =?utf-8?B?SVVFSFRTbUpRY3prUGJrcC9raVY2RUVoWG5nM1RaaENvNUJYQWVXOURKMWU0?=
 =?utf-8?B?QzN0OU9LNjIyQ0VIUWZjS3lXaWV4NzkwRENubk0vYnQrek5TREdjM3RpWHJU?=
 =?utf-8?B?QWtLSXBEV0ROMzZpUjZMdU1KbitWTklTZ0ROYktjSHUxRURYOGlDN1gzWnEx?=
 =?utf-8?B?RTJlT2ovaVRyMkh2WWRaRUFnYmFFRk5Lc2srZTNaOEprbkRDRlRXVDQ3VUFn?=
 =?utf-8?B?NWxRc1Y2anRNUjJHai9NVFkxM1E0RFloYWFBaCtVbGRXTzcwVTVOek9ERXg2?=
 =?utf-8?B?Zk4xMmlqWlJIMHFZTnozWFh6aTdxbmtvdkdPQU5pNmtmT294Z3JwcC9qNEk5?=
 =?utf-8?B?bGJUVjBvLys5YzBUTStwckJ0cENkdEtUNzVGMUFlanhEeHNvdlJSRmZLWWtG?=
 =?utf-8?B?RU9QQzRFQStkak9GMlBKbURhU3RyYStMU3VRTTk4VVkzeVZITFB0c0w2TDRs?=
 =?utf-8?B?U25DUktobEVQRVMySlEyWVFGeGRGL0hXSUd6TWNXWU5nNEpRWGNPaExrcGtK?=
 =?utf-8?B?NDFObk9XUFlaaXhvN3BjVWZXYWNpcGRSbE8xamlOZ1pKc2FEQTFGVUs1YkhG?=
 =?utf-8?B?WjhqRWNnMjBvWG41Z2JIMGt3UWFsT2d6STFGdVJvQTNsRWdvUzh1V3ltNlNR?=
 =?utf-8?B?N0Qwb2trdTZtdEFsRzBHajNTbDRPZWJpL1haREx3U1FRaUZ0UUVQL2VGMDBu?=
 =?utf-8?B?emNvZVYvWUNMdGdtQm5DbkxDQkRXRncyN2JMdjNmcE9laEw5S2xscktnaW5Z?=
 =?utf-8?B?VXlmWVF2MnB0SzdzUDR6TXV5M2paVGNwR2NxUWJtQXBRZFFLbExMUzcyL1FG?=
 =?utf-8?B?WE9uaEJMNVNFTDYxUndzOWhuODAzUEdMemxkYS8zTXM3RnUvWDY5ckpYbXpi?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65436d61-6ba7-40c4-31a3-08ddba572bb4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 17:29:31.6503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwYuDo+d6PBTEVonm1zd8ofiu0laMkE6KYzFOBlVLFVqbUotxE3NYbKpFnRvs49LirLAr05K0gogFNlJDydVJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7003
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

On Thu, Jul 03, 2025 at 12:30:40AM +0200, Michal Wajdeczko wrote:
> Invalidate LMTT immediately after removing VF's LMTT page tables
> and clearing root PTE in the LMTT PD to avoid any invalid access
> by the hardware (and VF) due to stale data.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.h              |  4 ++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 35 +++++++++++++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 +
>  drivers/gpu/drm/xe/xe_lmtt.c                | 56 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lmtt.h                |  1 +
>  5 files changed, 98 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index e4da797a984b..a7acd899aa76 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -130,6 +130,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
>  	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
>  		for_each_if((tile__) = &(xe__)->tiles[(id__)])
>  
> +#define for_each_gt_on_tile(gt__, tile__, id__) \
> +	for ((id__) = 0; (id__) < XE_MAX_GT_PER_TILE; (id__)++) \
> +		for_each_if((gt__) = xe_tile_get_gt((tile__), (id__)))
> +
>  /*
>   * FIXME: This only works for now since multi-tile and standalone media
>   * happen to be mutually exclusive.  Future platforms may change this...
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 6088df8e159c..4fdd5b300265 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -330,6 +330,41 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static int send_tlb_invalidation_all(struct xe_gt *gt,
> +				     struct xe_gt_tlb_invalidation_fence *fence)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_TLB_INVALIDATION_ALL,
> +		0,  /* seqno, replaced in send_tlb_invalidation */
> +		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> +	};
> +
> +	return send_tlb_invalidation(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
> +}
> +
> +/**
> + * xe_gt_tlb_invalidation_all_async - Invalidate all TLBs across PF and all VFs.
> + * @gt: the &xe_gt structure
> + * @fence: the &xe_gt_tlb_invalidation_fence to be signaled on completion
> + *
> + * Send a request to invalidate all TLBs across PF and all VFs.
> + *
> + * Return: 0 on success, negative error code on error
> + */
> +int xe_gt_tlb_invalidation_all_async(struct xe_gt *gt,
> +				     struct xe_gt_tlb_invalidation_fence *fence)

I'd drop _async part of the naming as I think it is implied with the
fence argument that is this async, like xe_gt_tlb_invalidation_range.

All the changes around GT TLB invalidations look correct (for now, this
whole layer needs rework).

Matt 

> +{
> +	int err;
> +
> +	xe_gt_assert(gt, gt == fence->gt);
> +
> +	err = send_tlb_invalidation_all(gt, fence);
> +	if (err)
> +		xe_gt_err(gt, "TLB invalidation request failed (%pe)", ERR_PTR(err));
> +
> +	return err;
> +}
> +
>  /*
>   * Ensure that roundup_pow_of_two(length) doesn't overflow.
>   * Note that roundup_pow_of_two() operates on unsigned long,
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index 31072dbcad8e..40648f952aee 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -20,6 +20,8 @@ int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
>  void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
>  int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
>  void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm);
> +int xe_gt_tlb_invalidation_all_async(struct xe_gt *gt,
> +				     struct xe_gt_tlb_invalidation_fence *fence);
>  int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>  				 struct xe_gt_tlb_invalidation_fence *fence,
>  				 u64 start, u64 end, u32 asid);
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index b56437a816e4..aa51c06e2416 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -11,6 +11,7 @@
>  
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> +#include "xe_gt_tlb_invalidation.h"
>  #include "xe_lmtt.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> @@ -216,6 +217,60 @@ void xe_lmtt_init_hw(struct xe_lmtt *lmtt)
>  	lmtt_setup_dir_ptr(lmtt);
>  }
>  
> +static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
> +{
> +	struct xe_gt_tlb_invalidation_fence fences[XE_MAX_GT_PER_TILE];
> +	struct xe_gt_tlb_invalidation_fence *fence = fences;
> +	struct xe_tile *tile = lmtt_to_tile(lmtt);
> +	struct xe_gt *gt;
> +	int num_fences;
> +	int result = 0;
> +	int err;
> +	u8 id;
> +
> +	for_each_gt_on_tile(gt, tile, id) {
> +		xe_gt_tlb_invalidation_fence_init(gt, fence, true);
> +		err = xe_gt_tlb_invalidation_all_async(gt, fence);
> +		result = result ?: err;
> +		fence++;
> +	}
> +
> +	num_fences = fence - fences;
> +	lmtt_debug(lmtt, "num_fences=%d err=%d\n", num_fences, result);
> +
> +	/*
> +	 * It is fine to wait for all fences, even for those which covers the
> +	 * invalidation request that failed, as such fence should be already
> +	 * marked as signaled.
> +	 */
> +	fence = fences;
> +	for_each_gt_on_tile(gt, tile, id)
> +		xe_gt_tlb_invalidation_fence_wait(fence++);
> +
> +	return result;
> +}
> +
> +/**
> + * xe_lmtt_invalidate_hw - Invalidate LMTT hardware.
> + * @lmtt: the &xe_lmtt to invalidate
> + *
> + * Send requests to all GuCs on this tile to invalidate all TLBs.
> + *
> + * This function should be called only when running as a PF driver.
> + */
> +void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
> +{
> +	struct xe_device *xe = lmtt_to_xe(lmtt);
> +	int err;
> +
> +	lmtt_assert(lmtt, IS_SRIOV_PF(xe));
> +
> +	err = lmtt_invalidate_hw(lmtt);
> +	if (err)
> +		xe_sriov_warn(xe, "LMTT%u invalidation failed (%pe)",
> +			      lmtt_to_tile(lmtt)->id, ERR_PTR(err));
> +}
> +
>  static void lmtt_write_pte(struct xe_lmtt *lmtt, struct xe_lmtt_pt *pt,
>  			   u64 pte, unsigned int idx)
>  {
> @@ -265,6 +320,7 @@ static void lmtt_drop_pages(struct xe_lmtt *lmtt, unsigned int vfid)
>  		return;
>  
>  	lmtt_write_pte(lmtt, pd, LMTT_PTE_INVALID, vfid);
> +	lmtt_invalidate_hw(lmtt);
>  
>  	lmtt_assert(lmtt, pd->level > 0);
>  	lmtt_assert(lmtt, pt->level == pd->level - 1);
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.h b/drivers/gpu/drm/xe/xe_lmtt.h
> index cb10ef994db6..75a234fbf367 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.h
> +++ b/drivers/gpu/drm/xe/xe_lmtt.h
> @@ -15,6 +15,7 @@ struct xe_lmtt_ops;
>  #ifdef CONFIG_PCI_IOV
>  int xe_lmtt_init(struct xe_lmtt *lmtt);
>  void xe_lmtt_init_hw(struct xe_lmtt *lmtt);
> +void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt);
>  int xe_lmtt_prepare_pages(struct xe_lmtt *lmtt, unsigned int vfid, u64 range);
>  int xe_lmtt_populate_pages(struct xe_lmtt *lmtt, unsigned int vfid, struct xe_bo *bo, u64 offset);
>  void xe_lmtt_drop_pages(struct xe_lmtt *lmtt, unsigned int vfid);
> -- 
> 2.47.1
> 
