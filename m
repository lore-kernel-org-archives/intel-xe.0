Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E210D64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 22:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0C710E137;
	Fri,  8 Nov 2024 22:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCmloaZt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464E210E137
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 22:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731103687; x=1762639687;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bKE8z0Cyk85Pm8y2VtwJjGeiiGE5iXripLjgkSi1MUY=;
 b=fCmloaZtNKWVYu3NALCy9l2Nft6SP2WI2KIOqOQNiJO/f7wLvMYBYYza
 MLvnX8ZkpZmvvqWpaYyKCKO35qJAg6sOYgOwe9FWpszsLhG6KqEiiLY2c
 AluZ8oColsTs3EkbebOWKU5+Y3Jq3o9Tdg4BIhTSSQwvwf1OgrHgDLziX
 T+1sf3oFKXXS/vMdZqkUdXjTnGIEuFafxJn1ItP5piF+KiGmqH5V+kmcK
 rYgChiLS+LH/m+eOMwu5XXZ9oLwjcZTl4C0XReO47Hp/l+sRVlfKROU75
 oLrbQJSpM5EnmJukj4JPrHtLs6Gdrh4L0XlTkc9FKTmaXGeSmwg0cyCSZ g==;
X-CSE-ConnectionGUID: fx45fMa+SjSgvpgDDG/Xzw==
X-CSE-MsgGUID: h0YCGDwcRrOXuN0LE9T/vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30883474"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="30883474"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:08:06 -0800
X-CSE-ConnectionGUID: N7wQON3JQqyKy/05neMVaQ==
X-CSE-MsgGUID: Q/2Y24dSQBGtzJLWaNHUww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="90604931"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:08:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:08:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:08:05 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:08:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pmxkr2W8DU3O50cJ1EOanajXdVBhQ60DUuRKX/tZQyROkloNgYY01z+9tnTg1qYuWKpru7R1l3u5gFPITHABaAxqYY/jzsNHdffMkjuQgBapTU4c7cvpBVBNduwfX8WCyTyqwkY9Ds9F2yAIbxfddRJBgIXN+tzfwRQIM4pOZWujWW/BbGc+Ls3wFwSAF3BEwV1Eik/8sDpbQnM7KS8UbdWrNfwQX8EyEnDymXZDGeKxdgEKkd67IugKEC4PhoUnTdNf0wuH1L7vG0OkrSt12hoO1i7AakN/N9df8lPSA8ysadCDMU7TPWqnZvhPoEo+8KIpIFYQXYFLEZ99mzK2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FEZw5cHQ4/CUlOb4KgL7XCDXS2LfE9TV4Xsj+MWOww=;
 b=D0A7XXSmpr+Zin/lilKciEGgzHt6ZMtUZennWGDmuuGjRr4dHEuVFcYLEwlMmjeF2AVkeq2GOVmPr/ja8X1GoFKl44Shri9kABd9WNTWWIk8ctXMrkqIBL50XsA1xVHixtqaWdLLlAIucq1MtAA1fhCPhaCMhnrl2WV/am+xgDqp+ADe2+hU+7gETAL5Z51xzTJ3hZyoTS7ONxplh/berNag78KZQMFTi9T+GlEDl+BDabDhBgH8TWNEXLpsRhIVPIdrMGblyMWcf7ywt8FpD3avOYoBL+6Sk2ibBTmYRAr6TtaHQlqvOJILKjfRYU/voQ7RwACFE53SyWGB28uwxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB6849.namprd11.prod.outlook.com (2603:10b6:806:2a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 22:07:58 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 22:07:58 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Dong,
 Zhanjun" <zhanjun.dong@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 4/7] drm/xe: Improve schedule disable response failure
Thread-Topic: [PATCH 4/7] drm/xe: Improve schedule disable response failure
Thread-Index: AQHbMgWshqPBD7IYPkC51ZgyV0KzK7Kt8Sjg
Date: Fri, 8 Nov 2024 22:07:58 +0000
Message-ID: <CH0PR11MB544471417B23A09AA6ED80AFE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-5-matthew.brost@intel.com>
In-Reply-To: <20241108174312.272792-5-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB6849:EE_
x-ms-office365-filtering-correlation-id: f96facf5-eb2a-4097-ab5c-08dd0041cdeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Farx9qgXeQAf3tq1UYB1oZ+se7RZ+bitFjgZjfQR4QkLnBIL0Te8+6RYLSpr?=
 =?us-ascii?Q?X7RIVKU0OXeOtZNjgJ4eWt8tRfjI6M2m8GjpILgyhyGtWYZ2ssWigjyC4zPN?=
 =?us-ascii?Q?NFvYaFTvoks6B0Llf9zT63DPrzQg+M71EqiimpVEzSC/Y3RBu5KcsIDdHSb/?=
 =?us-ascii?Q?YIRmIgjKbwoX2ZYqPMd+0KCSgvChn1S6lq5YEE12sqLwHmeRmNtSpktkKpnP?=
 =?us-ascii?Q?FZ7CxIGoTolJ8b23BfhTchduLpEzY7x5LEVV6fzLT0n/VVhl47eqc15hF0Ji?=
 =?us-ascii?Q?NKTJQ2UBdVqNy5UdKEL6r07Y8yhZxGQBo2BFDr961DfJvbt99EVWQhQ+QSv+?=
 =?us-ascii?Q?BURaxgQu8Fa80NXst6jKFr5ActgOaZxY3T6VVjRk9xqrXwzcFSSWi2dkd803?=
 =?us-ascii?Q?mkScBxcf6taIUw3EPYPeJhNj7K/K3npayqm9sY2zFZCi1d141SPvkdgNS0ud?=
 =?us-ascii?Q?aVac1IecWmIrAS580I1GdmzrEknsdOQusEwJbd1kKFCKe9kTATV0v6aS+GSk?=
 =?us-ascii?Q?df8tcRnkGdJjvAbSXIy4fACUCeBWAln9lz6btbDX6A9oqK5rCW+YjIaJxCZ5?=
 =?us-ascii?Q?I0terMiWjSWY3YE26xInwlXjV+wJqnQNGkmJesZTQZCyld+4ptYo5QnVfhLl?=
 =?us-ascii?Q?mneg9urrGCoOEq7ua3+X8vJov+T2U0LITf7UxYbH+3vjRgkWhyaFUEou0kWO?=
 =?us-ascii?Q?uz+WGOW57DVwbKNGvee/YIIsBjQGWCxLw5OK9DSCBC2J+O1NqRIzxZ73vQu/?=
 =?us-ascii?Q?y3jDsRng+yFMMicd6VBIj/JEk5w/0NjLBr+2zVC+ajssnrTdvIfibm5OvujT?=
 =?us-ascii?Q?pIpKG+N6F+zaTsiDk7CIUC/Zjx346yc/Hu79Zrg7TlebPEn2eucXSCOJbVY8?=
 =?us-ascii?Q?tsKI5wyNw7tAb+nn1FELPKEosyajznTTtY/4NnXvdPr70clyQG2VLN4Z9iym?=
 =?us-ascii?Q?Ry+UmdxYSt/IaqP5LOAvXnTthiuSDfz/tmFyCAIa/zy5RdfmRTF0GBUWTWzb?=
 =?us-ascii?Q?/LHqqDx6Q+M7A/1mthWXZnY3GlSzuyRrBzuhJPaB4vg9iU4SMZ2r2pBV2N3j?=
 =?us-ascii?Q?V8mFzzVR06BKdEmmRxHW/XhgGnQXvmzMj+++MIrOGZMdTM+Cz3L/VpNWCIw4?=
 =?us-ascii?Q?EbABKiVuLJB+bjbEJOct/uaYnyEHgAQarbWYXb5efYnRAwHa+zj0X2x9z1k+?=
 =?us-ascii?Q?l+KmjyJW61ZX5JcmLJ6uhVnego/B4EZQbtLvo7jwsqJFtr6lKbX8SLWaMUR7?=
 =?us-ascii?Q?0Vs6xCpDy8T1YPi2zI5yNT3YBzqGHDlM+Asncf0XBYintELXkUl686PoCkqI?=
 =?us-ascii?Q?SdgRiDmbBf8KXRJBClHtwbByDA9viF9wwAdsU4gipo7PdSXAg0WW08zTwJtw?=
 =?us-ascii?Q?KgNzPdc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yE7mOxwGO+EMG9o1FfAGFo1igJ/2ahfcltQW7NNI+O9JXq8dKZbB8ZleU/t8?=
 =?us-ascii?Q?L5H5l2eIScZF3+iqXoXm46okcJeFqATEM+zaz3ZUFAhR4scbtGBKy98sHt8Q?=
 =?us-ascii?Q?iAiCtgtEnloqa1s8WFgDJOW+/fP6SFlexQF/+1RV8atDmAmr7FOKpjnE6rxY?=
 =?us-ascii?Q?MxhXKN7F8wr+522wzXi9ehzbS867kgzYH3DyoyR8svXCxbRoowg15EJHKzbq?=
 =?us-ascii?Q?iUS0EAX4+ibKaVz+KB2qQz9coNlDZ+sx8x5AjuGHB61ANNPfyjBShpGjbn0p?=
 =?us-ascii?Q?x5QY3uNV1u1U8MfMLHE/vrO4pGy8xCEqOGDZXicgtp+dOTGh0+sM5Ylm74VU?=
 =?us-ascii?Q?C7jEX/2xvX4+zqj25F4FNIcLlRfCInJYMtcGgxe2ZE3FHLXLyHOOnAAVlJLK?=
 =?us-ascii?Q?lbXQRTCWWoqYUNjNunvu/nL/I0DwKw3ywawmzQYGvicpERkBsL4pPb78TR8O?=
 =?us-ascii?Q?W6KpKEIL2ya9osRmT57CUiWJkL+5vy2v1434FpCIW/KDGV8xNj8XhjiXnDxN?=
 =?us-ascii?Q?AHfSiTpnLWrhbjjs7TQJkk7OQSAbPJhWtuAV3KTVSCPhRvvCWsaquxMUWGVm?=
 =?us-ascii?Q?apJC0M/ATgJ+1yYrPocPQfZV1jJcl5Oy20xvyGNXcmgnNG4kNeBAMFnjYYf3?=
 =?us-ascii?Q?ruBa2r5Jry3shRFo27a1aqOypX2lqOuXTFZetiP8QaRG7PaL3juP9O0DEKeX?=
 =?us-ascii?Q?gsPfrbP7if8/ScEiBoKXkKLbXDV+/ZSkivR+0Swzx8GRbYh7kzK4yTRdYXNE?=
 =?us-ascii?Q?1IcW5w+abZn/zsTcO9IUWg7FMAVNIJU7UzXUiZYrhmeyb9X+C+PP868Zp9Yx?=
 =?us-ascii?Q?CkoAKxxvZawhkQTXTWc+OEGtQ86ciGNkjupSpM+OfE/AyocBJJTfRTN9k6Kv?=
 =?us-ascii?Q?/2OGtIQ7YgmmB0MxyUWMi1dkfqsdmf0W1gLRkexCCzKeU4vt0VbLh7EJ+fbK?=
 =?us-ascii?Q?sPBM6tqYxBhfk1Jra45OCvYK8Cfd2h91xbVAXrPlx6HI6evVvST7BPfqxsN1?=
 =?us-ascii?Q?2FzsSrru1tZ5ImoRfRxys1EZLI9gT8UPYfSOa9Jxh/DTCsBkMiG87somFtet?=
 =?us-ascii?Q?7mYqILgLV1e91bav9FR2aEkucrjlaXC3CJ0fUrkmBC+E8cyJmt4cx1dWjzo9?=
 =?us-ascii?Q?k9T9GUtbrsCmL4UGXbB+Oumi/7BW6iunj0PI6rwVqWnPs/hB3ebSZgia/9OS?=
 =?us-ascii?Q?SEYFsAt7CxYJNnum+jsIP2p7XuuNCm+hsYgIeVWFBLTKFl/tc6uuUWTv4j7D?=
 =?us-ascii?Q?H/45s2fSXP/DAcC7F32lJHy66pl23FfvpyYmfx8SL4KMqhJHFCeJq3swAWJ+?=
 =?us-ascii?Q?8TtcwyL17+g23mpC+8piV6GbBaEXhgmh+zC/UMg//HEVMFjUiQBhvaYxUrA9?=
 =?us-ascii?Q?BtLWsWa7CF061a+6Ezkg1m38rgjVAn5wfVzMYJYD2bgzVZs5ZPzR+k26KY84?=
 =?us-ascii?Q?/WvFc5Yt6LQHHW40Vlq/1mmI2XDNHOWTzjHKeh3EG60jfmPa3YzlcequyAVO?=
 =?us-ascii?Q?C3qjJlJ6/6Rc0vxioC0dz7IbleyKcjZSokLvuPln0mxmAF0YXR1Q72mACQrG?=
 =?us-ascii?Q?EdLs+HDxYO/oVEcQbKG60fUKSRh543Dp3IX5+mAT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96facf5-eb2a-4097-ab5c-08dd0041cdeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 22:07:58.3882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZYINzfgMav9UBfztsTctU0N3OQtHww+rXQ9zeonu1hvtACZJOwfVtc4BXMu8ChH6mS8EJ6jrY52o8xFha1uirfcpWdHTP0b05d4/RwoZpPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6849
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Friday, November 8, 2024 9:43 AM
To: intel-xe@lists.freedesktop.org
Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Z=
hanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: [PATCH 4/7] drm/xe: Improve schedule disable response failure
>=20
> Print Guc ID and take devcoredump on schedule disable response failure.
> GuC ID is useful information and a schedule disable response failure is
> possible the LRC state is corrupted so a devcoredump is helpful to debug.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index e7257c681278..2cf4750bc24d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1129,7 +1129,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *=
drm_job)
>  		if (!ret || xe_guc_read_stopped(guc)) {
>  trigger_reset:
>  			if (!ret)
> -				xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
> +				xe_gt_warn(guc_to_gt(guc),
> +					   "Schedule disable failed to respond, guc_id=3D%d",
> +					   q->guc->id);
> +			xe_devcoredump(q, job);
>  			set_exec_queue_extra_ref(q);
>  			xe_exec_queue_get(q);	/* GT reset owns this */
>  			set_exec_queue_banned(q);
> --=20
> 2.34.1
>=20
>=20
