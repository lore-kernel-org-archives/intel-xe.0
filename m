Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3F9C282C5
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 06:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E9A10E202;
	Mon,  3 Mar 2025 06:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c9LRWIOt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127AB10E202
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 06:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740981805; x=1772517805;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8QRv5BflrkcRgyHz4k9bxy5QYMeWqFsjBcMrTaYQ3qw=;
 b=c9LRWIOt2JsIjwxppDUCppwfzniOF/JQYmvcPtrIvloZklNctpcGVfBC
 puOc3j67GPokcKvXn8PXETSIyyqWncpgXsgGx/uSpcsF/Gyf0ul8steqd
 bGw7paIPNa9EMl5RKCsEpTJCxFTwHhHNQtlAowexFRNHlHp8lxa4DKNL6
 Vmy4tY7g/qhwqQPuCCFlf6KsFChF7RL0/gaEpYQ6+4MGEUKOxYyjOa9rU
 FrwwcREsIVEWuuNx/ciG1d2gJ506QpcEh+kKjqECfVTBVB5AYepd8JyDu
 i1L8cc4yejwVXEJICuvHmz9wSi7t5akJ/xuTDhmsC1+OIDzJ4eE+Sco8y A==;
X-CSE-ConnectionGUID: z4dllNzMSTCz2fkOGSY9Ug==
X-CSE-MsgGUID: chiVz1Z2QzKtTYKM+CJAOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="52825249"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="52825249"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 22:03:18 -0800
X-CSE-ConnectionGUID: HnvzAyjRRuuyMnEgJW13og==
X-CSE-MsgGUID: 15OGPz/GR9+akHziyk9cuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="141123740"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 22:03:18 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 2 Mar 2025 22:03:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 2 Mar 2025 22:03:17 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Mar 2025 22:03:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMZxaVZUsXcJ90o2niftGScsn2N98eJWEkLvjv2qf7VXrAKgp4qknIc+0ANq+WPPN7e6AKIcEncsu7u0fzuEP4ycis5hF+SGMS5qXK28cS+5LP5sSkHyOKFbnw8e1udklS7F4XzW4TPTilBK2l7WB21l9BRuc3hYDemvqD5FhE2hf0e8fxkSUIQphcpBWc4uCiRQvcHXQkxUNy8Im61ycSBignrAGDNv+69JdI/DtvV4NLpAmDh7KAbUDnqJU8S3BpVQYDJRZd5AOIsxkwUjFXtIABADflMuysNtgH5RqLzluMTsFCRl0aD41eNP5IaSBueBrJJBOsVs0QHk7h8V0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AANyOCJljczOPvIwDNmPECBxTLa6hXXgSqvCxpOhG3k=;
 b=F9aWVlKDcIjfGbOiOzZgV4V4WeT0Q2KjfMZUPSB0FoWQjBecLaRjj78VbyN1pmdLBqlJxxVWIMR8nvaHt2rY9+eIbiKrVx18uhnVFKCpiv3yETjcBY8DdaK7DoN6yBK59TaBk3qKmDsQ0kpvlvHWOj0M17J8sZvZ5Vxn/6CSwc21Kx3iQhpM1O9ZoIFtcSdOEzCLgwPA3M1f73qsp8gaaUVbBPhoFh/GcZ1DPm7jUsMCq1mMT4Yt40+CgSqSdVXPqVLrr8oYGRbD/sQRsVSFSi6s+QbDWslzVb1irLsm0tdT4zlZUEZih+5RTnSDkWaOXV0X0XqXoSPx/o9iuYlDAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 06:03:00 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 06:03:00 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Wang, X" <x.wang@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Wang, X" <x.wang@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH] drm/xe: remove redundant check in xe_vm_create_ioctl()
Thread-Topic: [PATCH] drm/xe: remove redundant check in xe_vm_create_ioctl()
Thread-Index: AQHbi9Y2HKBNpYHCQU+wDzmb5KuGzbNg67HQ
Date: Mon, 3 Mar 2025 06:03:00 +0000
Message-ID: <SJ1PR11MB6204E2A69594960A4A7AA43981C92@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250303004942.951699-1-x.wang@intel.com>
In-Reply-To: <20250303004942.951699-1-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MW5PR11MB5787:EE_
x-ms-office365-filtering-correlation-id: 97f7ec9f-46fb-407b-c5cf-08dd5a190d95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?hwbn6hPEtaEAH0GCBuAg+e3CqNVhIe8X3Fppr/qS/d1rWQfhaZOoLLQVAQnS?=
 =?us-ascii?Q?v4z1paJd7cOrRuAVjn22aIkCWMQlPscwHDHIq0bU+xGzBtK5u6bmQW4JuU3G?=
 =?us-ascii?Q?Sc/N695OpfCKZsezF/HLV+Uvpb0Gg4x4BfjbYITFjsKuiaxEezfAbT92QTTx?=
 =?us-ascii?Q?f2wiVg8yaKC9ii8++OLOi5RJTm+yH54w/euUwSqtCsWonhfR2YCbnTBTFT1p?=
 =?us-ascii?Q?ZMUghTp0WBNWNUToNPtfxNbgAWMHdT9wS8Fge0BeDE8yB6uRZdPMPGQ5I5rS?=
 =?us-ascii?Q?bG4uTGDsUY5QtLaUIpXvVWNiaEk5Bj/AdZg/rdtr3hiyNEjy7CGN60OnX16K?=
 =?us-ascii?Q?XccIsyFGs6y38jGY4/cxmnWSwFDq4ND/cr4sX+XwX8k2upyvmUZfSdLbbUsU?=
 =?us-ascii?Q?uqpGTw1VeC7zUY+ec/RODlKT9+J5XGG12RNnBroavh3hgymjy+MRlE6IXhB3?=
 =?us-ascii?Q?iN8YCWe2+F7aHA7o9VpgETvsDps2gitKTdOV3XMg7zFT/6c88kCjDfWcd+ua?=
 =?us-ascii?Q?QoWKGFY+aRXEIXzIP6ffhOzOuBFinIZChacO0uZs3bARCpWoJkYR2jx3MBwX?=
 =?us-ascii?Q?Yv9Sg/cM7o2gJRW9G+OYbX9yXWT/R1mWOGhNxraG4RMM+LQLDJ8AQ0bdCzHx?=
 =?us-ascii?Q?MxXT/5JgYQm9/6lrgCmxn5HXqB3qI238AXO44iOY7GSb4BMVjoyJJ4TVF1oW?=
 =?us-ascii?Q?2pCpU9IC1rHBR6x4wkgGIrKQQcRtxUW8XHxjgn3Q/fHrpWa4y5uNLeF8bqdR?=
 =?us-ascii?Q?Y+NhVRsY6oiC1kjnWmYTEZSuDHLq59wt9Tu/wVbO8lJI/WFitvqmO6XwDC8L?=
 =?us-ascii?Q?tPCc5EOvxL6yFOUHMuujqOk1o0B7Q7XwC6RxRzyxfMwm8AO5bcl7N2YuCZKz?=
 =?us-ascii?Q?6AHB+bPIIl9MzFi+lr5yhpdHcNukRX4y8xLPGd9Q62Dkq2+H1ef0r8XaV5QZ?=
 =?us-ascii?Q?41Qjv1BtS9prQHzYIKu2KBqykqKvpusrJEJBE/guDlg79/7EnDB6mtDVcrCM?=
 =?us-ascii?Q?nQPtksRR9dSeQxjkxM4cW2UVOPq5594Nwq7CGo7uTU6+yXxFIQcRK4FZw0d7?=
 =?us-ascii?Q?fBq3SQt8vCl0fYrB0Q4JLRLslOIAsYZuINBi32+YSccoprLA65Ghe6ZPnmer?=
 =?us-ascii?Q?n1K+eUgj7V/m870UZX9McreHlQhTg3/j4PPsQfOADYKJohr1KEY+iPb1oOlY?=
 =?us-ascii?Q?hA30rlywZmY9aMGom0T9vLh02X3KbpeZ/bBuJYYV2PntEsnpCqZIw34xevZL?=
 =?us-ascii?Q?VbvQ++b9I2OxnXoN0KDZHh+PpKF+0W4EhJLbvZhQQbtCWBvlwBQweVpejnbS?=
 =?us-ascii?Q?Frz2R8PS8P7iGbS/4Yd+4kW1oR8h9OwamhQMMoxOUai44RmcSsxTDXTDkA5T?=
 =?us-ascii?Q?in3vDj4iBsoGZVe9uzXP9cQR4wBir2BR6+W7GBppVhavOmBnS4a9lSWzlU+T?=
 =?us-ascii?Q?+zahTGtJZQuh400b1dQH9DN9ILPetRjk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K3nDBW9YNvzdFRwCY8PRiLwQWGMEz+WNh7VWvGyqYuGFSjO9uXMrXmGDk3Lz?=
 =?us-ascii?Q?0MONT50wotVzmJdphRv2wIviy27hNQltJ1Ospuh+ecPAYDwAmwnp+B7gESoG?=
 =?us-ascii?Q?Ra3kOkEtpkH6mnSaucMJQH70LN1SsYt9PngmcAwHfqLei0Ct+IGIEMJcHyqx?=
 =?us-ascii?Q?L5OarvWC1rl8NZwNmVnmUMMA4SNpQOnjY912mex4BSpPEfEAUh+GTfFjhEr/?=
 =?us-ascii?Q?UGpFQ9AAtSs1BJdOR5X6hJ85SnrWT80JDAmnCfsXIO963wlf5pP/RbPqV4IT?=
 =?us-ascii?Q?tmFJXg+4YuUnXyz/QPJPknS1hZaCX/U+NAjp1buPxZ6EtXkrAFRxnfxJdCUV?=
 =?us-ascii?Q?ZwSMNcegAoX7/G1TQUGp9NU4haa37Sj28iNIrttMNEJo3H0kqDQKHtJfTumj?=
 =?us-ascii?Q?A3tK/kfgeCYnrLO6c9dDRHggaSzO6SPSdK6BPZf/8XUn8ttNgeFcenGsRFFs?=
 =?us-ascii?Q?fiVmWk6MDZybxAhOITOrg9fXuCb5K/k5hVfE3viuxi/VOsTFrvx/aXgpyBjT?=
 =?us-ascii?Q?THfy1FNImPwNTv5nHUsofgrtuY8AYEt7F9jwwvzlHAuV+2wUexO1EakBWIZ/?=
 =?us-ascii?Q?ayEU4c4iN1Eyx0YSZ0x6a5bfDbGj2iQgs/0rUK5Ruk6MCxyslijY1aNhdydg?=
 =?us-ascii?Q?/QGwf1WQ88SB36JRPT9rs9Uz4nOXTp47tP+72fph0BOAGJkJRqok+9/UqgWj?=
 =?us-ascii?Q?fMP0CvCiorOt7n+UNMwag6+VPn3Qn8O1q43KE2Z8/3hqbWRJqRX/TErvq0tH?=
 =?us-ascii?Q?643DPzmsdHPZx6Fk6m1+adv5kAPXrDzDb21T/OS0JVYF9gx11MyPRVkdybFt?=
 =?us-ascii?Q?Nz/xLCKViIDc4ySfWyO5N0TbqbpeW/Jalk8XlLJdavkDkAfQ1UPTL1hpC8LL?=
 =?us-ascii?Q?V5YRQy/GeWT3SqvAM3BIo+CotaRhm5UxbzJ+JxeESTXDeUrgJmp7wrFXmqB7?=
 =?us-ascii?Q?xoDyAlDMdtchbuplA53F7QKAqSd6ayZYo6uaX1R6n/Q49+BjlguPb2Hrj/DT?=
 =?us-ascii?Q?kYCq2arpZmkH3Ur/147oCScZixL2GwWkOL/uG35Pc712uRhTEm4Vg39rHnU3?=
 =?us-ascii?Q?MEAqc2IBgzM5FCh6TSBcBYUP1IHzwnjlYbrFazSs2jhoDkZOQBci4b8LSM6X?=
 =?us-ascii?Q?ZUhWvKu2gJVa6G6bioDDmkIpZSzJWhldXXpwsh+aoPXUTuLtIe7jwxxIJm8h?=
 =?us-ascii?Q?Z8PD0VhJGuinWoj2xqQ0UgEAHF/mVN4hyf8TC+t6IHlPJayX7NFpiRaJRMvl?=
 =?us-ascii?Q?+lYaRbzpklXpUEjI3l11tGv/vZACHOGRJYnu0qeGWqXQutnRjblcP2SfEqv8?=
 =?us-ascii?Q?OFxptSPBYtV5VurvwlpODl7q1TPT5EIsmPneF79k59ovS0IXd8p5WAZ5BUmP?=
 =?us-ascii?Q?Y2jNYn1IuBgsbDjNI9jPAfZMiUfR/Mb5mh7UUvQbXE6NpILQQDXj7/lk7UEa?=
 =?us-ascii?Q?dfYC6ymKao0xyrq8dYfsT8SrCUhJb0K7Yf6hvgWbijIq+eT6gPJi1/ffxqeU?=
 =?us-ascii?Q?yqZLBAm2eHsr1NkK0c+Bjf899+ZOSBb5zTABh17f99BcHWIwOsOXFcJqOB9w?=
 =?us-ascii?Q?ZaPkDkohdJGQ6luqtSIiqVGFFlkVLGiUODXge+Jp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f7ec9f-46fb-407b-c5cf-08dd5a190d95
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2025 06:03:00.4506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SGbfEt+amIqVpwwkWNLdgTLxj+rCBz4ujVgGKM96sYBNqfHWQjQepEYr3iV2W8su9pRIJl7i72RPbohY+jdkUR76yV48j9Eu06xYNDw1PTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Xin
> Wang
> Sent: Monday, March 3, 2025 6:20 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wang, X <x.wang@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH] drm/xe: remove redundant check in xe_vm_create_ioctl()
>=20
> The check for args->extensions is repeated twice in xe_vm_create_ioctl().
> This commit removes the redundant check to streamline the code.

Fixes tag?

>=20
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> 996000f2424e..eb76f6854b2f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1798,9 +1798,6 @@ int xe_vm_create_ioctl(struct drm_device *dev,
> void *data,
>  			 args->flags &
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>  		return -EINVAL;
>=20
> -	if (XE_IOCTL_DBG(xe, args->extensions))
> -		return -EINVAL;
> -

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
>  		flags |=3D XE_VM_FLAG_SCRATCH_PAGE;
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
> --
> 2.43.0

