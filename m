Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82BAC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 04:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC20113076;
	Tue, 23 Apr 2024 04:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EuY9yFFw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BCA113077
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 04:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713845899; x=1745381899;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=DENVJTRQbBvbUX1MB918g97ZkU8h5lwhzoHMljWWIfU=;
 b=EuY9yFFwy4whUO9Kh5PBSFTCzkUkosQWOfaG9uhiRl7ymPi8yC/SdedZ
 +N6qUXOKAcBjNOf+UW5CZuUSHehc2zyP6ihjbuzFM1Zqrx+QyvTUR75NS
 oxOWhRv4lHsbIC/UYMrLSzVdkgO6Y9RsucSgtJKCXDslLmPVJWJWlaYS0
 t+Rz4P+JjmckKhr0tU+/94V4A11bYOKy6MpE5oO4U4DvUdihxRTlQr7yL
 rwCpX5anMKMezfQQ/NAD3TsvfhBAtJtWKVy4gl3cG3VcnQnbYCiciNCS1
 YqMylu10T5kLSPGjuLijfXS9ZBPnWHPsFs8H/TK6giO/nMwwS+C9WinUs Q==;
X-CSE-ConnectionGUID: w7hR7yUYRe6/wjA4/6/vhg==
X-CSE-MsgGUID: iHQAydObRpGCarMAlxIOYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="12348910"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208,217";a="12348910"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 21:18:17 -0700
X-CSE-ConnectionGUID: 8DDdeklvQNyV7JNdOk0eGQ==
X-CSE-MsgGUID: 8anSHpKITkG4vAZ8UGNIlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208,217";a="24295604"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 21:18:17 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 21:18:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 21:18:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 21:18:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/ulf2ZPsu790w+sKg3Ba+mRIAjTRAwI5a8/sAL6/7O1TsHMh1PGEuIR/xJjuwlahEKYdkzj/msVIQy0ZXO4aUXVaohvWr/LI9FXKElEeRkaTPSXJ+SXpEI96JDO+Z50F5Rr93Be2Fu9ZdjXnu6pxbDrGUKhZbiUyPH8RU+w4UT49XW07im0wjgOF3PcBo3/wyW52vyoFFprsU7Us0xoZ1NMg0nLfejhkcjfo3M0xPMsqJUsoMMFTt0erUqtOqB3zRZkQHeNBphC4HBZsQdaTmkueHqKHsAWLNxMyBFAiZng4ScGaHeorzOuzfhZ1EUbDNO3CrnMbg4xT0ucLxTI+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HyjKXZy9b5WQcDMvYUpiRTW08XRjhAXhacI1XkSue0=;
 b=lFgum6dF1wRRSEJmZ92OdyPx9pLb1vAm/F60z0xjIO6THqXUBPjeDA0zfAAf2MeXbLN8dWSWuCIjvjNW9ol+B99UI3IsWM9IHE0rrQHtdO085MuaRIbAHy9ldkrAEFrgutNZX//V/pKBg7mi4iLnAtRgf0vZoB36KgmFOrBF01/JyIlgEsHoRy4ckLGd9Evw6Me6EavLhjVSBjexQUA6F0SOMeItupVVNGYZJJ3oWNRUElXAIUUe5FDULyHNgTIM0QijODfVkSnNJHLo9FLGmiU7/dA0YUDXaXK0dwCrx44jN8Ud41Z80EHgEb46vuQyCLNpJtgePS970C8KcwQD5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM6PR11MB4740.namprd11.prod.outlook.com (2603:10b6:5:2ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 04:18:12 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 04:18:12 +0000
Content-Type: multipart/alternative;
 boundary="------------LOsTDy5oodNU3KFA6uq9sBUq"
Message-ID: <53fbeb30-53be-45af-9ac4-8e8c21f8a35a@intel.com>
Date: Tue, 23 Apr 2024 09:48:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe: Save and restore PCI state
To: <intel-xe@lists.freedesktop.org>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-3-aravind.iddamsetty@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240422065756.294679-3-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: PN3PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::9) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM6PR11MB4740:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f52df46-8324-4345-839b-08dc634c637d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dG9OY0MzV0xDdWdmckVMbUpBZit4dmdZR0JtUnMwRllISms3L20rajNmR3Bo?=
 =?utf-8?B?YTZSczBVZHo5cVJ0UzNKZjBCQTJ1T1ZUYXp6WnpYMUFEV3dsU3RqaEdaUkgx?=
 =?utf-8?B?bXNKa0owREdqa2tlWGNDWUlNMlAvaGJiNDlzaDdoRFUzamdGWDZrMkJTMTk5?=
 =?utf-8?B?TTRkbm51RW1qMEFzd3Vqa2xYRXIyWG93ZTZOVlRVVFJ4V3cxYTBxNTlETmVp?=
 =?utf-8?B?cXZPN3cySTFPcU9iL1JsWmErYnpTaGhGZ3NCZ1MrNlYwc0pvUUhHZGxBby9n?=
 =?utf-8?B?VXRES1lvdDhVVXAxRWs2L09yalFPMG5QWWx0bnNpRGVXNHpCVStCNk1XM3dB?=
 =?utf-8?B?RHZlRXNtT2ZhOG1BLzBjcjdlYUpjTzl2UWVZVEZabTY4M0lSN00ydldxYWtD?=
 =?utf-8?B?OWljL0hmV1MwTkVCUVdVblkwb01udlgvNHZTalY4RUJZQ3M2SVhVZzM4WTd2?=
 =?utf-8?B?QjREVlZXSGREa01qcWRnWFZ1YWttUEx1aW11K0dmWCtHNnBzYlhNOXZmMXZJ?=
 =?utf-8?B?UEU3T2VES3FweUxsUkJYaktQRFVvL2JZNUgxd3ZsaWZtZDlBNTFLdGw0UUEx?=
 =?utf-8?B?aEdBQXV4Mk5MeXMrRnR2RllyZ1IxNXV6S0NhRHlDSlRSaFlreVhpZXVuQ3Qw?=
 =?utf-8?B?RXlxL0U2QWxYaXpzdGpGbjZQUW9XK1o0MlU1WWJVZjJYampqOGFQZTYyTlQ0?=
 =?utf-8?B?MXdsakhMSS9pQWl6ZnRLaFZON2RSMHdnc0JSQ2lLbkovN3dkblJLaTlWazBy?=
 =?utf-8?B?Zkg0YU1VSHovNUtBY1FLKzJEbjM1bkVtSjJBVVAvQURiRzFHd3Z3OXhmTkZz?=
 =?utf-8?B?OXRTZlQ0S2ZLUjZnTHNJSjJOQ3Vma2F4MTFsemVvK3RaVGhmOXc0Sm5rbG5q?=
 =?utf-8?B?cHdFWGI5LzJZcGNCT0VkTS81S3orT1VDaHEvQzBnQzZEY3ZqOVJBdjlsZ1Bs?=
 =?utf-8?B?VWNZRURqZ2RreUpWSkprWmx6YmppSlFWNXRQVkpKZDhkUU5DakZKd2VWbDZq?=
 =?utf-8?B?ODBmWjN4dnVHS3pHSVpQYkEvNnB5MHpPQnhEOXZUU1ZnRzR4ODBoYzZPa1dR?=
 =?utf-8?B?L0pzNExya2ZPRmpvZFRETUtsenhJcUJIMjFRQ1BKb1dPMFI4eUJQUEViRjFW?=
 =?utf-8?B?bjJXNHZGSEVVUE1rZ1U4TFpiRFJYUUFFU2EwVjNlMk9zaXA4K0xYNDU2ZFFh?=
 =?utf-8?B?TXFFcFROVGUrWEhlY0syMzlhemdsK2pyY09zRVJhakRxMTRyMzRLNG4xNDB2?=
 =?utf-8?B?WmJxYUZ2WGhQRzZ1WFp6NDFuUHNGejZZdzVOWjlVYXNWTEJaSzJsZndELzA0?=
 =?utf-8?B?ZERhSHVKQUxQeTRZNThURG52d3FEa0s1NWxIaGMxSjB6L3JJR0RwbmMvVjdV?=
 =?utf-8?B?eUhsUDlNMERubXl2SFZzRjhIQnl3SUhjblNYNmVCTEZ5eXM4ODR5TlA5K2JT?=
 =?utf-8?B?L2FPQmc4c1JaV2hvR3NsL3ZRTHExdVgzajRNTE5VTFN2WlpSb1gxbHRUbFgy?=
 =?utf-8?B?ZDNzSVBqVHMyTEJta25OdzhLMDJwblpRcHp6SkVxbjhkeUlZOFJhdnhwVGxr?=
 =?utf-8?B?Ym9KZnNUclpPczYvZ0NRMm55a3FGOHZta1pZdjU3T3AvczA0N2dLRDB3QUth?=
 =?utf-8?B?VS9CZ0NkTVM5UU1IRE9IUFpNdC9nMEZ0dC9IT0lEYUdDZ1pha1VHR2gwRmdm?=
 =?utf-8?B?amFKdjJLTElwZjAwNm9rQlRJeklvSkhwUG9YREpOL0IxL0NaRG8vSkxBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3JYalVnUEt6NjBkMzRRY240aHhiczVJazNjc1V1V0V1bjVDVnh6QlU1NUY2?=
 =?utf-8?B?bmtNR1FyUTR6VVA0VzlXMGJtUVNJYjBsMmUreGdETzZla1NaYVkzQ2RzS2l5?=
 =?utf-8?B?MUt5bHZCTDFjWGJ4UU83R2JiNnVMaGZlUkxlN2RkS1lxaXVJNVgrTm1kaW1a?=
 =?utf-8?B?cm1MUnFVcm5ZYzE5VU1yVndNWHhIdERsMmV4WWM2V2xrRVY0Tk5JV2ZmUC9V?=
 =?utf-8?B?QlloUzlibmlxRERKbGZZV1dIeklWTFdFUDV2Z3RaZmFsano2TWpROHZDUExU?=
 =?utf-8?B?L1FzcFRVQnVGYkpCczh2QlNRWXYxbUJpQUVzZFhRK1QwMis1OFBoVUM1VWN6?=
 =?utf-8?B?SXpFVVBzYkpFazY4VlhiTkRWc1htVUtVS0VGN3U4T2lta3hSRmwveU9TNnZi?=
 =?utf-8?B?S0FwSHQvTUFDNDZPbGlLSTc5OEZoRnRoZEpiSTBSVEVtTmx1b0NIZzhPUGtI?=
 =?utf-8?B?dnJEaUdEWklFNGhMU1Qzbm96NUVNL3BsWlpxQXQrbjluK2p3eVJlODA3OGFx?=
 =?utf-8?B?L1BvUEZ4bExsN3J0b0d3Z3BJZVpqRFhqMDR5TFpYS1ZPdk9VQ0NabmduUUJ2?=
 =?utf-8?B?dWFjTUd4elZNOTYzTTdMSlJzUlZaaHpEeUlFejE1L3BmN2J5WExESzFUZTFm?=
 =?utf-8?B?YnhaTzhIQ3prS0hWekJCZGRCZEl5VWtpSGFBRjhVbDNra3A2ZnVuVW52VHlC?=
 =?utf-8?B?VHFYbXRNcEhRbzY3UFh3Y0pFOWduY3djQ2licHFuNG1ZYlExdURoc0tKQWlP?=
 =?utf-8?B?TTVlUU9pbXNsZkM1VjhjMFdoaE40ZTZPRjdvM3p3V0FwdXloUC9GZkRESFFE?=
 =?utf-8?B?RmJ1MWh6WjdXdXNibU9nSnZ2ZldjQXJ1RTAvSkM1NkhFTVQvNlBwY3pwbDVO?=
 =?utf-8?B?NGhpTnlNMUpwOGhTa3IxM3ozSXBmSXg1Vng5Q2RsNnZPcDBkWEw2Umg0UHNn?=
 =?utf-8?B?clpwZGFJemh5U3NFTEY2VkFBZDR3a2JXWGpIYXFHV3F6ajhCQ2Q3MG1PSVU0?=
 =?utf-8?B?b0lEaVBORUlOcEhVSis4UHlyTWV6bTZYcWFsYmlUWDMraEpyYVQ2QytaMEtn?=
 =?utf-8?B?NlVKZEk2MG5xMDBOenkrbUZUdWw5SC9TazM5NmZjZ2ZVdDdtbi8vbWcyMnB1?=
 =?utf-8?B?TTczZ1c2ZzJXNUlpUElQeWp4NGtDZUlMY1pPZDBjeHJOZGU2MTBmcXFFaFhX?=
 =?utf-8?B?MS9KSGdNcCs1RUZVTjEyazFtdDFRNHgwVnRuMzFObTYzYlQ3cjEwMUFTaVVE?=
 =?utf-8?B?bzZtdUtsejQzc2I1YW5EL3JVd0VjMUs1blE3WWVkd2FjOGZ1WmNCcmVmcjhU?=
 =?utf-8?B?Y1hrbGk5KzE1SG9rb0xtK0VISFgwbE43ek5WaG8zMllYbjhvcGpzNmdwNXhm?=
 =?utf-8?B?bWNrQi9sbGlYUDFyVlo1WStnY3BiT3RpejlZTnd2cmhaVVh4VGVQL1FwYkRn?=
 =?utf-8?B?K0VVbmRxN3JJdFpjSFNrSmtqSE5BVy9kanprUjE0UVR0ek4rSWRpRDVMZjJx?=
 =?utf-8?B?SUZYUWczc1BYUWVjZmwvazdsYXF3aFoxVGpObUVmWnYrOHF4aW1PZmtHcVg1?=
 =?utf-8?B?RXBHTjQ4cXNpRC9MYVZSY2FySUFMRWVmeVo5MDB1MWluWjlUK1J5emVhK3lu?=
 =?utf-8?B?WFM3UGViT1ozZ3dNK2hPOU40VUE5Rzh4Vlh2Z1QxQW96Y0JISmYxSEVBNjFh?=
 =?utf-8?B?dFRNbmhWa3Z1b3ZOYU4va1lXQlJzVWwzTlpNMG0ramtxanZDTnI1VzhWVlpP?=
 =?utf-8?B?T09KZXZEb3JMKzFUS0FjVkFRMXNMRHdtelRJNUdFVmk5dnpyaXBjcWtJRVpZ?=
 =?utf-8?B?OWxmNG42T1RyVStLbUd4V0J2RDN4SFpmU2RxUU5DNDRDWmN2TXU5M2grdXpI?=
 =?utf-8?B?M0lFeURyajJiWHFjWXkzWEx3MUp3L3p4Q2xLUFZGYVhxSDBPbjdEQVFPVG51?=
 =?utf-8?B?K3BDbTUrNktCZ1JVUzFkMHZqakN5N2xaUE5aREJaekJXVkhNQzN3NFJqajRR?=
 =?utf-8?B?T1haZHhjaE5WTmFhM1dRaVB0c1pkUUdhOUJUOS90Tno0QXJiaHdRRGNhVWU2?=
 =?utf-8?B?QjhaUmpnYjJDVXRxRm1VNC9ZdG9pZUk3M1FSYzg5YjluNG1lZkhxdzJ5Rjll?=
 =?utf-8?B?UWwvMWozNW1zRXM1WHFjMEFQNTFZbCtHaEtTaVo5Nmw2OERDT0JOREozdmVi?=
 =?utf-8?Q?8aXYTwbJ1Udfm2AS13fZp4Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f52df46-8324-4345-839b-08dc634c637d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 04:18:12.0405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lOb4nMYGzeT6sGiLr7z+ZKNItTaZgeC2vKleWlDPhlA5LHNFsQhCq+SwF8Wzpw44ETkVOQAjBWjuptdHf4kY0i7bRHx/RBm/dbtg0QenuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4740
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

--------------LOsTDy5oodNU3KFA6uq9sBUq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 22-04-2024 12:27, Aravind Iddamsetty wrote:
> Save and restore PCI states where ever needed.
>
> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
>
> Reviewed-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Signed-off-by: Aravind Iddamsetty<aravind.iddamsetty@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  3 ++
>   drivers/gpu/drm/xe/xe_pci.c          | 48 ++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_pci.h          |  4 ++-
>   3 files changed, 51 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8244b177a6a3..0a66555229e9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -462,6 +462,9 @@ struct xe_device {
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> +	/** @pci_state: PCI state of device */
> +	struct pci_saved_state *pci_state;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index fb20c9828563..a62300990e19 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -393,6 +393,41 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
>   
>   #undef INTEL_VGA_DEVICE
>   
> +static bool xe_save_pci_state(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +
> +	if (pci_save_state(pdev))
> +		return false;
> +
> +	kfree(xe->pci_state);
> +
> +	xe->pci_state = pci_store_saved_state(pdev);
> +	if (!xe->pci_state) {
> +		drm_err(&xe->drm, "Failed to store PCI saved state\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +void xe_load_pci_state(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!xe->pci_state)
> +		return;
> +
> +	ret = pci_load_saved_state(pdev, xe->pci_state);
> +	if (ret) {
> +		drm_warn(&xe->drm, "Failed to load PCI state err:%d\n", ret);
> +		return;
> +	}
> +
> +	pci_restore_state(pdev);
> +}
> +
>   /* is device_id present in comma separated list of ids */
>   static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
>   {
> @@ -698,6 +733,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
>   
>   	xe_device_remove(xe);
>   	xe_pm_runtime_fini(xe);
> +
> +	kfree(xe->pci_state);
>   	pci_set_drvdata(pdev, NULL);
>   }
>   
> @@ -798,6 +835,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
>   		str_yes_no(xe->d3cold.capable));
>   
> +	if (xe_save_pci_state(pdev))
> +		pci_restore_state(pdev);
> +
>   	return 0;
>   
>   err_driver_cleanup:
> @@ -849,7 +889,7 @@ static int xe_pci_suspend(struct device *dev)
>   	 */
>   	d3cold_toggle(pdev, D3COLD_ENABLE);
>   
> -	pci_save_state(pdev);
> +	xe_save_pci_state(pdev);
>   	pci_disable_device(pdev);
>   
>   	return 0;
> @@ -873,6 +913,8 @@ static int xe_pci_resume(struct device *dev)
>   
>   	pci_set_master(pdev);
>   
> +	xe_load_pci_state(pdev);
> +
>   	err = xe_pm_resume(pdev_to_xe_device(pdev));
>   	if (err)
>   		return err;
> @@ -890,7 +932,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>   	if (err)
>   		return err;
>   
> -	pci_save_state(pdev);
> +	xe_save_pci_state(pdev);
>   
>   	if (xe->d3cold.allowed) {
>   		d3cold_toggle(pdev, D3COLD_ENABLE);
> @@ -915,7 +957,7 @@ static int xe_pci_runtime_resume(struct device *dev)
>   	if (err)
>   		return err;
>   
> -	pci_restore_state(pdev);
> +	xe_load_pci_state(pdev);
>   
>   	if (xe->d3cold.allowed) {
>   		err = pci_enable_device(pdev);
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 611c1209b14c..73b90a430d1f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -6,7 +6,9 @@
>   #ifndef _XE_PCI_H_
>   #define _XE_PCI_H_
>   
> +struct pci_dev;
> +


LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   int xe_register_pci_driver(void);
>   void xe_unregister_pci_driver(void);
> -
> +void xe_load_pci_state(struct pci_dev *pdev);
>   #endif
--------------LOsTDy5oodNU3KFA6uq9sBUq
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 22-04-2024 12:27, Aravind Iddamsetty
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240422065756.294679-3-aravind.iddamsetty@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Save and restore PCI states where ever needed.

Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>

Reviewed-by: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Signed-off-by: Aravind Iddamsetty <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@linux.intel.com">&lt;aravind.iddamsetty@linux.intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 ++
 drivers/gpu/drm/xe/xe_pci.c          | 48 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.h          |  4 ++-
 3 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8244b177a6a3..0a66555229e9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -462,6 +462,9 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/** @pci_state: PCI state of device */
+	struct pci_saved_state *pci_state;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index fb20c9828563..a62300990e19 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -393,6 +393,41 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
 
 #undef INTEL_VGA_DEVICE
 
+static bool xe_save_pci_state(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+
+	if (pci_save_state(pdev))
+		return false;
+
+	kfree(xe-&gt;pci_state);
+
+	xe-&gt;pci_state = pci_store_saved_state(pdev);
+	if (!xe-&gt;pci_state) {
+		drm_err(&amp;xe-&gt;drm, &quot;Failed to store PCI saved state\n&quot;);
+		return false;
+	}
+
+	return true;
+}
+
+void xe_load_pci_state(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pci_get_drvdata(pdev);
+	int ret;
+
+	if (!xe-&gt;pci_state)
+		return;
+
+	ret = pci_load_saved_state(pdev, xe-&gt;pci_state);
+	if (ret) {
+		drm_warn(&amp;xe-&gt;drm, &quot;Failed to load PCI state err:%d\n&quot;, ret);
+		return;
+	}
+
+	pci_restore_state(pdev);
+}
+
 /* is device_id present in comma separated list of ids */
 static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
 {
@@ -698,6 +733,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
 
 	xe_device_remove(xe);
 	xe_pm_runtime_fini(xe);
+
+	kfree(xe-&gt;pci_state);
 	pci_set_drvdata(pdev, NULL);
 }
 
@@ -798,6 +835,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	drm_dbg(&amp;xe-&gt;drm, &quot;d3cold: capable=%s\n&quot;,
 		str_yes_no(xe-&gt;d3cold.capable));
 
+	if (xe_save_pci_state(pdev))
+		pci_restore_state(pdev);
+
 	return 0;
 
 err_driver_cleanup:
@@ -849,7 +889,7 @@ static int xe_pci_suspend(struct device *dev)
 	 */
 	d3cold_toggle(pdev, D3COLD_ENABLE);
 
-	pci_save_state(pdev);
+	xe_save_pci_state(pdev);
 	pci_disable_device(pdev);
 
 	return 0;
@@ -873,6 +913,8 @@ static int xe_pci_resume(struct device *dev)
 
 	pci_set_master(pdev);
 
+	xe_load_pci_state(pdev);
+
 	err = xe_pm_resume(pdev_to_xe_device(pdev));
 	if (err)
 		return err;
@@ -890,7 +932,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	if (err)
 		return err;
 
-	pci_save_state(pdev);
+	xe_save_pci_state(pdev);
 
 	if (xe-&gt;d3cold.allowed) {
 		d3cold_toggle(pdev, D3COLD_ENABLE);
@@ -915,7 +957,7 @@ static int xe_pci_runtime_resume(struct device *dev)
 	if (err)
 		return err;
 
-	pci_restore_state(pdev);
+	xe_load_pci_state(pdev);
 
 	if (xe-&gt;d3cold.allowed) {
 		err = pci_enable_device(pdev);
diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 611c1209b14c..73b90a430d1f 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -6,7 +6,9 @@
 #ifndef _XE_PCI_H_
 #define _XE_PCI_H_
 
+struct pci_dev;
+</pre>
    </blockquote>
    <p><br>
    </p>
    <p><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
</style>
<![endif]-->
    </p>
    <p class="MsoPlainText">LGTM</p>
    <p class="MsoPlainText">Reviewed-by: Himal Prasad Ghimiray &lt;<a href="mailto:himal.prasad.ghimiray@intel.com" class="moz-txt-link-freetext">himal.prasad.ghimiray@intel.com</a>&gt;</p>
    <p class="MsoPlainText"><br>
    </p>
    <blockquote type="cite" cite="mid:20240422065756.294679-3-aravind.iddamsetty@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
 int xe_register_pci_driver(void);
 void xe_unregister_pci_driver(void);
-
+void xe_load_pci_state(struct pci_dev *pdev);
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------LOsTDy5oodNU3KFA6uq9sBUq--
