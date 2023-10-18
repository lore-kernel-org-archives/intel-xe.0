Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A61ACDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 13:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246E610E3E8;
	Wed, 18 Oct 2023 13:28:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A86D10E3E8
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 13:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697635688; x=1729171688;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=F5mTiHtnT0Q7iMg97kIaZIQstiijFLr6DXoOuhmUDao=;
 b=Wgidr6f2CMiaG4EuS+ppqrdczdMSctjDlB5RZou/oYoBRRBKmgy/KQf2
 KN+AwrdVxpSidMDsEbCpQM5IYGhD6Yrp69KW1kFdAbYimkgx6GQiw2s0r
 vF6JSRXAAX0P/MmxK4DrQ+jWl0Q9VK6DO+HQ7GlgPoW2cU1iFCe27BzbB
 CfZJQCaGfNnfDWokcHUtLSKYpn2kLEfJ1lAy2Mb+h3HkwhGDWl8zWnPHy
 5BJFTySWoM3DI6kr5capqsllVrBnVfRkP6QY3jT9bAdMNLruQwMzpXypt
 d7sRffV0iK7i64BPLVKBLWVLsEXxQkRX1tezE76lUcXC2wO/bl2XrvAP4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="365360238"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="365360238"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 06:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="750091495"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="750091495"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 06:28:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 06:28:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 06:28:06 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 06:28:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IONhcQOsBzLQqv5JAB8qgr0OsFK71H60RGwB4jD0iCXqkIloRRJvqZIPlwnqdZ0RPGgecgv2u7Jo7C731aD5m2NpgWl/uElDX7yyWuUhrVyIf9yaZmrrAsREk9itq2qfvU8tyOstYeqnbBxDN8y35oOIH7yz0msmxyee759K5p5BySk9CRfS1o90PjFyKcGdraNZpUKrs/ueAZfKMxC4X72Kf0nDt9CYHREZ6WkI1nzy4Uo//Go5cxfMmF2L/vQA4C3RfO/vxRW4lOs/jhICIiwnaligsWHjn9P5QFyVG++fkbrV4WLeD2rqAXZTCXX/7N+ypFBl0yRLLzawwB4mzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpnbHUKNzgxqs4DuZR/S3auAqNsJW3I4dpo982gZ1GU=;
 b=KTOGnZYhsKWqyVuQb6eQ1Uv7tcDpC83mMGFlEnvrhK+9wWh+ZDCu8tqguG55xqPJC44OAzayLtiAqIRqETyl4LQJDg7QvKycerzD2WwMYy3ff517d5CGYWSgFStWrnA+lwTODz3k+c+r2roToyC21hYw+2Fv6bm1023fX70FsGJw3QbQBdlS5+FS13MQuUKUzcGT3RdYepi461YYOLLnSgaUmXWlpCBcl7fzEDUG91RQ4toSbt/oHVeeIU3YmGjgu+aKkWZ+neYXeBJBDFJbjZojBH1BYPmll72xBfAPWH45nRnwQl+gHEgg081XPpzCO8CBH81I80+xYdo09A7jjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4629.namprd11.prod.outlook.com (2603:10b6:208:264::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 13:28:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 13:28:04 +0000
Date: Wed, 18 Oct 2023 09:28:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZS/dYeHQEQS/axcC@intel.com>
References: <20231018115826.3908905-1-michal.winiarski@intel.com>
 <20231018115826.3908905-4-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231018115826.3908905-4-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4629:EE_
X-MS-Office365-Filtering-Correlation-Id: fba1b37d-6443-4bf9-58db-08dbcfde0efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 94OHp5Hr3kXwoUc6Qe5Oq34AxgYB1aAlOWInTfPLcp/FxQOY1g6E5YVr/S4U9Y58UXU7XnIV6Gq4+32vTIWA6+T0YJyaXNyxhO6OCxmkCCksHBOyKQxZRKExhAX7GdKtwqASMt+VafsFCr5XHZglR0tCotQs+uX0dfBdG/0xkr0+BaBk+PvClJ464gJnZpzofa08Gx4CPtEbIJPrRvd6HCIMextC/jX+s+LU1rVwCdfTSVaP/kt+egB5SHt4XyWwfkwp8W1/5Ucxzx4t5LKbURSuB2amFvHXI7wI2ml75uOOAwUbJRVxm+8DLwf3tQrA2Bbjjkh2CTsqCzEgRAiLNKF91xsojiYS7bePeEv/d8hfeSxQTjQkvHSUwsOXPtLY7jWr8V2Ig90+O88egmOSdECBTGYQJ/a4F2Oop5KJux5Aoa8x8IBtPr1bJTdp/AEC8Pgcea/YIYMFEKrTWUgArCPaeSMjKlF00j4gnP+OFQcXM3neePGlROROD3rc2ULTgpnbdqqGzlcxQLwF5WhJc8/o4oYVY4SHAYinzQRGbXhQZ3nlUX6eV1JDuYEm3jib
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(376002)(39860400002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(316002)(36756003)(6636002)(26005)(66946007)(66556008)(66476007)(37006003)(38100700002)(6512007)(6666004)(6506007)(2906002)(15650500001)(2616005)(41300700001)(82960400001)(83380400001)(8936002)(5660300002)(6862004)(478600001)(6486002)(8676002)(86362001)(44832011)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEsrZkltMW4vTmsyYVA4bU5yYXZrYlNMNnVIMWlRckpwWCsrTDlzZUFoNHdW?=
 =?utf-8?B?OEVFQ2FSVzVvZzVycWZDS0pkcXA4d3VkRE95Tkhicjlrdnd1LzJYRDBBemU2?=
 =?utf-8?B?RmZ4TEtkSWhWOHM4Q3N0cGV1WS9RaDYvK1FkYVpRSE5XV0NUUk85T0RCV3Bk?=
 =?utf-8?B?aUlUemk2aTdpT0RlMWlyUmpVOTJ4RittRnBWMTlZY29QZVJySUFhdms2WEVw?=
 =?utf-8?B?RzdORjgxQjFYUFJ2eUNtN09aREt0Yk1KbFBPWXNUOVVYTGgxN0U4WEpBVEV1?=
 =?utf-8?B?OVN0TkltblM2RmlhYzQyNUQ1Nk16VnQyZWtzUXZvSitjVUpBUnlOV3NTS1NF?=
 =?utf-8?B?eFRKSTF6b0lJRmdHaFlZQ204b0FZb29URmhRQjZ6bHNOaVhab2JQcWhjc1Jy?=
 =?utf-8?B?NHkra3FaazVYc0o5Q0hSSnhFdlRIekcvOVplamo5Y2dHOEhROWtobEc2VW16?=
 =?utf-8?B?RDdlYmxPNlZsMjF5aGZRUnlUSml4SEtQK25DTGE3UHJ0MEJ1K1o1N0Zyd3dF?=
 =?utf-8?B?NS9Jc2hQcXJEaFIyS0dvZTFqbHVWTG1NeTloU2ZTWGxPK3lqcSsvaTQ4ZWkz?=
 =?utf-8?B?OXFJcitBMFpnRUZ4OGxaMURjMEZvdVF5QlZkUWJnejRZZjhHVFJmN1p1c09q?=
 =?utf-8?B?bWpBWmhvNHJOeEl0RzdkSzlUc0xrMXV3b2JRKzY0cGJjOGtmVnRzVng1ODZr?=
 =?utf-8?B?RjZzOVl6OG9NeE9RZ2dOQTdVb2I0WEZCd3A5UTBpSXFhZzJzZGg5bVVMT3VP?=
 =?utf-8?B?Z3A0d2NYUFBmd29QdjAvME5XdGR1cGJTcmd5NjFheDE4b2ZJR2x1NjZma2FE?=
 =?utf-8?B?UFplbDVTUUVPd1VzWnlNOHIwdEZYakEyRXZNNERLNHRsb1p4ME1yMVFmQW8y?=
 =?utf-8?B?aXRkRkhadHZQWkRoMzNCWGJMaEk5ZzljekFBekdOUUs3NHFGNEdhYnh0ZFJ6?=
 =?utf-8?B?TFFsWGw0ZUtCZFVFckhPZVpGWmpadWE4THVYUHNpbXd6TXFoaC9PTjJXWkUy?=
 =?utf-8?B?eWhnRDlBVWZmbklnMTVGSkNKL1BGYnBoWTlVSmowSHBZMHlmdElzZUU4aEw0?=
 =?utf-8?B?Nkt1Sk1LSlphV2kvMHcyVGR2T3JocGVXaXBnZVV0Smk5QXhscUhDQno2OWNY?=
 =?utf-8?B?eVBuOW1mUjBNL0MyaXhRUjM1dSsvenVCdlo5VStEalA1WTFwbDdzdjFZSHll?=
 =?utf-8?B?cjNSRG5JUEpQeFZ6R0VyRDRVc3dMZFg3ZTRGc2VUR0svOTQwMlZMY0ZNaFhJ?=
 =?utf-8?B?Rld1YmUvWitOY0N0NW1wUVZ3ZXhIS3RNKzF0TFlpV2x2VDVZR3dDNlFCSmY3?=
 =?utf-8?B?Tm9KajNsVGdYbmpIL2M2WlA4OEZFMUJCd3lSbFZlcU5NZVM1YTczczN4Zkt6?=
 =?utf-8?B?MkRTY05aaXA1Q2ZsOUVEZENnTzFqNU9Bd0l6cEdDVmRUdGlJOHFrWTBjd2VW?=
 =?utf-8?B?UWx1eUI0MlIvM29SNm9LTnFjS0NiMm1kZWI0R1NFT29Pa0VhNmkxQ1lLZjBE?=
 =?utf-8?B?RXpycXJzRlQ2VDd3SUFKbWpwQXVxSHVzNDJGU1hvK0p1bUpXSlF0eHJrdGEx?=
 =?utf-8?B?WTNRc3kwRHVDY3Rqem91d3VQd2x1ekNsTWhXeU82ekNkbTlQTlZUSWZGdEM3?=
 =?utf-8?B?ZG1MVXpIRzVxbzdzMkNYeVlUaUYvMlMrMlB0d3owT3MvQUg3cDVneTJURmhL?=
 =?utf-8?B?N0JER0drL0lqY2xHeHZjMDZOZ0JTNWJNWmc5UGRRdFYzelI3MEVHbDlXSXJx?=
 =?utf-8?B?TjlLcEtSakdHVnczcEcvNU9HQmpFeHREcExTbjJheURmQzZoU2xVT1JMNlBT?=
 =?utf-8?B?eC9Gb3dydThQR2QvUTVhbGI5NnUzUUJoQUFWN0ZVeEU4UURNU3dZdmVzY244?=
 =?utf-8?B?ekpudk5sRlU2QnB4NFRkVTZtOEdmZHNQNlNxZTA2aVRGanlBMFVoTFRncWRi?=
 =?utf-8?B?SDNMMmtMTEFIYzhLb3lvdTN5SmhnNEtya3ZpbUtzMWVCL2tPSjZNSzZ0Q2Jz?=
 =?utf-8?B?Q1hlK3E1WUE1OFhWQldUMk1BYXJjUVMyc3JRQkRDU0xzdEZmTThnN2E3cUM5?=
 =?utf-8?B?dkRJUlg0d3YzSzJwVmJYUzI1RG8vbHNWNGdCT1ZPTkxMb0liQlVuc2l4UGQr?=
 =?utf-8?Q?4LgD6CVzwYuFHt/w9R5hbBngn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fba1b37d-6443-4bf9-58db-08dbcfde0efd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 13:28:04.6516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kE56ka7IfOTx2asJ+MyNF/hgsYkSuloeA9bkO8rI6LJME0yBR/Ppy1Gok8r8z1u7IzV5Swk4eyk3I/Fef6jcDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4629
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Fix format string security
 warning
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 18, 2023 at 01:58:26PM +0200, Michał Winiarski wrote:
> While "gtidle->name" is not user-controllable string, it's still a bad
> practice to pass variable as a format string, it also causes the build
> to fail with:
> 
> drivers/gpu/drm/xe/xe_gt_idle_sysfs.c:88:26: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_idle_sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> index 7238e96a116cf..8df9840811cda 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> @@ -85,7 +85,7 @@ static ssize_t name_show(struct device *dev,
>  {
>  	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>  
> -	return sysfs_emit(buff, gtidle->name);
> +	return sysfs_emit(buff, "%s\n", gtidle->name);
>  }
>  static DEVICE_ATTR_RO(name);
>  
> -- 
> 2.42.0
> 
