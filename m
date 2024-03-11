Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC3FC5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 10:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEBA10EB2A;
	Mon, 11 Mar 2024 10:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EYnQYTEB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A9E10EB2A
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 10:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710152331; x=1741688331;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=iX41sUYvyhfne306JxG3Tdg6ym0x7w5AIRHo/Zn1zns=;
 b=EYnQYTEBu3//DZT6Ye5VUa5VDOw72tm573g76Vg472Y2TpJQYk+0uoWi
 zLe9MpkFAlNh1T+S6W1M/GnXr788k84d5aS0c1ar/XBz7Wwot9GmTUyu8
 Q7A46jSWiVkAPcjJGvbrvNWPNyKBL3LlFrdpc9Dbu5l2YoUzRfdMI2tBY
 bg/b6J6D64ctJv18izT75sSIOULLZFsVFbom4uMLa/zcW1DH60rgdDgBz
 E9FBVPeIE9t7g2ZsJLQbQT2s25LRce2G1TVJsck+BR7OIWJ7Po23PhRn6
 wfSt8hISBJYpFHULnMBISrFRWCWenUTXRUofnHSq0LhrwrBP3YnpIDIgh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4931954"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208,217";a="4931954"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 03:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208,217";a="34267255"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 03:18:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 03:18:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 03:18:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 03:18:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 03:18:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfBjoo+k/H9N7Doqw6nDUmArtLNb+S58qUDPp7dBLCq/M2CiQVWcEvXIRJOcgdBuUt0H2QO+MR95JNvDEKct5DjrQVozg1/Q/9t07hKUn4B4hSut3VxzeeZKRCeRFEa7yqK0MDQQztiTzzjVko76k2zUQz5+7t2lcB9NW7oBk7BuV9ORZp4Jn0Mg4gkXHPXMEDlbZz0We55ddOe81hSvALaNxfJyXfiGp4KkjUqVasL/vpF3iSWSL9CH7hr76Ci1J3eJwC6zfxyOxjmsgkWA1CiXIzCunArs7geQroOoZj8WA3hlix5gEavdslXd6Qt0uAGNnfMwF0hLeio/suYE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLmIwmz/eTALnH+1ttxbMIi4yrkSN0WdPSh1r4TCY9o=;
 b=nvh4Si1jH26G8uxHVrTbEsZS99Xo+XdxVOzNtP6QmPMTm75S3HhrzbgrOLcgE7KQgEMKePeL9hxGhjzuTN90nkDBN4rFXtIVzUIjc6u49uB4edthiH3Jce1M0gDOgGM7Eqcne5Yq99Kn1Qlszk4fgYb2kAqBPVg23JfnS5oBttpd8DPpY4eSPPg1lwmNFSHwScbFga0sVPyLh7qE4gZq9ce6b1cTKwY1Z0bdTHGMuTvVFAKXBFe8Ci/3lVfE3v3db+J+dYsW9MhmL3+66QANtYrh7P7+rEL66kMxIaCWnQhz2AT4diWbxrbTfx2xsaRrIo0VMUIFIxomoD64fo6pIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 10:18:47 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 10:18:47 +0000
Content-Type: multipart/alternative;
 boundary="------------81MjUfhU86R9DJngRB0hbMT7"
Message-ID: <1ecdf83e-ef3e-43ef-ba09-6b5e6fc8cfc5@intel.com>
Date: Mon, 11 Mar 2024 15:48:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] RFC drm/xe: check pcode init status only on root gt
 of root tile
To: <intel-xe@lists.freedesktop.org>
References: <20240308085517.2030484-1-riana.tauro@intel.com>
 <20240308085517.2030484-2-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240308085517.2030484-2-riana.tauro@intel.com>
X-ClientProxiedBy: PN3PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::10) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY5PR11MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f03b82-8e0d-4456-8e41-08dc41b4a347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L1teQskgJEo7qtb4kGA/EzJCyIVyee2E8jZD+S9S4WkXo/cX7fugrkphCPeSVLAsQayiLERjR48llAJ20bvoqCNUk6pLiPul/UO2EHl4FStERfCfJFnC6LcoDFI4D0suqoYy+QqyyVM5KNE8UvsBpREk4qjE9YdPNzMM1wq9QPGM3WdAty/r3AlqDCtC84Si/7GhTFyyO2mULzZ1dzXwsMtfCv0xTz7sf3L14VQ7ha1yvAy3unpZgBmXBzOid2mAg965tUHEcerCcjm7fZnC8l7OvyswIa7Mal4vIiLEvJRa7U5Spa5ZnkXVB9VpJZ0y8joP9E/r2ArPkxfqaAOBApKtkhDFyRLtjs1x2Pc73pMvIV5OCw8wKt95ETQj4N/Raw5Kz6uZMZQj2BXKnlRCtC82GK0QHJi0XMxoxrqG5H7CN9Pj9vFZXUL3MD7kPKU40iKUygdlV4ODvvvKO9QjOJgyAwNwRo++sAOS4HLddpLFC2NzCalNHQHDvatmiQuKpE/cdqs8AMJgq5iX8UpY0FIjSevJHuVJXRxRLdfFRzMy/AAfmFJg7MaCWupANjFGio4zZttisxKC4AuLmX2QHBXHMoo+RfjGOC+FAW/mPduaLUDYWFXAQ7ALZ6J4oCyOQEB7LuarQHgEOYaDEygAhppmeMogFbwMrZu/CQrZTlk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDQ4cVR5blZpYWhNcDU5Wm1WRFBnQkpiV0pqUUtRRnUyVUhMblYrU2plaG9z?=
 =?utf-8?B?cVNiWjQ4NHhqL3ZrQytFT2dUajV1TEJSb0ozL0xyKzEvNVZubzdNVG9aSzNB?=
 =?utf-8?B?Y3V2aHBHbHAxVEJsUCs2SW9yUGliTXowWVRvRlBmRmRpQXhGT1BNODA5UnlU?=
 =?utf-8?B?OWx1aVRIVmgwMlV3OGMyUWliZ3NsUXROcGVsc0VabUlEV0p4MW4vRk84TFJS?=
 =?utf-8?B?KzBySWRBUFF6c1dNY3B3UVk1cGdhTU05ektQOGdiZ0NZckp5TEhxUzFpZDJL?=
 =?utf-8?B?TkcvbUREMEVQdjhPb3VidDd5Vm1QcXJtZ2lUazdrdGVibnZqNU0vNm1sSHRV?=
 =?utf-8?B?NDZtcjBhdk5ONFd1dkI4cTlyY0JjcEg5M2Q5R1Y2Uk40VzlxUzl5ZnRxZ09V?=
 =?utf-8?B?UzlCZUF1ZkhMMFViZFVoVGdrb1RvanM2QzVuZ29ZZjFZRlRXRklHOGNUd3pQ?=
 =?utf-8?B?a29ML3k1aU9NMUpXMWVFbUt2TEtZOEJJbWxiRDBaM0RMNk5hYVoxNzM4TXB0?=
 =?utf-8?B?TWdQeHdaVXE0YnFoTDZKTmVoWlJ5Tm9XQk83dXVWeEE3Tm9zbitXd1kwUDZm?=
 =?utf-8?B?cklKSzdGeDNhR05HQit1M09kTFM1NS9PTHhEcVBkdnhDSDl4LzZtY2pCdXVF?=
 =?utf-8?B?Vy82SmhsSFVDQklFVEZRdmJZMUpLQTgwU1NYUXhpTVozT1NIaXRuQjBvMzlK?=
 =?utf-8?B?MlJJT3VTVjllYVR1SDJVbmVEcWVPWUJNeWtVZ1NRZnlMeW90TmY1RGZYeWtT?=
 =?utf-8?B?WERXdm5NcFFtMytCUEJNZTV4VEIwTExWaFNhaXRycDMzWnVCMTYzTG1wNDd6?=
 =?utf-8?B?aWtrRXNmRThySGJ3ZW0zVmkrR0FuT2tZZHBLM2NuUXl1cTRybi9ubDhqb2Vt?=
 =?utf-8?B?VStqSVlEaHBhUWpZQUs5Wm4zV09xTVFHRFR0Mi85UUl1K2JlK2xzZkhmUStN?=
 =?utf-8?B?MkgvbTUzSndtUVdqaWxqWlRodkdNbXpxUkJoQ21NMU5DeEhLQ0U2R3h4Wm1E?=
 =?utf-8?B?bU00M0k3VjM3dGxDaUluVHRoOTFJSE1GRnh0aUIwR1AwTWdXRk5DSWNHSDdO?=
 =?utf-8?B?YWZGd3pCQWJMNERQUnlHT0ZOczF0TTdjeEVkM1dCK2hsK3RIQUJHOEFUUkFW?=
 =?utf-8?B?VHhhc3IyaEVhTndaTUJYWThUQy9STDdhMVArdU50aTNJN0V4VU55d1ZONnEy?=
 =?utf-8?B?MVZSODl4TkE2ckgxalp2ZENIeE5lMFFUSk1hbHV0dnA5RjRsUUtqUXhvOEUz?=
 =?utf-8?B?Rm44Q1J2ZllLaXdIeXRqZU55SGpXcWJlSWJxblh4akdyWU8veFQ3a1hnZnds?=
 =?utf-8?B?SGViSVlqdXdVZG1hK3kyQ1h4VnhEZEJZb1A3bTdPWmhKYVpPSUlFK2UyaEtG?=
 =?utf-8?B?cW81QUVLR0VRTjgvdXFocDFWd0FxWFpxNEh6WVdLRXJwVTBLc0twTzJNanVl?=
 =?utf-8?B?TkRzSDBTbFh3eFVmdHBDNFlDVFBna3F5aUFoYlBmMWRJVUY1dklvYWR1bWhQ?=
 =?utf-8?B?YmNYWWhrTUNwcUlJcFNwYUp4elltRjZ3eVFpQU91eUVuUk1YcE9mWHlCUGlO?=
 =?utf-8?B?SzJRZFJvSFJvTmhlT1NtZHByT0RBK0JnTFNuNTIyR2lzUzdvV3FhUjdxUTdP?=
 =?utf-8?B?N2ExK3o2UkZqd1JaYXB6emFES2g2TWRZQU90STBnVkt3dEJCa0JEYlE3VkRs?=
 =?utf-8?B?b3pEVEZ2cit6L09JM3ZqdDcwd3hKUnNtbm5HMHpYNW44ajlHMTI0M05jL0tk?=
 =?utf-8?B?V1FuYS9LTGdMbjFzZjBUY1hsNUQ5QmNTRkl5cDBzNVJZMVpORDMvdGQrMkZu?=
 =?utf-8?B?ZTR0UXB6aFN1OGVhZVAzcURQczM5dStLNkJvUENrWGFPQTYrYmR1QXBBTlNs?=
 =?utf-8?B?MFg0djk2UHQzWHNPSXVFMmQ5RzZjRitwQjIzOC9BWVVnTU1CZmJ4RGE0UzNW?=
 =?utf-8?B?M1h3ZENGNDRIWFBLZGVSaFdCNUV3NDRXVFE4NlB5cmsvRjdHSWZFTGVGdTFZ?=
 =?utf-8?B?WkVxdHVJRm1xQnBOekJLc24wT29VV21VQ2ZHcjZqY2hHam0zRE1PQlJUV25C?=
 =?utf-8?B?enFpQUNHUnRJMmthZ0V5K3JWcEFsbHJQN0JkUkhkUWVNL3RDajdVdTA3WDZ3?=
 =?utf-8?B?cFMvN0dPcHpRZ0MvK1MvYUtVS1BuM1lGdVBCVG9xemliUzRIbzFQcGFBcjlI?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f03b82-8e0d-4456-8e41-08dc41b4a347
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 10:18:47.2033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCRSxF8SIjsUp3RtWrKvlYT5yV+0ZXHMJ8UkjmFipWi7V3xXrrB+uv2fkAggnli38gw4EWtw5qe1M6bA/n5tqJ0APo26o/2ZG8FOEjv7vXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6138
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

--------------81MjUfhU86R9DJngRB0hbMT7
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08-03-2024 14:25, Riana Tauro wrote:
> The root tile indicates the pcode initialization is complete
> when all tiles have completed their initialization.
> So the mailbox can be polled only on the root tile.
> Check pcode init status only on root tile and move it to
> device probe early as root tile is initialized there.
> Also make similar changes in resume paths.
>
> v2: Add lock/unlocked version of pcode_mailbox_rw
>      to allow pcode init to be called in device
>      early probe (Rodrigo)

HI Riana,

Patch looks good. Can you please add source to mentioned info in the commit?

"The root tile indicates the pcode initialization is complete

when all tiles have completed their initialization. So the mailbox can be polled only on the root tile"

>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 21 +++++---
>   drivers/gpu/drm/xe/xe_pcode.c  | 93 ++++++++++++++++++++--------------
>   drivers/gpu/drm/xe/xe_pcode.h  |  3 +-
>   drivers/gpu/drm/xe/xe_pm.c     | 16 +++---
>   4 files changed, 78 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 919ad88f0495..83dd60f68566 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -413,8 +413,14 @@ static int xe_set_dma_info(struct xe_device *xe)
>   	return err;
>   }
>   
> -/*
> - * Initialize MMIO resources that don't require any knowledge about tile count.
> +/**
> + * xe_device_probe_early: Device early probe
> + * @xe: xe device instance
> + *
> + * Initialize MMIO resources that don't require any
> + * knowledge about tile count. Also initialize pcode
> + *
> + * Return: 0 on success, error code on failure
>    */
>   int xe_device_probe_early(struct xe_device *xe)
>   {
> @@ -428,6 +434,10 @@ int xe_device_probe_early(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	err = xe_pcode_ready(xe_root_mmio_gt(xe), false);
> +	if (err)
> +		return err;
> +
>   	return 0;
>   }
>   
> @@ -506,11 +516,8 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> -	for_each_gt(gt, xe, id) {
> -		err = xe_pcode_probe(gt);
> -		if (err)
> -			return err;
> -	}
> +	for_each_gt(gt, xe, id)
> +		xe_pcode_probe(gt);
>   
>   	err = xe_display_init_noirq(xe);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index b324dc2a5deb..6c0009fcd2fe 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -43,8 +43,6 @@ static int pcode_mailbox_status(struct xe_gt *gt)
>   		[PCODE_ERROR_MASK] = {-EPROTO, "Unknown"},
>   	};
>   
> -	lockdep_assert_held(&gt->pcode.lock);
> -
>   	err = xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_ERROR_MASK;
>   	if (err) {
>   		drm_err(&gt_to_xe(gt)->drm, "PCODE Mailbox failed: %d %s", err,
> @@ -55,17 +53,15 @@ static int pcode_mailbox_status(struct xe_gt *gt)
>   	return 0;
>   }
>   
> -static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
> -			    unsigned int timeout_ms, bool return_data,
> -			    bool atomic)
> +static int __pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
> +			      unsigned int timeout_ms, bool return_data,
> +			      bool atomic)
>   {
>   	int err;
>   
>   	if (gt_to_xe(gt)->info.skip_pcode)
>   		return 0;
>   
> -	lockdep_assert_held(&gt->pcode.lock);
> -
>   	if ((xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_READY) != 0)
>   		return -EAGAIN;
>   
> @@ -87,6 +83,18 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
>   	return pcode_mailbox_status(gt);
>   }
>   
> +static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
> +			    unsigned int timeout_ms, bool return_data,
> +			    bool atomic)
> +{
> +	if (gt_to_xe(gt)->info.skip_pcode)
> +		return 0;
> +
> +	lockdep_assert_held(&gt->pcode.lock);
> +
> +	return __pcode_mailbox_rw(gt, mbox, data0, data1, timeout_ms, return_data, atomic);
> +}
> +
>   int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 data, int timeout)
>   {
>   	int err;
> @@ -109,15 +117,19 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1)
>   	return err;
>   }
>   
> -static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
> -				u32 request, u32 reply_mask, u32 reply,
> -				u32 *status, bool atomic, int timeout_us)
> +static int pcode_try_request(struct xe_gt *gt, u32 mbox,
> +			     u32 request, u32 reply_mask, u32 reply,
> +			     u32 *status, bool atomic, int timeout_us, bool locked)
>   {
>   	int slept, wait = 10;
>   
>   	for (slept = 0; slept < timeout_us; slept += wait) {
> -		*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
> -					   atomic);
> +		if (locked)
> +			*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
> +						   atomic);
> +		else
> +			*status = __pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
> +						     atomic);
>   		if ((*status == 0) && ((request & reply_mask) == reply))
>   			return 0;
>   
> @@ -158,8 +170,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>   
>   	mutex_lock(&gt->pcode.lock);
>   
> -	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
> -				   false, timeout_base_ms * 1000);
> +	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
> +				false, timeout_base_ms * 1000, true);
>   	if (!ret)
>   		goto out;
>   
> @@ -177,8 +189,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>   		"PCODE timeout, retrying with preemption disabled\n");
>   	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
>   	preempt_disable();
> -	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
> -				   true, timeout_base_ms * 1000);
> +	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
> +				true, timeout_base_ms * 1000, true);
>   	preempt_enable();
>   
>   out:
> @@ -238,15 +250,16 @@ int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
>   }
>   
>   /**
> - * xe_pcode_init - Ensure PCODE is initialized
> + * xe_pcode_ready - Ensure PCODE is initialized
>    * @gt: gt instance
> + * @locked: true if lock held, false otherwise
>    *
> - * This function ensures that PCODE is properly initialized. To be called during
> - * probe and resume paths.
> + * This function ensures that PCODE is properly initialized. Can be called
> + * without locks only in early probe.
>    *
>    * It returns 0 on success, and -error number on failure.
>    */
> -int xe_pcode_init(struct xe_gt *gt)
> +int xe_pcode_ready(struct xe_gt *gt, bool locked)
>   {
>   	u32 status, request = DGFX_GET_INIT_STATUS;
>   	int timeout_us = 180000000; /* 3 min */
> @@ -258,12 +271,10 @@ int xe_pcode_init(struct xe_gt *gt)
>   	if (!IS_DGFX(gt_to_xe(gt)))
>   		return 0;
>   
> -	mutex_lock(&gt->pcode.lock);
> -	ret = xe_pcode_try_request(gt, DGFX_PCODE_STATUS, request,
> -				   DGFX_INIT_STATUS_COMPLETE,
> -				   DGFX_INIT_STATUS_COMPLETE,
> -				   &status, false, timeout_us);
> -	mutex_unlock(&gt->pcode.lock);
> +	ret = pcode_try_request(gt, DGFX_PCODE_STATUS, request,
> +				DGFX_INIT_STATUS_COMPLETE,
> +				DGFX_INIT_STATUS_COMPLETE,
> +				&status, false, timeout_us, locked);
>   
>   	if (ret)
>   		drm_err(&gt_to_xe(gt)->drm,
> @@ -273,24 +284,32 @@ int xe_pcode_init(struct xe_gt *gt)
>   }
>   
>   /**
> - * xe_pcode_probe - Prepare xe_pcode and also ensure PCODE is initialized.
> + * xe_pcode_init - initialize pcode
>    * @gt: gt instance
>    *
> - * This function initializes the xe_pcode component, and when needed, it ensures
> - * that PCODE has properly performed its initialization and it is really ready
> - * to go. To be called once only during probe.
> + * This function initializes pcode. Used in resume paths
>    *
>    * It returns 0 on success, and -error number on failure.
>    */
> -int xe_pcode_probe(struct xe_gt *gt)
> +int xe_pcode_init(struct xe_gt *gt)
>   {
> -	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
> +	int ret;
>   
> -	if (gt_to_xe(gt)->info.skip_pcode)
> -		return 0;
> +	mutex_lock(&gt->pcode.lock);
> +	ret = xe_pcode_ready(gt, true);
> +	mutex_unlock(&gt->pcode.lock);
>   
> -	if (!IS_DGFX(gt_to_xe(gt)))
> -		return 0;
> +	return ret;
> +}
>   
> -	return xe_pcode_init(gt);
> +/**
> + * xe_pcode_probe - Prepare pcode component
> + * @gt: gt instance
> + *
> + * This function initializes the xe_pcode component.
> + * To be called once only during probe.
> + */
> +void xe_pcode_probe(struct xe_gt *gt)
> +{
> +	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index 08cb1d047cba..e597dcc8ad9f 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -9,8 +9,9 @@
>   #include <linux/types.h>
>   struct xe_gt;
>   
> -int xe_pcode_probe(struct xe_gt *gt);
> +void xe_pcode_probe(struct xe_gt *gt);
>   int xe_pcode_init(struct xe_gt *gt);
> +int xe_pcode_ready(struct xe_gt *gt, bool locked);
>   int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
>   				 u32 max_gt_freq);
>   int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 9fbb6f6c598a..83c316254e43 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -121,11 +121,9 @@ int xe_pm_resume(struct xe_device *xe)
>   	for_each_tile(tile, xe, id)
>   		xe_wa_apply_tile_workarounds(tile);
>   
> -	for_each_gt(gt, xe, id) {
> -		err = xe_pcode_init(gt);
> -		if (err)
> -			return err;
> -	}
> +	err = xe_pcode_init(xe_root_mmio_gt(xe));
> +	if (err)
> +		return err;
>   
>   	xe_display_pm_resume_early(xe);
>   
> @@ -374,11 +372,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>   
>   	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
> -		for_each_gt(gt, xe, id) {
> -			err = xe_pcode_init(gt);
> -			if (err)
> -				goto out;
> -		}
> +		err = xe_pcode_init(xe_root_mmio_gt(xe));
> +		if (err)
> +			goto out;
>   
>   		/*
>   		 * This only restores pinned memory which is the memory
--------------81MjUfhU86R9DJngRB0hbMT7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08-03-2024 14:25, Riana Tauro wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240308085517.2030484-2-riana.tauro@intel.com">
      <pre class="moz-quote-pre" wrap="">The root tile indicates the pcode initialization is complete
when all tiles have completed their initialization.
So the mailbox can be polled only on the root tile.
Check pcode init status only on root tile and move it to
device probe early as root tile is initialized there.
Also make similar changes in resume paths.

v2: Add lock/unlocked version of pcode_mailbox_rw
    to allow pcode init to be called in device
    early probe (Rodrigo)</pre>
    </blockquote>
    <p>HI Riana,</p>
    <p>Patch looks good. Can you please add source to mentioned info in
      the commit?</p>
    <p>&quot;<span style="white-space: pre-wrap">The root tile indicates the pcode initialization is complete</span></p>
    <pre class="moz-quote-pre" wrap="">when all tiles have completed their initialization. So the mailbox can be polled only on the root tile&quot;</pre>
    <blockquote type="cite" cite="mid:20240308085517.2030484-2-riana.tauro@intel.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_device.c | 21 +++++---
 drivers/gpu/drm/xe/xe_pcode.c  | 93 ++++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_pcode.h  |  3 +-
 drivers/gpu/drm/xe/xe_pm.c     | 16 +++---
 4 files changed, 78 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 919ad88f0495..83dd60f68566 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -413,8 +413,14 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
-/*
- * Initialize MMIO resources that don't require any knowledge about tile count.
+/**
+ * xe_device_probe_early: Device early probe
+ * @xe: xe device instance
+ *
+ * Initialize MMIO resources that don't require any
+ * knowledge about tile count. Also initialize pcode
+ *
+ * Return: 0 on success, error code on failure
  */
 int xe_device_probe_early(struct xe_device *xe)
 {
@@ -428,6 +434,10 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_pcode_ready(xe_root_mmio_gt(xe), false);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -506,11 +516,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	for_each_gt(gt, xe, id) {
-		err = xe_pcode_probe(gt);
-		if (err)
-			return err;
-	}
+	for_each_gt(gt, xe, id)
+		xe_pcode_probe(gt);
 
 	err = xe_display_init_noirq(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index b324dc2a5deb..6c0009fcd2fe 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -43,8 +43,6 @@ static int pcode_mailbox_status(struct xe_gt *gt)
 		[PCODE_ERROR_MASK] = {-EPROTO, &quot;Unknown&quot;},
 	};
 
-	lockdep_assert_held(&amp;gt-&gt;pcode.lock);
-
 	err = xe_mmio_read32(gt, PCODE_MAILBOX) &amp; PCODE_ERROR_MASK;
 	if (err) {
 		drm_err(&amp;gt_to_xe(gt)-&gt;drm, &quot;PCODE Mailbox failed: %d %s&quot;, err,
@@ -55,17 +53,15 @@ static int pcode_mailbox_status(struct xe_gt *gt)
 	return 0;
 }
 
-static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
-			    unsigned int timeout_ms, bool return_data,
-			    bool atomic)
+static int __pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
+			      unsigned int timeout_ms, bool return_data,
+			      bool atomic)
 {
 	int err;
 
 	if (gt_to_xe(gt)-&gt;info.skip_pcode)
 		return 0;
 
-	lockdep_assert_held(&amp;gt-&gt;pcode.lock);
-
 	if ((xe_mmio_read32(gt, PCODE_MAILBOX) &amp; PCODE_READY) != 0)
 		return -EAGAIN;
 
@@ -87,6 +83,18 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
 	return pcode_mailbox_status(gt);
 }
 
+static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
+			    unsigned int timeout_ms, bool return_data,
+			    bool atomic)
+{
+	if (gt_to_xe(gt)-&gt;info.skip_pcode)
+		return 0;
+
+	lockdep_assert_held(&amp;gt-&gt;pcode.lock);
+
+	return __pcode_mailbox_rw(gt, mbox, data0, data1, timeout_ms, return_data, atomic);
+}
+
 int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 data, int timeout)
 {
 	int err;
@@ -109,15 +117,19 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1)
 	return err;
 }
 
-static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
-				u32 request, u32 reply_mask, u32 reply,
-				u32 *status, bool atomic, int timeout_us)
+static int pcode_try_request(struct xe_gt *gt, u32 mbox,
+			     u32 request, u32 reply_mask, u32 reply,
+			     u32 *status, bool atomic, int timeout_us, bool locked)
 {
 	int slept, wait = 10;
 
 	for (slept = 0; slept &lt; timeout_us; slept += wait) {
-		*status = pcode_mailbox_rw(gt, mbox, &amp;request, NULL, 1, true,
-					   atomic);
+		if (locked)
+			*status = pcode_mailbox_rw(gt, mbox, &amp;request, NULL, 1, true,
+						   atomic);
+		else
+			*status = __pcode_mailbox_rw(gt, mbox, &amp;request, NULL, 1, true,
+						     atomic);
 		if ((*status == 0) &amp;&amp; ((request &amp; reply_mask) == reply))
 			return 0;
 
@@ -158,8 +170,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 
 	mutex_lock(&amp;gt-&gt;pcode.lock);
 
-	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &amp;status,
-				   false, timeout_base_ms * 1000);
+	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &amp;status,
+				false, timeout_base_ms * 1000, true);
 	if (!ret)
 		goto out;
 
@@ -177,8 +189,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 		&quot;PCODE timeout, retrying with preemption disabled\n&quot;);
 	drm_WARN_ON_ONCE(&amp;gt_to_xe(gt)-&gt;drm, timeout_base_ms &gt; 1);
 	preempt_disable();
-	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &amp;status,
-				   true, timeout_base_ms * 1000);
+	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &amp;status,
+				true, timeout_base_ms * 1000, true);
 	preempt_enable();
 
 out:
@@ -238,15 +250,16 @@ int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
 }
 
 /**
- * xe_pcode_init - Ensure PCODE is initialized
+ * xe_pcode_ready - Ensure PCODE is initialized
  * @gt: gt instance
+ * @locked: true if lock held, false otherwise
  *
- * This function ensures that PCODE is properly initialized. To be called during
- * probe and resume paths.
+ * This function ensures that PCODE is properly initialized. Can be called
+ * without locks only in early probe.
  *
  * It returns 0 on success, and -error number on failure.
  */
-int xe_pcode_init(struct xe_gt *gt)
+int xe_pcode_ready(struct xe_gt *gt, bool locked)
 {
 	u32 status, request = DGFX_GET_INIT_STATUS;
 	int timeout_us = 180000000; /* 3 min */
@@ -258,12 +271,10 @@ int xe_pcode_init(struct xe_gt *gt)
 	if (!IS_DGFX(gt_to_xe(gt)))
 		return 0;
 
-	mutex_lock(&amp;gt-&gt;pcode.lock);
-	ret = xe_pcode_try_request(gt, DGFX_PCODE_STATUS, request,
-				   DGFX_INIT_STATUS_COMPLETE,
-				   DGFX_INIT_STATUS_COMPLETE,
-				   &amp;status, false, timeout_us);
-	mutex_unlock(&amp;gt-&gt;pcode.lock);
+	ret = pcode_try_request(gt, DGFX_PCODE_STATUS, request,
+				DGFX_INIT_STATUS_COMPLETE,
+				DGFX_INIT_STATUS_COMPLETE,
+				&amp;status, false, timeout_us, locked);
 
 	if (ret)
 		drm_err(&amp;gt_to_xe(gt)-&gt;drm,
@@ -273,24 +284,32 @@ int xe_pcode_init(struct xe_gt *gt)
 }
 
 /**
- * xe_pcode_probe - Prepare xe_pcode and also ensure PCODE is initialized.
+ * xe_pcode_init - initialize pcode
  * @gt: gt instance
  *
- * This function initializes the xe_pcode component, and when needed, it ensures
- * that PCODE has properly performed its initialization and it is really ready
- * to go. To be called once only during probe.
+ * This function initializes pcode. Used in resume paths
  *
  * It returns 0 on success, and -error number on failure.
  */
-int xe_pcode_probe(struct xe_gt *gt)
+int xe_pcode_init(struct xe_gt *gt)
 {
-	drmm_mutex_init(&amp;gt_to_xe(gt)-&gt;drm, &amp;gt-&gt;pcode.lock);
+	int ret;
 
-	if (gt_to_xe(gt)-&gt;info.skip_pcode)
-		return 0;
+	mutex_lock(&amp;gt-&gt;pcode.lock);
+	ret = xe_pcode_ready(gt, true);
+	mutex_unlock(&amp;gt-&gt;pcode.lock);
 
-	if (!IS_DGFX(gt_to_xe(gt)))
-		return 0;
+	return ret;
+}
 
-	return xe_pcode_init(gt);
+/**
+ * xe_pcode_probe - Prepare pcode component
+ * @gt: gt instance
+ *
+ * This function initializes the xe_pcode component.
+ * To be called once only during probe.
+ */
+void xe_pcode_probe(struct xe_gt *gt)
+{
+	drmm_mutex_init(&amp;gt_to_xe(gt)-&gt;drm, &amp;gt-&gt;pcode.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 08cb1d047cba..e597dcc8ad9f 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -9,8 +9,9 @@
 #include &lt;linux/types.h&gt;
 struct xe_gt;
 
-int xe_pcode_probe(struct xe_gt *gt);
+void xe_pcode_probe(struct xe_gt *gt);
 int xe_pcode_init(struct xe_gt *gt);
+int xe_pcode_ready(struct xe_gt *gt, bool locked);
 int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
 				 u32 max_gt_freq);
 int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9fbb6f6c598a..83c316254e43 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -121,11 +121,9 @@ int xe_pm_resume(struct xe_device *xe)
 	for_each_tile(tile, xe, id)
 		xe_wa_apply_tile_workarounds(tile);
 
-	for_each_gt(gt, xe, id) {
-		err = xe_pcode_init(gt);
-		if (err)
-			return err;
-	}
+	err = xe_pcode_init(xe_root_mmio_gt(xe));
+	if (err)
+		return err;
 
 	xe_display_pm_resume_early(xe);
 
@@ -374,11 +372,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	xe-&gt;d3cold.power_lost = xe_guc_in_reset(&amp;gt-&gt;uc.guc);
 
 	if (xe-&gt;d3cold.allowed &amp;&amp; xe-&gt;d3cold.power_lost) {
-		for_each_gt(gt, xe, id) {
-			err = xe_pcode_init(gt);
-			if (err)
-				goto out;
-		}
+		err = xe_pcode_init(xe_root_mmio_gt(xe));
+		if (err)
+			goto out;
 
 		/*
 		 * This only restores pinned memory which is the memory
</pre>
    </blockquote>
  </body>
</html>

--------------81MjUfhU86R9DJngRB0hbMT7--
