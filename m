Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C3BD711C6
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 21:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5F010EB73;
	Thu, 18 Dec 2025 21:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R48xnQqn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D5610EB73
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 21:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766093498; x=1797629498;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2w1eVOE+0q22C+1PcB3xjt2uk6WSgwxtuV1cESr7SaI=;
 b=R48xnQqnR2eOGeyGnU7tLmXDcC2goZwOqPI2y8NGgVvNJb8pusGeTfNW
 KgrM5cwPElnEam/7IGs75QVgzjoF/4rxyJoLvqJdy/OFACZWCD5K5mYDT
 tRAW2n3MMny7RPaNFA9b76PT+4/UXP7RgeCgN5QT1dayoAzr4FS12RiNF
 2M9EwvZVfvR8kTj7/aXJlfBYLMU8La92f0Pw/aojJEVPdIZpazMZuB2A7
 9Ncq/cwL2OYbcS42xfycKBkW28/Ijo8ydEcE2raqJNpNGrHj1okFodgUd
 nD1vG/kK+u7nTd6ArcSN0lM6gSzBoTgxUNYQDfnTte+JDo/PjXp/8bXhi w==;
X-CSE-ConnectionGUID: PtQBgNLQRaitAOEvEWRBoA==
X-CSE-MsgGUID: MvZhNRNdTDWGTbs6bsXgLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="85643273"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="85643273"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:31:38 -0800
X-CSE-ConnectionGUID: WVCXBq7LS3+nK7FZV6gJPw==
X-CSE-MsgGUID: 23KhUFkaQM+ehBDCwITFhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="236110368"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:31:37 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:31:35 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 13:31:35 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:31:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLL9AlA+Q6tCPmok1paqslgKKfOfPnMXV4jA7Ug9ERB4F3/BDNzMT9PMhM30cywXELI+tspbh/uK1GxCLDwl/Mco6Q8cHO6E5aaz0GaVnWvMGtuB9CT85Bc7jtubMtbH4d1NQZx+CxJ+KKRdYICQHk0sOfxfChzcUgHs2YowWEd7dK/JofBH0VLcBAnTfqTpNIx3MJkLVw30KJWgQgpYLMG7jIQa+0vsIMyIDGV7sWo0Wp0xdW8RK7LRUqdEKxITmckcsnHPcnIqEzl371euWltT4SJiZ4Pzk78jz/Yb2z2GFUR6dNWvOhpXV0nrty0kutTRdADzkU1dqZJ3PeFgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOX8hjmZbDDIETYDrSsMFGEQE+y8UKPMyMg8GsJAGHU=;
 b=FCMbQEalmKUHUCkHzNyBrOkK0tGBQ3JOzjWZm6mM0hWE06hVVdrEvyWB1rk7F7dLgmdjTykG1cgMGBlus0587M+fOA/VY/Whu6LRQGGVostEkxdaPyEpab4Q8XiXvzOyk04q2Y4TLfyePhpPJK4J5J1zEjOI7xrtFJibfKtTtpFMBNXPxyAGg2ymucRu4NVli3kgFDGGbivDKbXNsqkA+4oEJ5mvuYekmCINqI6OAhbAshM9rGgpN/g0CEVWLNSV2XJqZVjdmvWEwOYCEtyI8ZuNVkFjqX/Rkvy2Wj0qtab55uhLBfyz79N2ib8t6j74IH/RdZG5hqKPs7z28pVdrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM6PR11MB4579.namprd11.prod.outlook.com (2603:10b6:5:2ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 21:31:32 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 21:31:32 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
Subject: RE: [PATCH v2 0/4] drm/xe/guc: Prevent compiler read/write
 optimization breaks
Thread-Topic: [PATCH v2 0/4] drm/xe/guc: Prevent compiler read/write
 optimization breaks
Thread-Index: AQHccGV2sHOoE6wFgUSoCyJb11V+k7Un6kkg
Date: Thu, 18 Dec 2025 21:31:32 +0000
Message-ID: <CH0PR11MB544447B8599F085502B57EB3E5A8A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251218212946.16577-6-jonathan.cavitt@intel.com>
In-Reply-To: <20251218212946.16577-6-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM6PR11MB4579:EE_
x-ms-office365-filtering-correlation-id: 1e65abb4-eb33-4af1-3ca7-08de3e7cd033
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?8K9o29yz5omBZ9MdCC4tPqoyGsw+FYed8r0QyclPKwMbplQZPO0NADvgZGVK?=
 =?us-ascii?Q?JmrIM57yXOkQrzqBWGYeX6khH41x6JhZx8pDp+CkkQ6gam/MQdldSX4yi7j3?=
 =?us-ascii?Q?iL9LLc+FQiqgWV/wPNVgEGa7tNySQEBij1aKjfi2coObaZzKTYNvpDBlRuWf?=
 =?us-ascii?Q?KdwFp/GWfi5l2szd/d5eXFG4rVVmXlcKW/zDu3lr/UBmjjV8xBoaD791rwFW?=
 =?us-ascii?Q?m/46ZTgLJGUNq9o7kt1DMdVqNui/zypTKhUIyGw14DDzKaQvjj6ykSeyPXcq?=
 =?us-ascii?Q?TX1373AM7pqAmQtPZHYC56dCB/gVIoPV88QzCbzqLcno7FokfvCkhtwVh79W?=
 =?us-ascii?Q?a4+LgGZjYeHGgO/JeHlmjaw+SwRWQuuXkQl0I6F8KXNcT7PBg1yG+4EyEh6U?=
 =?us-ascii?Q?8/IcZ7fmGDBXY67IiQzscRuBibYMncCcVYXXEbSPhhaGPAY4OD8u6QlG5ItX?=
 =?us-ascii?Q?8YMsam72NtrxTWhl+8veDADy7Gk7+3bY9fqP+U/1lGHkeVXcRvRfJMwFKb3r?=
 =?us-ascii?Q?F0IkewPR6rihJBqGYGn+PsmBmjOXikEgz0HOWOWQJhSMbiP+jmph7giLE4OB?=
 =?us-ascii?Q?ZgYOzlXi3fDxtjx/2t7vNFl8I6pKwdyl8pyrSkeyLknHca9F/yjkhd0x2UZI?=
 =?us-ascii?Q?ymhAb0tSWZrkVb8+Th7T/8B7981fsj47Jiq+Sea09z04blZuNtvR43CV+0hu?=
 =?us-ascii?Q?TjFv3/TK1b9yNNOM5gVjDLDOyKMGPfYQsPD6bxuez5Bw7AgNvV6KkxIKqCO+?=
 =?us-ascii?Q?Br945Nf46GAzoeUwXzxtyFPmkSAV+DOYR1ZYTN1A6qQeq0Sq3rMHDO/hjTRg?=
 =?us-ascii?Q?MdZjIUu1Zlc16QFgMAIrqobK3KQTSUF+L83nJI6J+m5EFIkZtafwlukjudHx?=
 =?us-ascii?Q?pGccqeoC6xcmehlib9e0vUh3J+NbTy74RBuSlotqP6Xr2FBpR9xxEjEDR4ny?=
 =?us-ascii?Q?3yJ6/Aw5iKkPk2n8CD7JeG834Q4qzrg6Jof9kj957wtxXhiTDKMj0/09SPbj?=
 =?us-ascii?Q?viwZQSV07mF6eKchplFCYzBRhjc1tZ7/kfHyzpIcc4SQDuSjPFWLfNhLe7VZ?=
 =?us-ascii?Q?TcnjD9upkA1hZ5bmYPrQuQfbtanpuv+xK8ftdMkTWtKIAjPZVN+YrenpR/X6?=
 =?us-ascii?Q?FMUr/VWMjAT59VD0FJIaTeuTxb1efunCN0VsbwIIDBBGu6BGuFFwSk2TxvxT?=
 =?us-ascii?Q?0b/qwdqhwv4d2PCAgKNpaWSLAiH1JGskCV3n43xhPN2NwQ32aEj3DkrfE7kx?=
 =?us-ascii?Q?5U4eIUz2Cwc7Lz2DejwY1mAapp1kcHpar05okBH0X9fP9cPqjspvTy7FU3KX?=
 =?us-ascii?Q?HCDeu5pBruCnKIOlyQI6z+qNYJjNSSS3IDq/tb5cgBUQGDSDdIFSb8Bsb1xS?=
 =?us-ascii?Q?mneSc5gagJzcuLPGQ+4qaZjxqLIh/OU6mdCBGGT6ZJ8LaJAMKGZ/TpoZPqk9?=
 =?us-ascii?Q?j9jwvl6CXaIWd6rtuqK6mFpSNbnQqFWs7bPv99UXuGP/UXxeRK6EK+hVqINo?=
 =?us-ascii?Q?Neo0ZssNKr/8XWbf4HkreL5JEaYe+kisXpBJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?77v3/gY4hTKHZqaHp0YJb9yLad4jZCmaEwzxGkH1TYmuPKtOPqEJTlE59+Z0?=
 =?us-ascii?Q?yP9RSuQmDLFCEuBxBtTpVRwZPtZSnatAa33R8lworzuP+pOYuKu3VPscj/hF?=
 =?us-ascii?Q?tRS5g5H+2nd5uL+FJju0vH4fDNBkk+Lqn6GBox3+vNs64sN/8nFYrdfYLICS?=
 =?us-ascii?Q?u4V+FPlcRy4jp42EO1FAtuhYiJ3NlhQElL0iiCCCjQzfyOl4F8sHL9maq1cD?=
 =?us-ascii?Q?KT/36JxC+kRDe25Qg8LbrKck3jW928xNhoHTBBOuIiMnyxYLo65AZBB0vZ81?=
 =?us-ascii?Q?8obMRh4C7XlW1Ki2ztD04peLTmareiq5kbVF5k8TwieJdDo0xItbqot3rrGN?=
 =?us-ascii?Q?U50UZ9CS+KCLBfDOPUphplMo/MsS7I1RdZrm7huGb6WE9QL5N9IyHslk/4SN?=
 =?us-ascii?Q?8I9nmu/ct46xfh7ZNAgeE5dah9KQvQkHmfPlo2vREvjxKs7P7OuoZjcd+Cga?=
 =?us-ascii?Q?JwSc5lLBgT8wuEilNIaTP11ih19mTrCsKaqKS/gPKWo2WQA0RyNLNX9reosC?=
 =?us-ascii?Q?GEmKjxLYSN+rz48XYlefbLDcG27VXmjb5SGfo9MC7BL23RYlKSuytnLxrb7Y?=
 =?us-ascii?Q?eSNGFR+enuJCu+Dy/R9KDc04HsWvsXYpZAYjhkci/COEekygXhSuCUESWD02?=
 =?us-ascii?Q?5ydTUocknBxGAShIhAlKEwzKC1rn2OgorJueEWH2Qc/tHdmeLjVFv3OXqhFl?=
 =?us-ascii?Q?MOyfkZtF9kMM4Nu5y/+uFH8rRQhhBypMwV1RvGpPAfK8WMJ2G4C+exDxs6IA?=
 =?us-ascii?Q?IdD9mD9w3x9ot6pAYijnrltJJFKy0FR7yHO0VV7LBIZDQjfqd7DoUt1Af/i2?=
 =?us-ascii?Q?AgVVKAoq+J1nK1Kz445Vvvw60yuOO30KY7gN2ZSCF7UUUrEvPWQJtSbdMZHu?=
 =?us-ascii?Q?iOjyD/M7x/Kb/S8iddTCHenSAmo4JW1FLwPYjOY5DeqjC4zgu0dm2JO44FdS?=
 =?us-ascii?Q?z+0uuOgiJIBqfIYZ7naFUewT2et0vcsIOR+NbyfZ4NV7+gx+nhjZzuvfQvlz?=
 =?us-ascii?Q?tEqFlN2b+X6DarrgJK6mZtjLa0v2mnpK5XcarbwQc7AodGgpNZuzxQH+QoHP?=
 =?us-ascii?Q?EfGP1Igp3m9wD2/ytBj27VC+gDxBSk1H7OozKZR1SzHLYcvRWvkScr78CphF?=
 =?us-ascii?Q?m/+VR55oFzuoakg4+aQsSCvyuXXNa4qlwKjF86SMpblJJivRRmhPndoMS4fn?=
 =?us-ascii?Q?eIWmj+m6KranL7f7FsMA3NC8kFFh1zavGGGRo0p0IP/l5esT26EY3ACOHrML?=
 =?us-ascii?Q?QyaB9C1PSrfkBhZHXrsunPxy4LNXclBXyypJsdmv8ITaSDGzBLF+/un8eSnc?=
 =?us-ascii?Q?z8rbAYrf2le2BA+hW8JnW2M7UqDIMz9dJWfMYMjsuJB/536D9pA7USTiej1V?=
 =?us-ascii?Q?c8LatInxIOOA/GNvoPaZs7ZB8JKn/4FeGo/EJ6t4YPc8Z7Z27ZHRgcb3jZzg?=
 =?us-ascii?Q?YYH5eX0QGCN99jrSuFx4BaIqiqB1uIC+prEaEuHPk70bVyxvQIOzszQXuIBv?=
 =?us-ascii?Q?I7OF/kGmHUryy2lnVeHWLy53UST/Ck5WGERTpvNUaOT56OPLO9SzMWY6G7lV?=
 =?us-ascii?Q?7GrPxLBwd46khgsV6HcuU8/AHqR/6t+a4TFBmiEnbfWLVrhPKVbCsesPbYrN?=
 =?us-ascii?Q?4JlBo0emxl+I4og26aLFAmrZ/DGwyivYntp5/VyN7yx6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e65abb4-eb33-4af1-3ca7-08de3e7cd033
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 21:31:32.3051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NujdeQYQuKtcizy/8nJXaEEnv5cpVeV4OK+N+/SGr7xC6j5zm4xQJ8DVMnc7pJqf0QVjuu4qHF5hx3ePbr5OKgvDTv5Qwwrd36FelYalg8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4579
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
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Thursday, December 18, 2025 1:30 PM
To: intel-xe@lists.freedesktop.org
Cc: Gupta, Saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Brost, Matthew <matthew.=
brost@intel.com>; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>=
; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Wajdeczko, Michal <Michal.Wajdecz=
ko@intel.com>; Summers, Stuart <stuart.summers@intel.com>; dixit.ashutosh@i=
ntel.com
Subject: [PATCH v2 0/4] drm/xe/guc: Prevent compiler read/write optimizatio=
n breaks
>=20
> Use READ_ONCE and WRITE_ONCE when operating on ct->state and the
> g2h_fence->done values to prevent the compiler from ignoring these
> necessary operations.
>=20
> v2: (Matt Brost)
> - Add Fixes tags
> - Add comments
>=20
> v3:
> - Split into multiple patches (Rodrigo Vivi)
>=20
> v4:
> - s/xe_guc_ct/guc (Michal W)
> - Add comments with READ_ONCE and WRITE_ONCE updates
>   (Rodrigo, Stuart, Dixit)
> - Squash patches with same Fixes target
>   (Rodrigo, Stuart, Dixit)
> - Add partial comment justifying WRITE_ONCE in guc_ct_change_state
>   before READ_ONCE in xe_guc_ct_enabled is added (Rodrigo Vivi)
>   - Update above comment when adding READ_ONCE to xe_guc_ct_enabled
>     (jcavitt)
>=20
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Dixit Ashutosh <dixit.ashutosh@intel.com>

I apologize to Ashutosh Dixit for getting your name backwards.  I foresee t=
his needing
another revision anyways, so I'll fix it for V5.
-Jonathan Cavitt

>=20
> Jonathan Cavitt (4):
>   drm/xe/guc: WRITE_ONCE g2h_fence done in g2h_fence_cancel
>   drm/xe/guc: WRITE_ONCE g2h_fence done in parse_g2h_response
>   drm/xe/guc: READ/WRITE_ONCE ct state in ct_change_state and enabled
>   drm/xe/guc: READ_ONCE ct state in xe_guc_ct_initialized
>=20
>  drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++++++---
>  drivers/gpu/drm/xe/xe_guc_ct.h |  6 ++++--
>  2 files changed, 15 insertions(+), 5 deletions(-)
>=20
> --=20
> 2.43.0
>=20
>=20
