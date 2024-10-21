Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2024AD17141
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 23:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF10B10E1C3;
	Mon, 21 Oct 2024 23:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvRXaC6m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913C510E1C3
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 23:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729551846; x=1761087846;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eTmyNpsdQ7BF2X5yedSTAPIdvme+ISA2G7RABXyaFdo=;
 b=QvRXaC6mDC5CDXPWux1oXbhdr17Kzx5v55O79BL7v//9DtbYNph9dUE7
 qQV1uvo4A1N8eDpdDMQlXNBKczqHf7Jm+ZXsd0/gv/pzda7qHKSaVC+mE
 xXFfLfNFnlApvpUTi+oH1/OPEPDtTAIduBiIOH216Et4bHOPjJBn5N/Y+
 Qj+lYSGLzLv9knYtaej0AZdlVbxXL1b/GvuSbN16V38G15oLQ13tjPJaK
 DfFFzHjL/iRjgd2tUnH1zfwIlQRF4Xe+f16lEI9jpdhMmPjBUUyUx+4F6
 5fafiy694QwnUBH3hPs+zFydvxdBRkgv9GDmG2mDziEeRj8JGKatVW6dc A==;
X-CSE-ConnectionGUID: jJPhcfKyTC2N29L6HScy4Q==
X-CSE-MsgGUID: dx4zHzAJTL26Lbjws+Ax2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28937342"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28937342"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 16:04:06 -0700
X-CSE-ConnectionGUID: PI7NX8/xTSur8MoNIIAwjg==
X-CSE-MsgGUID: CxYOckC0SYW0ZLKBln+/Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79302918"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 16:04:05 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 16:04:04 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 16:04:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 16:04:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 16:04:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Phw4gl0QrfYE6UsIxwzt7mqzY2Zw31FBJpyzaSC2pBGMh7t3vYdHukbmbWOS2VParKa22mTfOBLAvpJtTRJh7ndn/6m1x0o88+DznVQUY78d9Lklnjsf5ixzIrw2c5c+j1hbkGTZoR05ZEq0ZPQS1FAgUPGbEnEIrxRD5LTq6IvuoUkXz5yaZHbpoVTgpBEfDxU25Mg3gwjIECgDBiI2lpnrTG1KJITvzcainxNPl4NZRoUPLYRAjqkFT9iG0Aqb3d7E+E+3vXgHrr5scpnraRKTheSQMuCbDYPl8tTA/tlZhikQWfbPCczdP+FGhO15phnMT4B/qB5/jKWRWWAX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wx3XR223AKTcLWvvH2egKJKG+nZkuS1SHTFrwqVlZLQ=;
 b=XSJrRtxFrJD0iCums9Xh6V86sdRTsvHTQp8rAtrU2oKFgsFLZwBpq3oB2wVEoIqnyc1CsuvaHev26fEvuyDrb3TZK5Hvx7utwkjv5i5FTESiwe83cwOlkb0wqWzjmyDd9zFfjsPaFgbgwS5a6J3UEJNX1WDyiMrumGttQYSvl55WCAWSDrxtDhli3DR9CWz/Mb8MKAPMlVv+5po+6ozhGJnHhjKtujU21WQrBMnSFl39I1pWHxJNfxFcGIZ+Zmzw2m8KlnrygjM68dbov4ehH/1UVf7sFI19ZMlI9hqFMtyB/D+mkQCoM4U65EZeVlZnffmKhRQRJc0Zv2UBSwjMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6738.namprd11.prod.outlook.com (2603:10b6:303:20c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 23:03:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 23:03:56 +0000
Date: Mon, 21 Oct 2024 23:02:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe: Don't restart parallel queues multiple times on
 GT reset
Message-ID: <Zxbdm8wpXQ8Iu477@DUT025-TGLU.fm.intel.com>
References: <20241021211146.3842483-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241021211146.3842483-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef18b5e-adee-49fb-0bef-08dcf224a42c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3z8wCv3XVBgHpL5qVZBf2GNXO+7fM6Vqcoo9pOlR8s3/De/JtoOls8r15wWW?=
 =?us-ascii?Q?X/ThdZCuZIU4l05kz9C95hcZljUxlwZNMB6P+Bhg5pCKzSN3HT3UAsliadmP?=
 =?us-ascii?Q?asKAbLazx0BUdXBIyYRPlSVC+7ODtZDcS14Aod0BOT7Ii1o98WJPUkMBaV4Y?=
 =?us-ascii?Q?R+6L6eENhGgsg5qfonpIQ1DMMEjsOgVbNRjXgRXbIKko+mH+LNegLr6nabSe?=
 =?us-ascii?Q?fQ2/Xli8774y9/9fvWgtNqa00nRt0b552I9QGT2oYaER8H6kAVESzJnedPin?=
 =?us-ascii?Q?xjjniZcJsSGhItA2y7sCArWH3pVg2SCvErm/XmqrPB+tBEMYPrD+LfxPMqOK?=
 =?us-ascii?Q?a9JLYJRxM+wMggwcu3nKuiIXXjGJEozGyn7LWSTXgsjnvAr7WCcAXrLaAfeX?=
 =?us-ascii?Q?4J0HRJDikQZ3dFMp+tYIy47cZJ3JoElFwN3ph5l59AqIkZmhIOa2xnLAqvER?=
 =?us-ascii?Q?IdAZ54wQJM7pZuCgtRep1A6SnkJKBEv99jQ+AbonwXuQVWITkMCotBgBmWdo?=
 =?us-ascii?Q?hTMDicY4AybrwBEiEhkIa3rVqa/Zi2iReMNzwcpsOdfaPFVyj3IM34Y0fEnl?=
 =?us-ascii?Q?IG8/tiavqiVq5+Zp3UTXeR/kjSVtdNHbeZHAonbbzZa+TEBLjtxC5TGf71DV?=
 =?us-ascii?Q?tdmEbSxvTHfECkPkCjRf4xsx5VSd5aAPrKooGSJEtd93BoPbScyRQ+vWD/LZ?=
 =?us-ascii?Q?ZZzSOFVmWbbnl7KG5qn9pROko3oY/cgDqaz/IaJ4H5CJNzJ/zo3R0fHBWlhD?=
 =?us-ascii?Q?fjl9Ecf5lP9CCz+eqA13teLoLbFkeP2TLZcMxGAFOBzf1sK0qQkkWbNfMQZL?=
 =?us-ascii?Q?Wo4Rbo2o7W2Mr4YVgNo8raPTHbsNlmhcWuEGp3ToliemeVrw3924R1IBTbpe?=
 =?us-ascii?Q?RdNac2sAFONNmb3A7uWilEY0pl2g1CNoWtMu3dqHZcW+Nxd4mkjde5zqlm3q?=
 =?us-ascii?Q?Kt9UWujobqeNsdWwYZKorpXPdWo8tYZrj73szYBP7VF324zd615aQO4fjTVj?=
 =?us-ascii?Q?PTD9GxSl0EDGxxlaAqAKz56HKr9qvtgKtxxcNyrf2tqiq8J35BTQuWrnJf/7?=
 =?us-ascii?Q?uI7HjPlmGNRPUOLlABtadxzfwkbQLXTyvhLZ8ZceFP7MoG10jI9CbWgoCXfX?=
 =?us-ascii?Q?Q0HIqGaj9cfZ4L57HLTwSpwnYhbGKd3Q/65bhebsMb9o70FExpcJhoKJY0Wy?=
 =?us-ascii?Q?293mQY7hu72CB+yBTteCulsd45Ja+klhv1MPj1bwnTS7MAtjqMaeZphrdle4?=
 =?us-ascii?Q?8eFCqv7ZKh+dEXybsrdU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TI0tTKbQ9Mrp/5Zv0o0eQdQr/GCyMjXg7//tlV27JVIRaGLCdAxCrvnJja+A?=
 =?us-ascii?Q?99/Y/WVR3psYXUtjcOK9y/L4ONQYY9i+6//rJRz+a/RKNyKvNPeiyol8dwj4?=
 =?us-ascii?Q?J+hqyteKBYsstD4zBd4f2iwcsTzghaRkv6x0PL1ZHYm+iD6a1L10sXaU9K4P?=
 =?us-ascii?Q?JosBQlRds//zYdQAGQu1cqd53G4qcydG6Ps5y2Iod8azaPqZOqmQMzUhLDZZ?=
 =?us-ascii?Q?Fngac8kNURJguYa/WJ14oTlZawceW/+Cjcu8IUNfTFkJzd6u0FbH16tGOkad?=
 =?us-ascii?Q?7QoEZvQuVUdZTJ8yukpgsz/+ycFCEGuyOqMYunN9kme/rcocXd0CQJQ+b4cS?=
 =?us-ascii?Q?UOxXCagahyBPrR7urOPxuMrBIGX4CAplVJHDG7agrqVspEOtD71x0rboNnEC?=
 =?us-ascii?Q?f1IrzUUGoYlYz6PR0VKEzkBhRHq+P6TEpb5dy9R18hGDZB3tLuFxtMjtIRG0?=
 =?us-ascii?Q?ntFSMFKG1i+P14r1c8aDUjmsrJupNPYZexZpZCAhIZzD+vpxqpr5+aMxfwjN?=
 =?us-ascii?Q?uSvnQPdDFDHQQbTozgdvyNWmSTo1d4vK2fhSb8meTzGNPyLSHc+idlsiLgH6?=
 =?us-ascii?Q?p0Kp3gWRoCSTyh1V88h4YqFjErHlQeq3IEJ1orb+tYHaXwbKJbM1IeFzZgUI?=
 =?us-ascii?Q?DUb04yu/6vrY9DtLGJRrZTC/S5GBfcNLP0C3BmBeCoH6hrm0BAfaV7OzyE+x?=
 =?us-ascii?Q?kPzZuX/3i5VtpdChfX5/SodAmvFIdsrerxBwOjzA7P/2vZWbQRi3w2gshQKp?=
 =?us-ascii?Q?G35tiOjrSOaH/QO+X5FKf2GlNtm67zLXa4VYlPdGXBueVjUBNEMhDWdLmGzS?=
 =?us-ascii?Q?1ooGcrw3UhpgNIQHEv9eIfIQt/lit1dvKUmCTxXVWcxB6/HMeXFXxKNFIZ9D?=
 =?us-ascii?Q?Gj7epCmD1NsWk9nrvUZ3FYoTxNmBZ8MVcv3oYwI4H0KNoHYPKtHB9AzVJ44A?=
 =?us-ascii?Q?F7UakVpIGsZ8lzqxTj5ShC+Lxr7skmC+YRfsbXdw4tG7qRyXGRVDJs8p92pV?=
 =?us-ascii?Q?fo2MhyPiyauM3nnopW9zh0rAxrTYq75sZSnDv+v4eIg/Vq1CGGL0fawzB2fu?=
 =?us-ascii?Q?c6LucHKQweXW1ufIiC9Gwob6GlqCqzpWh2Ve3gd+ozKrN29UHIiqIDdZZQ19?=
 =?us-ascii?Q?RGtNjX8uuPsVZcqXJyO3TgZXysNo5OLC8VrCRcqAykLLJ+ZMxhlpAgcu/eYr?=
 =?us-ascii?Q?gJNNXAw13k7GLFGtwDGJKDfMsvLc5pyQPuL/MLxnyWgnbpjjOV4EUjqEb3Qr?=
 =?us-ascii?Q?ZAAd1z6izfdl8vjdzSf9yXzKpGF/74lhB1fOKv47BM3bLOc9xluE2YngMn2Q?=
 =?us-ascii?Q?r92jdzVLDxXNxgsAyU6jGJrwe7KlH7OzIRvuk+Kq8x2FXQQhLweOwmIz0s2H?=
 =?us-ascii?Q?rxhrPG0aFlJ0MQrh5o+HTvNIcx5dFssMK31ouE7ynzVGfafLv7HiKUXxj5Lw?=
 =?us-ascii?Q?UfVeJ5g/sOOtgRaSjSvAGO6d1v8OtxD/GQZM7x7dtFB4kme3ZOnYQGhG8Zm9?=
 =?us-ascii?Q?3ogKWzLTBdfmS5O7K7Ev+qBYkP+MoJ4egQHKLLy6PNsNmDToAOgb+ZS70JYA?=
 =?us-ascii?Q?i73uCxpbII41WwGGzzepx1IGRopw2TkCxxsOPtiyIB01J475luP6BFIRFxqt?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef18b5e-adee-49fb-0bef-08dcf224a42c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 23:03:56.7949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBODdWtn5++5018KEdB+r5ET+0lBEmlO3lJfcwynAGgkx9EEuElcQ0Czb2eWZ+oSX3Uumxibi3mjurJDn972LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6738
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

On Mon, Oct 21, 2024 at 11:11:46PM +0200, Nirmoy Das wrote:
> In case of parallel submissions multiple GuC id will point to the
> same exec queue and on GT reset such exec queues will get restarted
> multiple times which is not desirable.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2295
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0b81972ff651..6aeb007eaf06 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1784,8 +1784,13 @@ int xe_guc_submit_start(struct xe_guc *guc)
>  
>  	mutex_lock(&guc->submission_state.lock);
>  	atomic_dec(&guc->submission_state.stopped);
> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		/* Skip restarting parallel queues */
> +		if (exec_queue_enabled(q) && xe_exec_queue_is_parallel(q))
> +			continue;

This doesn't look right as exec_queue_enabled can race here...

I think this should be...

if (q->guc->id != index)
	continue;

This way we only call guc_exec_queue_start once per queue parallel exec
queue. Also I think we need to add the same check to xe_guc_submit_stop.

Matt

> +
>  		guc_exec_queue_start(q);
> +	}
>  	mutex_unlock(&guc->submission_state.lock);
>  
>  	wake_up_all(&guc->ct.wq);
> -- 
> 2.46.0
> 
