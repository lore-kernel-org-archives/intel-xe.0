Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC7DC27C5F
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 17:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81C110E033;
	Mon, 10 Jun 2024 17:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXmuNbvT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA46410E033
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 17:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718039551; x=1749575551;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wgcRvnuSXw5LmvUox+mbCqluXHPYViiAbEDlgsNWrFg=;
 b=NXmuNbvTE6ajvJkAY9yjPaQZ+3hGPec6rtrICzoO8MbvioIizzvHKz64
 knRtVhlZeSDs15+cvG8B7Ekz9UlEVjCO6IbA7/oagD2BluNQK6JgAL2Rv
 xwhgFtv0t1/PGwBT4rcUJOB604HlFZVPcJHOpY2gOdQKYjjln8PQl+1yL
 BAQcScDJ3zD+7F/UpnKfFOweqBSe0KuXyOmIHTw+0pVXiJUd56pLeKchD
 8P6uQi+8rNRhqHgo4VvW4gaPdYHZKIN9rB8iGio9fbSBbOvMpR+mnG8N2
 FKj/YtE4p6bptVwox5DVAV37hEpsgVpmStVBj/1YFh+r2DMf/6nvb/fUW w==;
X-CSE-ConnectionGUID: cNDqcHY7Q6iB7bTW7FtX4A==
X-CSE-MsgGUID: pD+8lIa/Qlu5NUxZLfqTBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25377293"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25377293"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 10:12:30 -0700
X-CSE-ConnectionGUID: Rtud3Z0dTS6ltCcVlNDhzQ==
X-CSE-MsgGUID: aJdQ/7yhSj+VrczstXJBjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="69919351"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 10:12:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 10:12:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 10:12:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 10:12:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 10:12:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmR9sjDusFlhQDnMalgoxlY0EH/PLMLctd4+ooJGRblVQ2PruRNWNprMUa7ooMEZJ7T7obDSq/f4nVgtSzZ3ZFW256BHW1mnL9uk2pGqCnf9vhojIwnE55w7iCwYizw36W/dO2cehFov1LMrsmTdLsKEG5hh0O9dDVVhp7WfNe3iIS3pY1uNOuxJXwS0rxXYPJG16AVpEQWPrTxD1iSaRyzxif2W3WoBeoapVV0X71pGD/oaY78Pa3VADY8A8b6PRxbfqycViMEkjKbznIwJj9guaIC5vvAm79PRBCn9lfnDau00YQjDVf4uzixgRiNnyEQpVti/MF2+W4/spFtCEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSVZ2TmbZLXB4mooNtRPBvfp9dRGZBuutjQOBLFU55U=;
 b=LFHkL5ME0bOoeAOB23Z9uL6OS8DioOsx6V7aIZYfzvv2jjRz6WxrE6ozpRwzxtYtIFg1IPIRfqFu6V8EH/Nw3CAoz7lr94vXUxgzD82i0K2oV+rmBHJ4oTOsUiR9h9nc09Wi6vMSbgYm/eQD/PXnv3jwWdKFjWAqLMf/Geykcftw8epG7lz5Utl1/G0u4514MyCKFDBrpC7ngS4/0l+lSy5ShciYhMtwW6C969W82F/60OQeVhlQeB+ewD8J354tvu3KPZB3s4slpcdrn6WM5StbVHgiMr5Y5TYASzOHog84ejx+cB26POp3bDaD0yh1rGDLO4SPWs5MyNxW/hiQBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 17:12:27 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 17:12:27 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5 07/10] drm/xe: Add GuC state asserts to
 deregister_exec_queue
Thread-Topic: [PATCH v5 07/10] drm/xe: Add GuC state asserts to
 deregister_exec_queue
Thread-Index: AQHau0Eeus4GDsl4ZkC685v+W0yt0rHBM3cw
Date: Mon, 10 Jun 2024 17:12:26 +0000
Message-ID: <CH0PR11MB5444B705BF6119A07A923E58E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-8-matthew.brost@intel.com>
In-Reply-To: <20240610141823.2605496-8-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ1PR11MB6201:EE_
x-ms-office365-filtering-correlation-id: 0c6f7e0e-6151-4ffb-8f02-08dc897080cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?EUXref2uemzN/hjJhoR+ZeAqwxIqkB81cHRyw91Tg+/YLovfHdx/AUaq42Cp?=
 =?us-ascii?Q?JQ7azAjnr54W/Q6v/4BDRQsoSUyWIiAGdASZlE5xBBkKVKABRcgTgSUDnQMS?=
 =?us-ascii?Q?cV0tbiO+JXZ9pC1W++wQJjNXkmWrRjJdQhIair9rW/+H0lqbghjf0qgpNrV9?=
 =?us-ascii?Q?fT8PluR8NU8gLJ4Rt4Ffo4JTXFIv+AXx2l3jp9tZjSWXD8fzjTAdbpdNl1hx?=
 =?us-ascii?Q?Z23JOb8uLKge6lXqZGpJa6iIWxhSnCQAnCZ0GbY9+XzLNWPQi+NZ+KnsEhMq?=
 =?us-ascii?Q?bLYR6Z1ZmXWYJ2z7LsADoqfmMgTHidw/YUZrmHwrnxP08qziqKbSLv0Durkx?=
 =?us-ascii?Q?LF2SOoDvxZBxzMJPUVnSKfCdexd9Rakk4n8h3Plbdz5HGtMSaGx46vyF46cE?=
 =?us-ascii?Q?L5f9UVWqxvXNtHK075KghepcpkQGYYo54uawj42D+hhl3eHI3t7Z7xEbrsAx?=
 =?us-ascii?Q?mEbyDnaZi0h9Js2opuaklWxpFtpohGdly6mMcVMShbhZENZJ1qaiW56OglCe?=
 =?us-ascii?Q?cAIjstEwipJSmkOPPA7Q/yceTq78ZnBzlLIgloR710R+7B0j3ED/yKgE+FCe?=
 =?us-ascii?Q?vd+Tan/mkZ9Sm9qJt/YlBSd/Iijx8TuOw4PBydqVn+SD+kJlo6/c4IAvCWiu?=
 =?us-ascii?Q?tMUMi5nUxu0ho1xK/oFQLhiRpXjC+FNBmbBVQRssXieZMtx+WfYg9j7SUkt6?=
 =?us-ascii?Q?IziAy4hULaR9ENUqs7aByCx97ycy++xRSmSkZahlrBrKtSLmZbn/AvoAQ8I2?=
 =?us-ascii?Q?4hrrwrZVi/XAhhWBUhoFxQZhLXVqrhO+MljigRLRbB6aWpyuAOArEZiStnfW?=
 =?us-ascii?Q?3JLVSkX+8DNhTZXX858rFBaYGm4XtcE07VvfITp2gLskkdkx0oOxsmyvAo9i?=
 =?us-ascii?Q?ZwIIaOUAwOmBCyvHf2PvYvEds1NBb242KgwlM4wrx5zwy6B369zBN6icCCS/?=
 =?us-ascii?Q?6NOqTUUm99ZxDE9gZV9oPnL3JCVxA4v7ckX1j5NDW1JcTosnrVoGXkrkoKnZ?=
 =?us-ascii?Q?+LQNRtmQFu9KiLDNVJDHKBIMANblEcF+LlYsfQolFCFrm/zYg0uermoyyAjb?=
 =?us-ascii?Q?35/lVHUtL88r896NgXwrO8pAYnrxyaoKm16yGBGON5CNV2/CIVrE4kridJ1L?=
 =?us-ascii?Q?9Q2G9vr3rFlA+8CZQIa5hDi7F+Z/MfcZeJ22j4a8XcuAyD8J260XhnzElKn7?=
 =?us-ascii?Q?wih/EoHBqlRmZLu0mrz+pEUlJ3epYuxnSRJgfiSvPemak0HaM7C/CsuiE7Rz?=
 =?us-ascii?Q?dZE1hlP+OdSclzg787/K511FtQFSqaKjl8bgQ7x1unzXRaLu+6hvGtOR4snM?=
 =?us-ascii?Q?QPiaMd691C7GzdGFYoOr4NbjU08GircqkX0GZ9JzZmanwtZ9uwgDSKJ7Dtf2?=
 =?us-ascii?Q?Ini8MIQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Zsja1v/WLI8zp7XTO2io57WQ7d982KTbBevENDazF9yw+7uhpjTv+J/aByGl?=
 =?us-ascii?Q?N3nB47fttgiCAvWVIWKO383JoAqFYCtFcOAtinnsHV2I5KB04ax11HKUiG68?=
 =?us-ascii?Q?ksvTRlvdHs06w4lQ7loYOM4ZCmfBmgt0uf9jD0zVVSH8q/yLKiWc0ok3kU0m?=
 =?us-ascii?Q?Fq/8IOyyjEnomBi98nMW7oje+YIYsw5QSNX+OW553qhZtYvx1tqESM73CK2g?=
 =?us-ascii?Q?cfxfnjsrxg0smgYscv075gu8wyGukRW5hdwxPXh6i5UZrgrVqaWyeQSf8wNP?=
 =?us-ascii?Q?DUyJBrZAKy09fYZtn1zrBKbOYSkh8u8XXo7EJD7pCj4TF15cWiuApjK8vfXW?=
 =?us-ascii?Q?espk3qU/T22IN9LGsy74ggLGx14+vTQfRCoqg6JVB3W0IrOTVvAzwUfBJONH?=
 =?us-ascii?Q?x3kK/7V58Dn0ZM0juMlQZRL12gbgAV4AIxDCfTJ/jK/IVF1U9LP/cbAUktXl?=
 =?us-ascii?Q?Noqj39y7YhwBOWvkk6JmC76CoMX48B8uKeEvGcTrXptKN9B3SwlT1vkR+o+7?=
 =?us-ascii?Q?iWmRsIxJ8Xm+ZdMW01+u0kW8onia2gy4ivxw2/jrrTJ5hiiVJrafTUB20TGb?=
 =?us-ascii?Q?j0E0HSY8VfjQk0NSEHKWS2dD733i97IfRq+lmjPp/LRdMGNVLeGyKTiJmVj+?=
 =?us-ascii?Q?JtsL0J8yB720eD6wapDMH8/4+7Kt/rSfLN5dzz7J3I+iar+OHsdpi9bnYqNT?=
 =?us-ascii?Q?xfjohuDBdroCXVzwD+AEml0PJKvrmsE9dzQuPtxwfnX7V5b7zPtuUf/AHPrx?=
 =?us-ascii?Q?1rfnuz0VmLOaXUDnSJDTxIa1ZmY1tKDC7gX+ggsK2l+Z6G4wy2q9zFLAgLvr?=
 =?us-ascii?Q?IlYGjo3fiGhOxGsiUgQ7xvEk8uSsAJPQ/HFrOH3r1CoJfv9vVz2ED+6Iqtct?=
 =?us-ascii?Q?CKanheJOsT9l59r/VTkqUZRMDoPTEIm4Qkfh9ajL1fGc1HvnXjuJ2eMWbbTz?=
 =?us-ascii?Q?Uux9fiwghQZv5j2qI1EHt/Vzhq2BZGq1eVI3rKOAo3v0ihP2XxKofAB1zk5b?=
 =?us-ascii?Q?uv2+JnSLiKTXr0OirFL0aCuXiePhsW3OQ6UN3uUBg8EZh+plGh/2VpJB4rzi?=
 =?us-ascii?Q?5BpLzJZYb2gRt6wnwcPfGuxzWeLYvtAzKmmXmH+irZs6A1gjX2nIrqLZgBsQ?=
 =?us-ascii?Q?rB6hdFPuJ2c6zjWFdpPwR56h98QlQnQ7RJVFwM1S3UMwFfIb6xAo+vLWXRsg?=
 =?us-ascii?Q?k4YH+dyvzdmtE9Jzp+p18ksOFqf1LCbS/iGWtTjXX4i2Vdf3sK7tklZntC9q?=
 =?us-ascii?Q?3zB+DCGV0EiUFUNCtSn1kIKB3AJ2Jf8eXydyJv5Sby8ZmasdBxFXGE3etAVD?=
 =?us-ascii?Q?vivhvbUSHI0LVP3lHtnWYNmjcJRhqDZY1hfOBJMIyT2hgBkQW+Cigmtmj7oS?=
 =?us-ascii?Q?iWX5bKEwDH+DnC4+0nJezN4uNiLzZJ611gYvMNC5vksSnO8laA08szlVdrRd?=
 =?us-ascii?Q?4ybAFWyvyS85p8MyvEqSmByixLWavuf/LU2j7Px/O11LfjSP6k/yIH7TUwaW?=
 =?us-ascii?Q?0c+pYASlKD7jgx0EZnbYRHBIghUwy9355jF6vQmCXTaLnTyHyOjZXI6tSZ7f?=
 =?us-ascii?Q?LC8Zy9oVIPiXO4aYPr4CSd2Yr1tdRUzMZGVndn1Z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6f7e0e-6151-4ffb-8f02-08dc897080cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 17:12:26.9727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LYpzSaY9RvSEb+igznJiGF+XIRl/j31/yb/NhJcgZCJJz4VJOQPVeVAasBaPP2rSPu1exfjihiAs5yoMS40Qvg9XcX9Nvdo7cNKDWu3+e40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6201
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
Sent: Monday, June 10, 2024 7:18 AM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 07/10] drm/xe: Add GuC state asserts to deregister_exec_=
queue
>=20
> Will help catch bugs in GuC state machine.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 766ff8e48dde..e697732f1e74 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1587,6 +1587,11 @@ static void deregister_exec_queue(struct xe_guc *g=
uc, struct xe_exec_queue *q)
>  		q->guc->id,
>  	};
> =20
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_destroyed(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> +
>  	trace_xe_exec_queue_deregister(q);
> =20
>  	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
> --=20
> 2.34.1
>=20
>=20
