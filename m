Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E4EC7EE23
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 15:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF2410E2CB;
	Mon, 29 May 2023 15:12:38 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C9910E2CB
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685373156; x=1716909156;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=DwX6Gyel0BL8f2p7/rJt5CiVoHGg6VVF87OW9QJUy8U=;
 b=kGxc+ikwuyaBbxVDU1ktGIABtoA3TYAuML0nwfTY0sBsaiPMT2+ELve7
 S0c/gNCsvcF58XdpiH3zGJlMbgTO4BKrs1rIqhXZm7jDbNwhcr2vWQTgO
 LQXv0dcB3SAlWR+LGIrKGr+vhdzUjSWWaSUNSJDZhc4MZphSciPlIQg/d
 V2QgTT1Fa+qQ+fpvaJIW4Dt+s/0yVsoob0r+tVTbRcWfZqUKnJrLcmP16
 sjKt5AqzodI7YSICQMaMPSNmK6kI/k5DfDfqhrhfiiIKVnTeS2nufG4Dc
 643HzNRmBp17MaeSZcdUd/nTwX8QK79Nj9+VqxSnNjYNzuFpoCTuzP74m Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="344222849"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="344222849"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 08:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="830422429"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="830422429"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 29 May 2023 08:12:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 08:12:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 08:12:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 08:12:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVXuYX3ckOEyv4xMFICXfDVVCFfDBh8mTWcz401zQDr8lOmFADOE0VVSA7y038SLa5JyHIgWlodjhibfdaae7+gY3m5JmKwWbD4ksO7aK9h4RqQpNZW2ZcvvTq6z4JsIBiKMiB80lpAkvcqFNBKed6peGPrEoqLzyIcJSdvdSBpSgxA8P/x4by352QvVzVWNJiDmgvS0OTd/500onZGfmI7sN151d9VZg4PMYNWKoN5U3uSawtw10kMPUXvJm/aed8Ujh1RhCTkueHXeRzCFqIwUZcufejEUbYtpEYXeIOW6onTYpk+4uLfWEByV/EPyv5t4+epdsbqiKGXOoGIfug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xW+SzSdYQIErFER/tu4Yl3bIGqHQKA8m5Yi3l9pWoKg=;
 b=HPELhx5R6M/6DZDfd4hJl5QZDTagohbRJGMDr7ulnk604yCX2NQG/r/4Ks+NREpHawjNQhq6EoXmfVRPSsgQDHEAQh7hvlRdI+V6Mf2CgYwb+JbdAv0imAaV4NzAawNNqCd8RE1Fce3DBfnkGBqfcmzmCY0yFeCCtnl3YZJ3WsaOh271ZUpn9ZNbzWFSWsoASyxqXfiyePzlVMH3SpN3oKs4oKuVbP6lzCAKWmxtjYDn3Ht8o8/H9mokFetECy03tSlDh8pH7/FFw3rgo4ZPDe1lT5ti+hsgyZRL0NUzTQlboGAH3IkETxv//OT1ZKADuL9AJWw9oIuxjB/QPn+vYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Mon, 29 May
 2023 15:12:32 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 15:12:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <168536777154.1394.6316661432140990148@gjsousa-mobl2>
References: <20230526004235.745730-1-gustavo.sousa@intel.com>
 <20230526004235.745730-3-gustavo.sousa@intel.com>
 <20230526214817.GL10045@mdroper-desk1.amr.corp.intel.com>
 <168536777154.1394.6316661432140990148@gjsousa-mobl2>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Mon, 29 May 2023 12:12:26 -0300
Message-ID: <168537314655.259912.6694732959130131654@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR01CA0020.prod.exchangelabs.com (2603:10b6:a02:80::33)
 To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|PH8PR11MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: b975d5c4-3ff1-41d4-9d8f-08db60572032
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GE0EG0+KqY1dREq0MvpiYT7dA1KBgwdVcwpWtRYJUzadZ340jQW8cQxsWp/TbmmWkQrua6elR5Ul/BEl4PXfq9jXraQm+W96hUfH5V5+2fxV8OKHntGI9KkWYFp6woAK1JmD4eIXNCQ6LjRkyCyazVgGzia4Ki1W+W1AzvGysEf+UsppMb0DyrzCUhEyEsycXueZez0b/q6Sx10SdSWWI6Cob0MWI9ouH3slWlg/UTMu98HDXPflwT5Z0xOlV8+FiP3H1bin7brQ6bYl7oP6hfesg4lHQXUN32oHgaMw/qWWGLYMakvODEJDm3x0CUQ1/+QQreflIwUMybFLwWRJz+WMVFraInsJq9GFak/lYsMyQkdEVRRCeX9K2tVQtnVUjwLABp0XFoeX8R0ZFo7aXinj5chOq2HzjleHXMdnMBRJPKjMB0Vq/dyHASy780GaTQgmWek9Ds9UUIlzB1lQScZ/C13VqjGiRmZeKIeejz78Sb4pNJW16Sl6JWajDhiGHmlK9oiho9sjmfpxUfaOug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(966005)(186003)(107886003)(38100700002)(41300700001)(6506007)(6512007)(9686003)(26005)(6486002)(6666004)(478600001)(54906003)(6862004)(4326008)(82960400001)(66556008)(66476007)(66946007)(6636002)(316002)(5660300002)(8676002)(8936002)(44832011)(2906002)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1BuVnJTL3AwZWhuSkJCSEN4L1BqTnVyUk1kM1dkanpDSVB6RTZEcGNUZGha?=
 =?utf-8?B?WkhBVVNKaHlRV0I1Rmw0blA5MDl0T0ZBeFNva2VhcXJsVS95dU5TdkhPa3Vr?=
 =?utf-8?B?SUlQZkNHQnNXODd6S25kZkZ1aCtDV3JucFhtaStpVUtYTDNrdjNXNVRPeWxX?=
 =?utf-8?B?SU1EMSt4aVM2SFNJOWhQT1hqdzJSOFlxQXFzUEJ6MzNWVlBBUnlRNkdtTVRS?=
 =?utf-8?B?SE9ybFkyYnJsWEZCNzNxbk9ESWcvWkMzWE1la2tUb28xUEJKK0o5d1k4Ulh6?=
 =?utf-8?B?WlF3OWtFRHgydmVNUG51MmtlTEUrTWpQUjh1ZlNsVXltTzJucndITWNyclRW?=
 =?utf-8?B?aTJ6dFoyNjIzK1U5UmdkWjRIRVRpeGNId3FSeXBkd2VsYzJDbDRZTzJzSHRR?=
 =?utf-8?B?YTVkdmxnNGxrbVF4UUV6bnkzT1VoSDJ3aTNSeWpJdnVrWm85eHpZYzZlTE4w?=
 =?utf-8?B?Tm91dHg3eXlMYS93UGRiVS9USTdyeE1LK1RHTWlvek1xckM2WGl3UDhTV0tJ?=
 =?utf-8?B?eG85MncxMlpFQkhOTGFCakQ1L2pyN1FuSWhCS1FadU9Fd2liV3RQdS9aNjd1?=
 =?utf-8?B?c0UxSG50V3lyajBua2hkZTNMMWxsR2p6blljazhIOGpCWHdkSEMrcjdkanRM?=
 =?utf-8?B?dSs0emhUZ1ZTZUVyRGJyNEhzeENuZGsrVEVMQmQ3UlB0MUZtYlA2S3lNci9y?=
 =?utf-8?B?ZDI1MTVjdjhuVmJZcmJqdDZ5SmR1YUF2aysrM1hTRXJvUDl2VlpHMWZjVE53?=
 =?utf-8?B?THgwWVROaUNSeUtITnM2SllBMDZjQ3UvdGFtK3BlcEhoUUxpMStZNkNxd2Za?=
 =?utf-8?B?U3c1NEtvM1lXaU05WEJDZE1pYVpGY2dIV0tDWk5qRDN5dlNXU1ZzcGEzWnJy?=
 =?utf-8?B?aHVCQUt6aFBSa1pYSG1xYngyT001WWt3WkxxWVAvMlFiWTdRbDdrQnc5b2I5?=
 =?utf-8?B?cmpod1NTQW1pcXhXd0xkZlRiSkhoeUdmaDZUaDRwcW01dkRwcS92Y1hjTXVk?=
 =?utf-8?B?VW9oV042VjArTVBtRktDM09tTmtpRXdWTE5mNk5BaVRVcHEyMW9FeE5WSWpz?=
 =?utf-8?B?WlpySCtzRllIRmY4OVJYeFc1OTkxNks0c0lMcEFnNVNxbFg3SEFXY2JCZ2Zi?=
 =?utf-8?B?MktPaUhrbFdtSjBJS3BhMFRrem1lV0hIdTlwWHpYZHdZclNNOFVLdG0vYU94?=
 =?utf-8?B?Uy9HL21DZjlPeTRHWldyYkoraHFqSkgyQm56TXBUQUpjajdvWlR5eDc2Wkly?=
 =?utf-8?B?SjRRRjk0a2tCSWtEQkViUzRKZzBEdVFpYVpWU2NDL2hySWR3dGVpUlFGWUZM?=
 =?utf-8?B?cDRNTWdqVElkbGpXQk56VjJBbU9QaW1SbUFYbGxKSUE5UVRKbjN1K0JMZzZn?=
 =?utf-8?B?c2NKaktUZXdtYnR6bHliTmk3NDNVaUpDOXp1ekQ3ZUszaEdYZk1ubnB2TzJz?=
 =?utf-8?B?VkphTVJ1RmhKT201dGdSNUo5dUQwTDhOTE1zTEpEbUhjc2FZeEJKT0srMDlP?=
 =?utf-8?B?SEtBbU9zY1I0K3NsbWtBSzJrRkVKdUhWeGJTZm9INm1hYWorOHFMUVdiNnpw?=
 =?utf-8?B?VmFGczdIWVg3MFV1T3hoVUlBYVJCcFg1dExSeUM2MDZ4bC8rZ1hNdmpaVjM0?=
 =?utf-8?B?eVJmbTNnSzdmcUJMY20yM3JnUkRJbHBDTU1BS3hVaUdMMUFQYnZOeGUveUtT?=
 =?utf-8?B?bDhrQ3VSbHdxaTdISVorajlGakh2VDdMQVdLZzRmSGhBWDUxTlRHbkFNRExr?=
 =?utf-8?B?VS9Ecnh4cW9VS2tod2NLZ0FQUmI5MXNzSXBkZWswalBVakM3ZS9JdzNqT29W?=
 =?utf-8?B?L0xUbFFYL1loS2pvakhzTEFKWSs2QVJjTjlVYWhoNnZBKy8zbUNmdjVKVTJy?=
 =?utf-8?B?eFN1ZS9JVTQ0cGdBUWZiTUgxOEZIajliN0Vsb3A2SWVxcXFSeWxXanp2Q0l3?=
 =?utf-8?B?cjRlNEVESXExc3ZsT1UrZGtkaUdPNkhNV1JvWHJUazBkUHNrOXF6aTkrSlBq?=
 =?utf-8?B?b25zck0xUW95YWJIbGZEVVcyNGJuSXdyQmhFMGpKZ0g5ZFNVbzhyWXZ1TGFm?=
 =?utf-8?B?SEZGL2JUdjZrTFMwcUc0MUJXcVFuMHM2cjJMMDluYWNaSmdPQlV3b0NyVSs2?=
 =?utf-8?B?K0xvNFAvbG9pZU45UHVTUlZpRGdhRzhXTE4yTEFILzNHUnFiWVY0VlRsTVFy?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b975d5c4-3ff1-41d4-9d8f-08db60572032
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 15:12:32.3210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ve6lKp1ql5iEOOZ7DGYx8gfaE8NzCXUhxEeQdOuohZ6vBAHJx5r4B8HwdGl2eQYFe/tL7GNeDdWQBs1fyBUfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8040
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Replace DRM_ERROR() with pr_err()
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Gustavo Sousa (2023-05-29 10:42:51-03:00)
>Quoting Matt Roper (2023-05-26 18:48:17-03:00)
>>On Thu, May 25, 2023 at 09:42:35PM -0300, Gustavo Sousa wrote:
>>> The former has been deprecated in favor of the latter.
>>
>>It has?  I thought generally the goal has been to replace DRM_FOO() with
>>drm_foo() (i.e., drm_err() in this case) because then you get nicer
>>device-specific output.  Or when we're doing something GT-specific, we
>>move to xe_gt_err() so that the useful information about which GT is
>>automatically included.
>
>That's what drm_print.h currently says:
>
>  /* NOTE: this is deprecated in favor of pr_err(). */
>  #define DRM_ERROR(fmt, ...)                                             =
\
>          __drm_err(fmt, ##__VA_ARGS__)
>
>But, yeah, I believe using pr_err() would be the case when we do not
>have a drm_device at hand.
>
>>
>>It looks like xe_reg_sr_add() doesn't have a reference to a drm_device
>>to use drm_err (I didn't check how hard it would be to plumb down to
>>that point), but xe_vm_bind_ioctl() should be able to use drm_err() I
>>think?
>
>Hm... Yeah, that's right, we can easily use the drm_device reference in
>xe_vm_bind_ioctl(). As for xe_reg_sr_add(), there is only one caller
>(rtp_add_sr_entry()) and I believe we could have xe being passed as
>argument - I do not think it is worth adding an xe member to struct
>xe_reg_sr, at least not this time.
>
>Thanks for the feedback! I'll send a v2.

V2 was sent with a different subject. It can be found at:
https://patchwork.freedesktop.org/series/118515/

>
>--
>Gustavo Sousa
