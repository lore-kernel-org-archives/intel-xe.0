Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91520D1119B
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 21:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546AA10E6DC;
	Wed, 26 Nov 2025 21:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0eokTCC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E2310E6DC
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 21:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764193995; x=1795729995;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1ws5Ll+owvFd3yEPDInQJeBGu2MSToIZyicnRxj9IGU=;
 b=l0eokTCCMhFnAUgzKwhAwZCW1k6N73/pZuCOTvxuI5TUDrF+vYPMGm5M
 iFj6J646Hfvkix5AaUW2ITy3yIWo14pGxDA/Qgebl0e2IVW7ZeE2hciPD
 NC5RlJX4mrZOpqyHYTRYsO44obNT6kQTQU/T9h+P1GGnAiNSFsR8Ms6M1
 3Ger9w5A6WBW41SR6Bp4aZHENfUZPmv/wjMg2YeUMsClZXFKdmLJNwHUt
 6fbGDJoKfJjD4rQqLfV+spfbHheQnX5QMVS1G/hb9OCw2Ch2Y2sVz9jgS
 etJXwCP5vyl1Kwz/cbfhqPRKQWddjtJyp2YhJIrVHJ865O6aafmF15eZC w==;
X-CSE-ConnectionGUID: PchVktexTqmivHHGfGpL2g==
X-CSE-MsgGUID: bG8Wd3LvQGuah6BgVT0z1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65949940"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="65949940"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 13:53:15 -0800
X-CSE-ConnectionGUID: VwwR+yegRdKja26TAgrqHw==
X-CSE-MsgGUID: YjZv7eEOSUCmPmFEt9OABA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="198009339"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 13:53:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 13:53:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 13:53:13 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 13:53:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gilw+HyBLc6COLnRpiFdGQ/tbY9Xw4Lw8+VigdCbhICpQz9cxqB/SZ4sWtnwE2AfSVCXbTqQOpaSHTBo930Y9p9yIaNhfsMRRgIPhUoNn1swOUgHH78krpkphhNxGevtMInx4KijiNw+rys7Fv/6PBAaUwapm7KB3PJS+bB5xo4GwtsK16CVQCcX0F+qpX4jZ7Q2IcqFj+QkVIIbcmLjdCWjIayy4r+EBd3TbEbjqrsy0maMDgkCQ79XASF3dySp64giPYiVieLcsb50rGcl4Z1CxIzHs+7TH9qqqHF1fDd9GYb1ewJgMGws8lvCaDKecBG6MaIiK0smEjx9+tfbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o23V29qTgLHqoEqpo34NDpC/YxOUMBVSMWx1RLFNncI=;
 b=JYzWJN1VWA4uvB1kDuYmWTnmtTgfKZg/bi2eeB9t3ZVvDOh1jRAS7jAzwIGiaAz6LM/EbuuPNiNi3qPPz26LCqSy82W3FcmPH4LVrHpq/8mAC4Is8/zORNFBWALfx5N7wW+4P6UAVW+DOgxfxJnL64BeS9Iu39yi9uGw93O6AzUZNaZbCIGzb8wUMDouIgCSiqk7AZaL/DWziFnErVSJ3eqkO/hjkErOWjR2C5vmd0DxpP6jqTrEjnNfyovZ9ofIG2hmnCZ1n1QhgU3KX+O1LuzzrFAcNEPIwYaFisUJk5qRIHqHMWXXsF2qQVSL3BJaurSavXnuNOJQ6ALq0mdK6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB6809.namprd11.prod.outlook.com (2603:10b6:303:1e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Wed, 26 Nov
 2025 21:53:10 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 21:53:04 +0000
Date: Wed, 26 Nov 2025 13:53:02 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/xe/rtp: Whitelist OAM MMIO trigger registers
Message-ID: <aSd2vnWOaUXcBlIK@soc-5CG1426VCC.clients.intel.com>
References: <20251126035220.13089-1-ashutosh.dixit@intel.com>
 <20251126035220.13089-6-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251126035220.13089-6-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:303:dc::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 841ad38c-eb13-471b-bf5a-08de2d362d66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emZxUVdyZWw4N21NZU1yNDNBQmR3Ykc2TFdFZ2VBRXdsQmtYVXR4VEhVbTVS?=
 =?utf-8?B?eGlwSUxxRy9ublZoVEh5Ti9mMFcrV2ZxdEtqT0hFVk9ZZklzYmI4TWVEWGJx?=
 =?utf-8?B?cUdyVUVuRzlQZG1vV1FudFlKa25nVS8xR1pMUnNLYTRoUzdRY1ErQkZndUhM?=
 =?utf-8?B?QVlSNDN4c1hzQVhsUEtYOGNUTEl4Q2QzNmJLTVZvTEhtQWVKRzBoQ1c5WXBF?=
 =?utf-8?B?VDlJdHZKSE9OSEZ4azFmRzZ6RWxjeGQ1UXBLSVVaeWkrNlZpem5LUXpROEc4?=
 =?utf-8?B?cnhQL0xaKzYydlJVc0FtbjdPUGpiZ3pSNGNxRkR5T3VvYWVFSzhDU3kwOVo0?=
 =?utf-8?B?UGQ0Nmw0WlZxMkl4YzBzVkRNQklCbGFtSkhiaVR2ZDN3RWJMcm8zcG1aL05K?=
 =?utf-8?B?QnhqM2hUZWNBd2lkU2JybU52bFY4SzB5Q1RjT21mcDFaQk9EdVB1dmZLVlJH?=
 =?utf-8?B?WHJSb3I1aCtmZ1FNNFFHS1Zwa1VPa2M0VVo5dWpJWFhFRWVLR01QN1YyZFcz?=
 =?utf-8?B?Uk5pdUl3ejJwSzhZMlFnRjZSeWd3aTVJdWFZdnN1MmxiYmVwUFZGNFo5WmJr?=
 =?utf-8?B?WXBLQk9FRk5uT0h6OHh6L21vT2NMYXJicXdRNjM0dWcrSElWdlJUb0FYaHhQ?=
 =?utf-8?B?emEvbHkzS3Z6LzlETW5tcnlsVUxnMEl1eHNyMFdPeFo5bU1uKzk3UXdHYi9p?=
 =?utf-8?B?bmNGaFJKV01nbHZibDBiWFRPb0NTU0E2Rm8yRC96QWNmUWVLQWhNa0hLdUs4?=
 =?utf-8?B?S3EzWXVxUmtBYXNqcTJzejVldTZ1SlpZVjljalJOSGxxK0FIazlOQVJSTmpv?=
 =?utf-8?B?V3pFRXRxK0hMdUorNGZRT25rRjBVcWdtZm9CWS9kZ2dYZW1BdXNiUVlCZVlU?=
 =?utf-8?B?WitxTzRBNUU5MHN0Z2IzWlEyVm1nMkN3YTFhL1VzTnJQbzJXUGxqQnp5dERq?=
 =?utf-8?B?ZHVpcFNWNllibzBMUFJ5UUNzYkh3YWp1WG9rYnlXRlh6K3lFZXI0NldmWmZV?=
 =?utf-8?B?TGdqdDExZXU3bWZoQXdvQ2wxY3ZWZ3hQTmZqc3hEK3dGclFleng2MjYyNjcw?=
 =?utf-8?B?dXZ4c3JGVytoVnBhMDJHQUcwbldWWmNvM09halNONjh3QXM5bmtZWjlmN3Rw?=
 =?utf-8?B?VFVUdFZPUXlxeWMxYzZtK3pBMVJlMkR2R3NjekN4eVB6WGlUNEpaT05jUGZi?=
 =?utf-8?B?U1dHbUFoRUhyV21xTm5yZWVTbnh1MmFBUzZ2UXZqUkdVNjlNdzRWS0h6TGc2?=
 =?utf-8?B?aXNydDZOUjNvRlJ2QnBwRzJ1MFpTNDJ6SHFNQUV3ck5NTWtVTkl4NHArQUcz?=
 =?utf-8?B?SlhLelJlZGEwb2RuL2lmbDhxWENSRWZHd3BUTUJTNzNMT3BOSU9aUk9YSnZV?=
 =?utf-8?B?MWJ6OXVONGVrVEJka01CV2dSU1JhQXk5Tjc1MTF4ci94M08ycTZselUvYU9I?=
 =?utf-8?B?TWYxbExvSEh6emlZVG1maGlRS3RxTUFDZ2s3S251MDNEMXkyU0ViRStodktL?=
 =?utf-8?B?Mnd3aWttUXNIaEQ3U2RUSjR4Nzc0OVdXcmk0Z3JpQ2pzQytDc2ZxcXVwN2J4?=
 =?utf-8?B?aGw4d2JWcFRoK05NTURLRWlhb3BKR1JUZmVJbWZ0OVNPNHd3bDREQ0VzSmxT?=
 =?utf-8?B?NDBuMjIzcCt4eVFQdTE4Z1RFOXdMbGlUUXVZUG5yRk9iQ3pQSHNobG05VWxq?=
 =?utf-8?B?ajEvaVE5Tzd2RXlyMmhYampMb1I4ZUsrK2t6d0NUeFhWZlZ0TGp5V3lmaXJy?=
 =?utf-8?B?ZVFlVmxhTjZ1TFZNc0YxVjYwWUVjcHFOck9aS3FiWmFVRm1JcGR0SzNnajNr?=
 =?utf-8?B?K3JtUVpZbGc0MXZUb0VGTkZwcTFaVEZzczc5NjJLTjNhOWVQc2VoeTdjOWtx?=
 =?utf-8?B?TzRBVjFybWQ4YWdrYzNpSmMyZ1FRcTlHa1h4dzBwVmtvV25DMnBPb3V5em51?=
 =?utf-8?Q?CPBBJrlrb1x2uSMk1RFb3LgKzMAtICYm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1BFOXR3SHgyRTNmb3NzNXRFR0x3Ly9PSEt6S1d5dkR0aDRlQmZBZHdNV1R5?=
 =?utf-8?B?Rk9oTWRrRzl5dU1MZWpMQ1FzWEFLcDBNZkpBSC9DTnhhdWx5R2txWStsaFF3?=
 =?utf-8?B?M1phampFWnphSW9kM0FsSCtQN0ZocUlWYXJKWEtWSnJQeDV4b0FQb1NiSTRY?=
 =?utf-8?B?V3lOcUE3OE51NjFnN2wrTTE1aFJjMlg3ZVBhOUxEV0Evd01mclV6WDFjUEQr?=
 =?utf-8?B?TWJ2TXV5djhsaVduZjlQOXgvczVKRWpSV2ZUQUNWeGhPYnFkZzZ6UnQ1Yk9w?=
 =?utf-8?B?eVZEZnNkUEkreThxL3ErZmRLcmloM3luSWV6M1RQV2NiVjJDcE9tSEM1Slo5?=
 =?utf-8?B?eHVsbDRHOGJ5UFgyM2xBeWdJV0hDYVphY003MC9MV2pPWC9MREFnTUdtSy9T?=
 =?utf-8?B?ZlMzOUNOdHkyS1hIRmVxdTh0SGJiRlJabWVNS2ZUeUdGZk05d2V6WndDMVJr?=
 =?utf-8?B?a2hOdXVtdk5tYzFQWEs5WThFZWRoMFBxWGpqWmp5bDhDd3k5SnI1S0hzWWsv?=
 =?utf-8?B?K25pYUJURlhwSzB1c0RoTDdyTlliUm9LZnBWTm55VnR2dXNjaE12bEhZV0Rk?=
 =?utf-8?B?azRQZWtTWW1icTJFazAwMGxRWFQ0dlFJS1VEQmw0cnN3MFBmZCtPRlR0WUZM?=
 =?utf-8?B?SVhFbFRpbXk0N1p6ckFycHhDODduZkVtTHIrTGNhcTR4cFIvODVaMjVMUE8v?=
 =?utf-8?B?c1pxdkV4VDFMSndESDRLYVh1cHRHdDhmWEVJVUJ3c1BrNWcwcFRGbTVyOFFk?=
 =?utf-8?B?K0ZOeHRqL21ra09mTXFSNWx1Q1FCbmo4UXVyeWwwTlhpVlkwSlpWRWhYQmRm?=
 =?utf-8?B?UndwRk9HcTlQQ0k5WHk3TGpjekZ4YzlBUHZ6eUR3Tk5OeStOb3NxZlFhd2F0?=
 =?utf-8?B?TDhPOXhEL21aT0ZZY2VFRGtINlo3cENCS0xReHFjaUpTUVNobnBacE04bnhm?=
 =?utf-8?B?VWpNeS95eWxLdUVuTU52VUwwR3VmalRKNEZFRnVpdVhZSmpKcUc0S09MYkp0?=
 =?utf-8?B?ejM3QllQWmpYNXpwY3hpdWNiR1drWjdVSlhzcHQ5L1RpSDJEenExd1JITU1x?=
 =?utf-8?B?R1ArRmxkWUdFeUg5Nk5ZRHk5UCtOOElVc3M5c1FRSUVNUUVLbDlGbjZZc25n?=
 =?utf-8?B?SjEvOTlpcklKcHdubXZOTGJnUWFGS0ppUDFnMVZBNHFkeDhnWVQ5RG54bXht?=
 =?utf-8?B?b1lJZnZJMlJRTDlqME0vVWFNVTNsTEpvLy8vQlNpWWJWN21iVjI3cUZHdlhW?=
 =?utf-8?B?aCtIUW9SOXhYWDRRMVlTYkNkTjhCNGg4alhKQ0hubFRVdE9sMTZBTHVCSlpa?=
 =?utf-8?B?VVVnZCsvRi9oV0d6OVc4d09lSlVTQUtwNHlEVHZLNHJvbDQ4VHFUOStIWHJN?=
 =?utf-8?B?Yi9xMVNTU015ZGwxaUdUQlNtN3FtWlYyQnExVlpYVFQyVkhNdDRXSVA4aDRV?=
 =?utf-8?B?WHZaVE9qQVNHK2tyZmpnRXZXSllnRmlubG9UeVRGZVY5Y200OVRGZTlPZ2wv?=
 =?utf-8?B?K3cydzRGZWcwTFQrUWx6NEM2UWtxU2tLNm56cW1KbW1kZ05DN3dubllGdWJ2?=
 =?utf-8?B?VWtvNlZCN0lxY0l6YjlxSTkvKzduQUxKV3VLQWk0VVR4SVJneURxQjJiUnF5?=
 =?utf-8?B?bE1xVVdWV0RXY1ozcm5jY0RoSGlHTU1EVWZ3RkVMSHljY0N3azJNSG85VW9K?=
 =?utf-8?B?SUFKb2tmeDZuakNSZ1VIdFhXOElXeDBUK1RKZTd5MU9ST0lsL2g3aVN4QUtO?=
 =?utf-8?B?bFJSWGphb3dsS0syN3FuMGtGVU5QNC9YbkpFVXk5QjlwN3kvSTdrUVRFMTQy?=
 =?utf-8?B?c2RBcTBLdTNKRUxPQ0tnNU4zVXYxRElWblBHVXhydGxCSEZtaUp3SHlYYnBW?=
 =?utf-8?B?Z3lzejNndE9ERVp0YkxqM2xsQVhUZUJ5S3RvK3dvaW1yWGFSWm04MTh3U0dD?=
 =?utf-8?B?OUszSGdWTEEyc0Y0STVaQ1RRVTJxenZBUkd6WjdOZHBIaHhmZk5MM0tkbVRw?=
 =?utf-8?B?WlBxNUhVRHJzY2N6REIwQnFqR21FS3pXZ2ExZzNLZm5KN3NUQXhqdjc5ZDZI?=
 =?utf-8?B?ZjhsQ05NRjNwQTI3NGp3V0dOYjk1aGFJaWJmaThJSXhjZzdGMm9FNkhaSDlj?=
 =?utf-8?B?WVBkOUV2ZzdDUkNPZUpYbzZ4K1BlcEE1MXA3NWtsUTdoSjA4cEFlaHhlYnlK?=
 =?utf-8?Q?CaXw4xCy1u20b28pjGdgT0k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 841ad38c-eb13-471b-bf5a-08de2d362d66
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 21:53:04.7734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQdW7wPDZDN4lz5NRsy8blJHO8Q9Pb3to46kBSUq9fNKDddqZrSgdECK7Am5zo4fETWzkfzGaxLPYc0ChMMGTrXbJMiwKxIjrGESMolcWFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6809
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

On Tue, Nov 25, 2025 at 07:52:20PM -0800, Ashutosh Dixit wrote:
>Whitelist OAM registers to enable userspace to execute MMIO triggers on OAM
>units.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/regs/xe_oa_regs.h  |  8 ++++++++
> drivers/gpu/drm/xe/xe_oa.c            |  7 +++----
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 21 +++++++++++++++++++++
> 3 files changed, 32 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>index e693a50706f84..1d7908fc0ebae 100644
>--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>@@ -100,4 +100,12 @@
> #define OAM_COMPRESSION_T3_CONTROL		XE_REG(0x1c2e00)
> #define  OAM_LAT_MEASURE_ENABLE			REG_BIT(4)
>
>+/* Actual address is MEDIA_GT_GSI_OFFSET + the base addr below */
>+#define XE_OAM_SAG_BASE				0x13000
>+#define XE_OAM_SCMI_0_BASE			0x14000
>+#define XE_OAM_SCMI_1_BASE			0x14800
>+#define XE_OAM_SAG_BASE_ADJ			(MEDIA_GT_GSI_OFFSET + 0x13000)
>+#define XE_OAM_SCMI_0_BASE_ADJ			(MEDIA_GT_GSI_OFFSET + 0x14000)
>+#define XE_OAM_SCMI_1_BASE_ADJ			(MEDIA_GT_GSI_OFFSET + 0x14800)
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index d63c04e2d4922..cc48663c2b48f 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -2601,11 +2601,10 @@ static struct xe_oa_regs __oag_regs(void)
>
> static void __xe_oa_init_oa_units(struct xe_gt *gt)
> {
>-	/* Actual address is MEDIA_GT_GSI_OFFSET + oam_base_addr[i] */
> 	const u32 oam_base_addr[] = {
>-		[XE_OAM_UNIT_SAG]    = 0x13000,
>-		[XE_OAM_UNIT_SCMI_0] = 0x14000,
>-		[XE_OAM_UNIT_SCMI_1] = 0x14800,
>+		[XE_OAM_UNIT_SAG]    = XE_OAM_SAG_BASE,
>+		[XE_OAM_UNIT_SCMI_0] = XE_OAM_SCMI_0_BASE,
>+		[XE_OAM_UNIT_SCMI_1] = XE_OAM_SCMI_1_BASE,
> 	};
> 	int i, num_units = gt->oa.num_oa_units;
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index e8e47aa16a5df..da49c69076a47 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -83,6 +83,17 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
> #define WHITELIST_OAG_MMIO_TRG \
> 	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
>
>+#define WHITELIST_OAM_MMIO_TRG \
>+	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SAG_BASE_ADJ), \
>+			      OAM_STATUS(XE_OAM_SAG_BASE_ADJ), \
>+			      OAM_HEAD_POINTER(XE_OAM_SAG_BASE_ADJ)), \
>+	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SCMI_0_BASE_ADJ), \
>+			      OAM_STATUS(XE_OAM_SCMI_0_BASE_ADJ), \
>+			      OAM_HEAD_POINTER(XE_OAM_SCMI_0_BASE_ADJ)), \
>+	WHITELIST_OA_MMIO_TRG(OAM_MMIO_TRG(XE_OAM_SCMI_1_BASE_ADJ), \
>+			      OAM_STATUS(XE_OAM_SCMI_1_BASE_ADJ), \
>+			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))
>+
> 	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
> 		       ENGINE_CLASS(RENDER)),
>@@ -93,6 +104,16 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
> 		       ENGINE_CLASS(COMPUTE)),
> 	  XE_RTP_ACTIONS(WHITELIST_OAG_MMIO_TRG)
> 	},
>+	{ XE_RTP_NAME("oam_mmio_trg_vcs"),
>+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, XE_RTP_END_VERSION_UNDEFINED),
>+		       ENGINE_CLASS(VIDEO_DECODE)),
>+	  XE_RTP_ACTIONS(WHITELIST_OAM_MMIO_TRG)
>+	},
>+	{ XE_RTP_NAME("oam_mmio_trg_vecs"),
>+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, XE_RTP_END_VERSION_UNDEFINED),
>+		       ENGINE_CLASS(VIDEO_ENHANCE)),
>+	  XE_RTP_ACTIONS(WHITELIST_OAM_MMIO_TRG)
>+	},
> };
>
> static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>-- 
>2.48.1
>
