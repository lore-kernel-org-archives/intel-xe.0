Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F12FC021A4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 15:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D786C10E49A;
	Fri, 14 Feb 2025 15:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bApvgWt5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A934410E497
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739545900; x=1771081900;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5SxQj4v3mVUE1sYk3RyiZTRTsQZ99riZyBscrbWSKQw=;
 b=bApvgWt50IxFnwoPWXYU7dx9lALMpa19jDQP4sWAXRNIRXl1KAEKqaWg
 zP2lPttRILkjx6LIUnuOeaUcYLHlbOew79lHrmGifslOBRVimy8x4Tpft
 xov6S3SIo6K5HZws1mGZ0rSqAqTYj1kmuDVli0cMJnn2HXXh33ZPxbg8r
 ZQHCCnHByqGHM50K1ramlBpGIUGr4QoEVxL8xLgEOhPgUxgZQTwsUATAu
 yTDGOj9c5AKsQFTwakYuCiXmLqaSSofBrm+KwgHEcqtwrXe3/ACf3iZHi
 cB/0KRPctYTTiWTBoWxntIiE91XvXMYYzTVYwe3toF/lyHZnLN36QeZfQ Q==;
X-CSE-ConnectionGUID: L1sbErrOR8KcntZACBbE9g==
X-CSE-MsgGUID: a2gXeXVGTgCJcNf5xrj0Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40168478"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40168478"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 07:11:39 -0800
X-CSE-ConnectionGUID: NcGSOuqpQPas7q6dPcT0ng==
X-CSE-MsgGUID: GNsaClYPQruAb7wbCW4ujg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="113431749"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 07:11:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 07:11:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 07:11:38 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 07:11:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kq1u7CZVYQZQ8OuShxfOO/wbqm6D6umG+oXiNLHlkvxlAbcD5jAujECrYIb4kZVEx2t7CfkXV7ZmvzOQz1MONsx+cXKbWR71WVhoxyUrwyVwBzeI0sIBGVEqIwluHyycd+p0Zm6twleSISW7Tus3WqN5EuFrePCI3BhZqJxowidQ0NVHA7vzzlkvqMXCL+Heq4C28LxMzK7UW7WTRukaJHLfClwY+1OL1c4PEADVqibMLNSwOopSka5/saj5wcUMOF/IYjAFZL1Gt0xVdHNH60ITrfXB3qaZK3gdPIbAZ85SAwC5YW1jEFYJTjuBC9srYfVQbI0MlTSz2Fy+JM//1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+9JG+GQ2ZgdcVm7ZdGZG683cpQiWE7laWrVh/MWxfE=;
 b=Zu3LOW9zyjVjKCkrTuOY7mLJN1d4k2UrhFR3cLCMNqFL+3WhbHGrJsL8xO1+PJixgHmuul3pLZe8Zy4iswZHdRQK6OPNDexNqIoyz5KcSDaDmpEiMmDT+25/k90aUV7nMMxeN1e3caCYoy3pAD3RLmtr4IKejlRBThe0HoEdijQB3GtWVJA9hh//Y57Fbb8R2KlAUOpmyWMcKDDV/MEKySIMHUzKsZ4xzXKxu4cYpH3ERe9ECRMoEsqwM+Zk92GASOrzz/HgAvqIvTLh+BKy7PpHWe/wsjAQ1XboJbmLnZBm8xbo5Jv3OoGaZV4Nm+3rY8vvqjPXnUzc6Ocix/kh9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Fri, 14 Feb
 2025 15:11:28 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Fri, 14 Feb 2025
 15:11:28 +0000
Date: Fri, 14 Feb 2025 10:11:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Fei Yang <fei.yang@intel.com>,
 "Shuicheng Lin" <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe/debugfs: fixed the return value of wedged_mode_set
Message-ID: <Z69dHeA5o66T8x3B@intel.com>
References: <20250213223615.2327367-1-x.wang@intel.com>
 <Z658iN54wTvgbaa1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z658iN54wTvgbaa1@intel.com>
X-ClientProxiedBy: MW4PR04CA0316.namprd04.prod.outlook.com
 (2603:10b6:303:82::21) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|CO1PR11MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: 21497ff7-6ba2-49b9-7a2a-08dd4d09db07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xh4JMbertBAy3IvPlK4ThR66FFWxt/iTbHCFKt00HYIweaHWFCxWaO+gNAKa?=
 =?us-ascii?Q?XtZlVxvpnQ+9v54ob6UQNGScKz0zRAQXbO5P3ZKpNug9GqgS1aZ26lYSYi77?=
 =?us-ascii?Q?9HkHywU9tneUOLaE3+E+p0ew0MO1ccJSxga2O1v+4OeEOMydLZd99dtBs4dW?=
 =?us-ascii?Q?Yh9FsAksgozM/wlHq8ujZXLBeYsWsLCVgBG6DRuonDyoHJbKW9yVJtvCn/TU?=
 =?us-ascii?Q?O8sSFxuCHVsaPXic5494WuupTthRMsrclppt6zvBdQRyF4/a5vZ6bBxUJzM6?=
 =?us-ascii?Q?2H8GK3f7NulbjN+fjCRzHKI06v/K/LDk5ECB471JbVd+uA8UUuMS0aYdvotc?=
 =?us-ascii?Q?9nJXgh96/saTcnbwD4HqDYrHtPtgadiKz1blV7V6GFqXcLrNPsNn4q5enQhF?=
 =?us-ascii?Q?wAwfRADA1+2cYxbJHnUgbZR9HWnPyhtoqkGuYNuhrOtpcnI97wU7wfbeMoqP?=
 =?us-ascii?Q?eghw0NK4BHknm9mNKZfiLghmN98opXzSvUk8YDg40gvADpL1vga/OMOLlEyF?=
 =?us-ascii?Q?Xq8jKCxDlN7qvBVr3tRxs7+uDIF6VtsdHsy11MS+uy0Gst3lcndNXDOhZe9T?=
 =?us-ascii?Q?OUE4eY+WoQXct5/PvwLK4qSEAggV+4QC17BcUSwpDXe9CBBmFKqAOff5jnIS?=
 =?us-ascii?Q?brhdqd8/BJiO5cj1OUHtfbgyvLmf9hpfzEYLZ1/PtohoXvGSfLKuWJxqqDm1?=
 =?us-ascii?Q?NOF6e1kZCEeJiAqjMAZxyBOPVbdCyHfM1cPQHHXAIBR3BBAKRzgZ3XoFt+ou?=
 =?us-ascii?Q?t9J4uip1T8bD1tgPigEUE99beHhW76VLFX03cwh61PLFMBfJ1+BbIqxtmaBl?=
 =?us-ascii?Q?AJFAXyVfN2U6KdCJpzfJ0/7VC5O1EZGeFjiE4bejVl10qZkoOZpgDxbJpEK7?=
 =?us-ascii?Q?s91HaMQAIUW5zu9yFyxDTzmgfru1HMemQDVVOWNtdmzvxxS7dYSG7rp8HFuM?=
 =?us-ascii?Q?1boA1GAWSRU6uwSf9oi0ig3+iKzlsYjqdsr5u1PgO4LhtDm0KmtB5eeadW1I?=
 =?us-ascii?Q?4NTsO+Fpg2GqncZA9YcukeqDCoh9JSusnQibtv2jwtgqErLnf2M/SVhu3M9V?=
 =?us-ascii?Q?++5PZnWV9uNFp+UInZuV7x98HJzI/+CLrJ2vwuIxVuVI3JUqqxEQPrw5cFU9?=
 =?us-ascii?Q?rNE9rIaSVPwwN1NKpzGquHIpVPlhcdRtOl2ec9u6gEb+4CfTdJVNieBoFGbs?=
 =?us-ascii?Q?+a9kzLyYjUtMkvQV0lHVoKW37x8I4j6kVg8BTEXzWPtcotzUDkbEIqXb90pV?=
 =?us-ascii?Q?Mi7SQgMwaDw/sxDlBY7QaBTTVrQ1GevewXbE0SPGB3GzS89U7RJK1whi/LHs?=
 =?us-ascii?Q?eCgjkfuuXuvODr9jzIlyZfj1bAc2skeApkzhNVDJERZRjrUhIdLloGB8hkZ2?=
 =?us-ascii?Q?J9BfKF60UsWwXvCgKJDtD3Tj/Vej?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KdDhhBM+WIyVTnJrNZvvbZod53USRDDp0zkRLGj2iDEciBC61XmeGTngWnk0?=
 =?us-ascii?Q?TS4EbXbjdMT9XgTFaz0ODcfUdkbdSUAHJOLeM2fXbQgHDvLLIO8TDprgJjKj?=
 =?us-ascii?Q?/LV85CIy8gh03YFsy+Ru8RwdNku2s30Zw2mGkOrtMCi9nBAG+EqvqQfa1a+o?=
 =?us-ascii?Q?Q6M8LBOOUF9Kaahy5GT+QLHqFJpH3rxQRAFPkgk+EkNQFghO/hzQykGmjwiA?=
 =?us-ascii?Q?dJyrLGRZ1i/2KfxV9pdy0fxBwuhBYEmtS6hZaEeo/aEuMxYEZVFbF1+/JqHn?=
 =?us-ascii?Q?bdwg5A5UCKkcE0HNzxN/+t0KvhuwTt30+U/9NE2sPNraS7y/RQXn16ty8aBj?=
 =?us-ascii?Q?LFCsrNW4FGhxCgvGjea3pIxS6U91wkqlvoI2HsGBFsGAsfcn0uiA0O9z2HEn?=
 =?us-ascii?Q?vrp7WE5gBO58siFfLREv6mj7kuiqBwNoS2Vnsw8SvV+3HQ2XPeujV2HbPQdD?=
 =?us-ascii?Q?WNFWi34xCc1en/hlUd+ysqAWdcY0GcKkK5dg5rhSBX0wFRJpWxb+tydS4yNY?=
 =?us-ascii?Q?jBkf3YU7LV6XoouOeExvRvXjSUoMVrz6VAlbIGw32kqq4N2zS2GrgJ427Q0b?=
 =?us-ascii?Q?VLjE6eqLHqpx/y5KKVp4mBVBF0t9FL+9ACcVkbcQItRGskGinG7VLWIZPtHD?=
 =?us-ascii?Q?lT6Uk0ZXSgKHygwfdH7IXAjW/NWQ0nd4+rietYXxD3ery+vhcuA+H8eDKeeh?=
 =?us-ascii?Q?dnNo6d9IkaWeHdRsT1F2zaAGeqojIJrGcr8gBoZubgxbgjrlHjvtIuPQXQjX?=
 =?us-ascii?Q?DxCz3b3MM44zw6wmYOmn2eMZ63HFMfpMz9Krz+AQGHmL/XxYrWkl+bGWm55I?=
 =?us-ascii?Q?sH9HH+KG4FRWW+sqRT6YiPp+fv0cjaXg3v5obdNCzD4XOX+nbZbF55u1tJPC?=
 =?us-ascii?Q?5H9i2cDnwpKquiRyia1ez/u1jfUznTWXTI6+nxpzCEpgOce52DsTqSkC6QEk?=
 =?us-ascii?Q?SU9jUcLLVVVlic2eZKcwrt4KnUjvYmgGkXdvKxo2N65jeEsahXRzKEaDMN/r?=
 =?us-ascii?Q?d/etMpowgy2WlLZatYZ6Zjqz+D2Ry6ff0uqXjVGqntkVfAQRP4aNvSmAK8x/?=
 =?us-ascii?Q?xWq/HwXZaaizAz6HBuwdxGoxgCjNX9zW6Ad683Y90trJ2LSoHZMHCsyWZ3Jd?=
 =?us-ascii?Q?jwx1hZgRrq8CLY+rR5M9nUVinr6JHMK79YaW6gvtcVi5cRsNReJXj3D1YWAk?=
 =?us-ascii?Q?amoz51jf7bWTitElmOGa2twHkXZpIYfCsqCb+ASfgy9qgm8EmU3yadLDN+21?=
 =?us-ascii?Q?D4b8/AychkApYInr4vTNWVtzFJh2V/rNsEU+jPF9hhBbRnyuMP7L4sSmFIF0?=
 =?us-ascii?Q?AJAPW7ZEP5n3kO+hI+4SoxsOzrkX3xUL5hDEUU8+BOeQG0IHO7eQQvH8nUPr?=
 =?us-ascii?Q?t46k+yxYWSeOBJbnnElDMnwO0uT4HCe7loG0EUXpg7L74GlYD+7lQSTigreC?=
 =?us-ascii?Q?W4eo9hQUJ7lUuZTn/MKgMSkmUwtodfrW9X1aQwdgw24PwjSHLw8Z1Rbb5Gi0?=
 =?us-ascii?Q?hL8b5JCqnurKaYuD+U7d8c0Yqy9OUiYbGpCx7qIguOJw4qQDmjCnUMEtwj60?=
 =?us-ascii?Q?twTZ9AAitDgd6JTBYxt9i9lUDoAbUodHDTFFBMTDRQp6x92My/I/067p2Iei?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21497ff7-6ba2-49b9-7a2a-08dd4d09db07
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 15:11:28.5628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Gx9d3DzP6x6iVLmX2BeU3dcTjyokD+1dNgE1BKhWMG16eDyKwQmV9ng3jqTHsPasemswn+hFfl6esT4PfuFvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
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

On Thu, Feb 13, 2025 at 06:13:12PM -0500, Rodrigo Vivi wrote:
> On Fri, Feb 14, 2025 at 06:36:15AM +0800, Xin Wang wrote:
> > It is generally expected that the write() function should return a
> > positive value indicating the number of bytes written or a negative
> > error code if an error occurs. Returning 0 is unusual and can lead
> > to unexpected behavior.
> > 
> > When the user program writes the same value to wedged_mode twice in
> > a row, a lockup will occur, because the value expected to be
> > returned by the write() function inside the program should be equal
> > to the actual written value instead of 0.
> > 
> > To reproduce the issue:
> > echo 1 > /sys/kernel/debug/dri/0/wedged_mode
> > echo 1 > /sys/kernel/debug/dri/0/wedged_mode   <- lockup here
> > 
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Fei Yang <fei.yang@intel.com>
> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> > index 56cb3788e752..b46075edf60a 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -167,7 +167,7 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
> >  		return -EINVAL;
> >  
> >  	if (xe->wedged.mode == wedged_mode)
> > -		return 0;
> > +		return size;
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushed to drm-xe-next. Thanks for the fix

> 
> >  
> >  	xe->wedged.mode = wedged_mode;
> >  
> > -- 
> > 2.43.0
> > 
