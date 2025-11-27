Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92330D11183
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 09:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C20D10E7E2;
	Thu, 27 Nov 2025 09:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhaCTkFl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF0C10E7DD
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764236330; x=1795772330;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version:content-transfer-encoding;
 bh=6zmARNtudMvh9guAwIRqhbsL2YHpe3oQfqCbk/cmP+0=;
 b=BhaCTkFlovmV4BTvoXoF1OKRqS0s3sNR+D8omfMDfLzv5j1yAj/NK9I8
 tLGZPrey05IjT8D/ayUIDS0gcZyWXIh8KVm9l2BQPz0jB4IFGF0jEj8ux
 +J1O9J19nkfrmJ38k6rj+uEB7+nzy6WfKLwPDwnLbXmHHzzOipxPemE1g
 4KHX/YD9pFwy8/aj7rSWqxx+A6RwBgKlsvR2OGHoXgwEZrm2dLBsLPUX5
 qiz/7+PeNZCOf6QgIduzpBszxh1FHyy2cTWKxIMkj92MwdB4hWe/5TbS9
 zq2OT62AOpMEM3pcfraPLSDdcG84W5Dwn+woHjQNAUidzfpb1xZGx2pi+ w==;
X-CSE-ConnectionGUID: 5cZdcsBNRZGxmDh7A3p4ew==
X-CSE-MsgGUID: yhtCRz6DSQKVH7ZELoFzQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="91761443"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="91761443"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:38:49 -0800
X-CSE-ConnectionGUID: Z/W7kXdiRvKlZ/fKa4QNMQ==
X-CSE-MsgGUID: bgSoqit5QnKBSDEYNrxvMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="193211201"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:38:49 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:38:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 01:38:48 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:38:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sD80IjK/eLGbqZ8sx/57RbfT3Jy7jI3Ud7zrdn+B5gX6z3MN9UJ7UCvwHTIPjIXYZPej7ltNVkw3H6sUaQvqMLNlzF9iD4CYLvp/8oVB72OH0DEdRrrpK8rT7qJO12WUCDuGlh05E+MGhY2AwF9usTag5kT/bonG+pjGLe0esqJH3ED2rlkKhJHKnR5u6+ygALRr7+9ysv7yqx+kzH6cobKpshCEJflGXnhSNNotz7j71zqnmVu5XFnGvBpXMGwZSdsBf5+I+Go7GnQTK73pdzFrNLZhlyRHECd0uW15VgkTX/VLqFmbBzPT7gwptu4qhcyImBhcu1nSwJy9UqBAmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCAG8acCj9+jsaFCI0Y6yzkv8fk4LcZvW8rIfGy3Sao=;
 b=WTj3PAgpqbCYtAmc/LMVUzbl29ZYOziO3orGzSjFKVnUl4NprHzJsRjF2H9/i9qtlqx7iDyx3QgzP1cir5JVoGq+TPu2uY79MLeRxTtQb1kgrvwLg1/6F7YnoSZELMMfnbIMQk/tfjp9B9Zvu5Qcwq4fDMyVZ4uqGnXdwYvfWN2B2nfEicUzG6RqkjJKzrZ0puzEKhH4PGkWqnRCo/wp+NnhNOCl/ePzLNaqRo3P79kxl7F9u/BbwgTx0kii0Fw1BeTnobq6Jgn56mwb+fjTstFQB9YxVTtzEWFYD1J9/XPPyLh5SFO+Trx5UqlHx6JUogxzbdWzBsTjW/ZWpFGOBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB9474.namprd11.prod.outlook.com (2603:10b6:8:265::13)
 by SA1PR11MB6895.namprd11.prod.outlook.com (2603:10b6:806:2b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 27 Nov
 2025 09:38:45 +0000
Received: from DS7PR11MB9474.namprd11.prod.outlook.com
 ([fe80::2b8f:e81a:868c:c65e]) by DS7PR11MB9474.namprd11.prod.outlook.com
 ([fe80::2b8f:e81a:868c:c65e%4]) with mapi id 15.20.9343.016; Thu, 27 Nov 2025
 09:38:45 +0000
From: "Hoppe, Mateusz" <mateusz.hoppe@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v3 00/18] drm/xe: Multi Queue feature support
Thread-Topic: [PATCH v3 00/18] drm/xe: Multi Queue feature support
Thread-Index: AQEKDq6VxfX6ImeEEz7SnYIGHa9XKraq5XvA
Date: Thu, 27 Nov 2025 09:38:45 +0000
Message-ID: <DS7PR11MB9474363973A43C9F77489333E2DFA@DS7PR11MB9474.namprd11.prod.outlook.com>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB9474:EE_|SA1PR11MB6895:EE_
x-ms-office365-filtering-correlation-id: 464df6e8-b97f-408d-40ad-08de2d98c2ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?A1JYO1uAHBwavtFdGXUGvXTINmo906h5g8FZSxoc4bJoauALDASUQCoSaD80?=
 =?us-ascii?Q?B3mNh9M4YKcgtbhBZmbRkBj/nTmDlX2qHO5sgiFM3YD1ivzOmcLVuTIaLhwt?=
 =?us-ascii?Q?9knJVj974Iz6fdJQVfnQIe76Fg4QGsbzO04PYXnjtbnNGAu4+vTcY2h4hluX?=
 =?us-ascii?Q?N4iYC8j5QU3daej7p4rkch7zoXj25RwMA4ZVeXGYwvgohsEfXrCsly08ea4h?=
 =?us-ascii?Q?p+BlRjEtV0DcLXVILV1W0NJ2ZLN3zOkxtqACb2ghYitXKwmZkfx/44BAgQ8G?=
 =?us-ascii?Q?5dglM8A5NdEncCQgvnZE9m6VsvnVmWF/wGRpISPmo0LiM9FXu5Wz92i5XQg6?=
 =?us-ascii?Q?bQ0hSybLDMdbr1Kk8UC0yYKI0fqZ7AIt/jmSq9VJ/QWnBjlOwUPtvxP53iQf?=
 =?us-ascii?Q?Fb+y7l2pv4J4l0apCoh9+Uk6LloPgROt4X4dZpCq27HQtOYnPnFAkefmz7oO?=
 =?us-ascii?Q?GI9pffAiZc6NKVHDGosL8pXTnxDNoBsXk/6tjbrL5C2mRhQb0RgbjVJNjI3a?=
 =?us-ascii?Q?Ebpfh38ZtYieGUGa3RH9I4mkaF0ryDfxaAK2ImciMjt0XZCzrzdrH5OHwTbW?=
 =?us-ascii?Q?/1Xx0OxB0vNP2gzlv/V8V4Z4ANRJQDklcMlrjZm/23IQFHiRqytrH3IP9Bf6?=
 =?us-ascii?Q?HgNw3aH+0k1NEn9eWesbzS5pfumppz4ilemGWMx+l537mGdR2pL8MDVD1TF3?=
 =?us-ascii?Q?0+EZTvzLpecnbThv+A4kPoxEOcSb6iPp9lJ2nXPijh0fnZ5kd+z3zxwQY8RN?=
 =?us-ascii?Q?msUp535m3MYFT7jRzjxibrWMLD4gNzPF+qqs3NTM4KAtvhw+dZUYB76mWqBj?=
 =?us-ascii?Q?ma8qwqwF5Thg/u905INAeOxzmVMFoEQBXJ6zuLW/jJ41tkfe76qd92vpp5O9?=
 =?us-ascii?Q?+a447lwdWQXWCly8Pfn/K51FWLgB/axeJBEfd28WC4D1L9cJ/6hMbbRvMk/A?=
 =?us-ascii?Q?2wZmAJEsrziwRSvWF+pMQKr3nPhxiGJ2UXfmu4LsDTATL/HzORuEIIZWOIE+?=
 =?us-ascii?Q?mN7nalwZNzpi774y7k/59gd/GSLUOcbmlHSRSFgayhnCKnm0SzLksDxeq7vZ?=
 =?us-ascii?Q?faTaCdJc7XWQnYH29LTJeOQGXRmPpj1qHfe5GqCIq8CLEdsafOFSeF2Z4onJ?=
 =?us-ascii?Q?lSoO1AbVZWkyrpVrdJJfk+20BUNQqO0+Flg91omYYFwSdPH2oUxj/2M24Ub/?=
 =?us-ascii?Q?unKmK0YptU/1/zX4dA8B2fKF2d5wMcUxCY8UmBCYvCVHSjL8+cri6wMTr+BV?=
 =?us-ascii?Q?iXfNSoa3aGoQDMlL0o5xGHw7Uca1cO8BwBzEgU+b0KnunlK5aqBM0Pfv3QsU?=
 =?us-ascii?Q?txWtoe5P9402+Dwn73+3dHjvCRyp6FhA8vVmjlEgb51mgAgrWf1Down3Bd1O?=
 =?us-ascii?Q?/ovYGlmVFHUBe5ArNg3cGq2aMnTGT/LM7207lmO0r7pFEyevZtaobRgYK7Pc?=
 =?us-ascii?Q?esnv8sk7j3fja5vlNFr5w2pEWa7NA0jZcZhdzD7czRvapn2/ODyoRQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB9474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?giHzsVWklZXuq4V1eyvq6TivSA9P1XX7fk+f/RJxfDHpmNafkmbXZ7G46C3J?=
 =?us-ascii?Q?FGLY29o3lrB/yUrwdU/57Dfg3gJCDPkXzYAX1zgho0A8ExhbrXDn3e9Kxfmx?=
 =?us-ascii?Q?8TjKA96O+tKxQHHGBUwfM0lNzKc6SVrzzUlhizemU5BY4IAQ/CGDQkQWS/dd?=
 =?us-ascii?Q?lEYSnkcGwZU9eaHSel5A89r2xO706TF0ggPGHOmkhNWrLvQH+mhACacvTP4D?=
 =?us-ascii?Q?zkznPhjzyqaoCw+0U/wt4Dl+NRosjYRLlQPxFgK8PAdaRz+njkHkNbzVz94V?=
 =?us-ascii?Q?+njDZX34ChWChenLd1jU+blkmeLbPseuYclT/uAaamjCHE16Wkzf8bG8x40O?=
 =?us-ascii?Q?WCfNyo/x4UVfPzSKiNmxU4tBsEyqsYvP2eQa497YH5BRzmZsRmW4fpGa8jHZ?=
 =?us-ascii?Q?Ri6CjEwj84WYXsdo2c75NO04uMdR6xGCU02PcrS18JuGIptxFmMwgn294rsh?=
 =?us-ascii?Q?wMkYFDuTgvpMx3k7by2dzuk9+c2xckXt63Up07AEI5PK9bWcrrZEV38wmPP1?=
 =?us-ascii?Q?6ZLJONr7JQ4fc8tjIf5vEhvlfN+AcucsRyFg60LkXnoODjBiSA8/WZAKwgtW?=
 =?us-ascii?Q?i5ySVGb/Okj8gPqvqRJcN3SvoNoELCLo+fdxfVuJQUkO16DnlaxzaZzxAeAA?=
 =?us-ascii?Q?zaxX+nEHFn6jMD+XF4GvGadxGVWsL5+6HRLeVkPqy6v4Z+c07NuLqANCpAG5?=
 =?us-ascii?Q?aFBG25AljYXCQ0XYYXV8JPSaubFxnm+kW4WQZ5BylcUPrCwHkLSIZJniWx2z?=
 =?us-ascii?Q?TlSjuAMB2ZXJfTb5pdsUe/RUgVE8sjSJRBsdpp2+1tF/n3HfzUiYBVaVkaM3?=
 =?us-ascii?Q?tGr0+2NgGjQngIsRrywd+8yQnW1VWX4hZtvZFvgROUdTlewdId26/xp0d0Ba?=
 =?us-ascii?Q?04X0Sgq29nJWHMuhP6nV7kjtSUvO39U7m+AXVFj0mc1oDmOHNzT8GqK4R1pT?=
 =?us-ascii?Q?wxE/W72diDoZPkFMvYnsc7JkwwvMK+5bTyHaVivZjlLR8OA41vx68wnDkQTE?=
 =?us-ascii?Q?9lORk5XKzyI/+gLRu5/FOyVqJYC/5vJiEqs5gqZaNbCBh4+M6Ca+Xho0AfVV?=
 =?us-ascii?Q?x2T8Td3Sflbvr7cUXhJ8NJoJZlktQs/3x3EhgvoTqik3fhNZVt0DkVWVJKsJ?=
 =?us-ascii?Q?Q/i1pE8WDjT8Kzk4hDF2G0awPHybOtGd2JoLyMPsk9fGvPxltdLT/+TOritK?=
 =?us-ascii?Q?fqCpvZYTcSRtev8X01vSpW85oLOMHT7u49205f8+88IXC8OWbUc+yrQ29PpI?=
 =?us-ascii?Q?50uJPAt1uPW8pp1AH9r1zWNfSwHsByNMsJvTxs5G7ov+jUkL4/eW91o1x1R7?=
 =?us-ascii?Q?HlPisfDOG7j8qytgo0eU8mo3yKdfbzDUCGi+SH+j5xRg3c9EePq1o1CKUO1V?=
 =?us-ascii?Q?upIwhojGOIFR/9m4ktWGahmSw4g8UrWou2FA3pcuCRX6QOq07UVFJ45cJZWU?=
 =?us-ascii?Q?un56uo4nI3vDP8FqcQ0V7mnLXcHI/JUOTeHwrlPpw9ZE7UFJn6xvh52uDUfF?=
 =?us-ascii?Q?86gskAuTBv0QJ38ZAJiXySDN1XrZh0nCcvNq3xkJSiPvnC5EBxM0Zskf0Pzw?=
 =?us-ascii?Q?NJhFOo1Lspcwz9B+sV9bCXBSpUCU8B8PmDL14hDX?=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB9474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 464df6e8-b97f-408d-40ad-08de2d98c2ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 09:38:45.7648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j3uhkPNV8hhy2Iy0o9fzl832Xckw4Sst841D3PXCDfEVFEyE1WEWrSjVH8AY4miIR0IqM7cjuvoaUe1V+MTfkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6895
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable
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

The multi-queue uapi in this series looks good for the compute use case.
Acked-by: Mateusz Hoppe <mateusz.hoppe@intel.com>


-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Niranj=
ana Vishwanathapura
Sent: Friday, November 21, 2025 4:52 AM
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v3 00/18] drm/xe: Multi Queue feature support

Multi Queue is a new mode of execution supported by the compute and blitter=
 copy command streamers (CCS and BCS, respectively). It is an enhancement o=
f the existing hardware architecture and leverages the same submission mode=
l. It enables support for efficient, parallel execution of multiple queues =
within a single context.

Add support for multi-queue feature and enable it on xe3p_xpc.

The associated IGT patch series is,
https://patchwork.freedesktop.org/series/156866/

The Compute UMD usecase is,
https://github.com/intel/compute-runtime/pull/862

Changes in v2:
- Rename multi_queue_enable_mask to multi_queue_engine_class_mask.
- Remove group->lock, fix function semantics, add additional comments,
  add asserts, update uapi kernel-doc, move group->list_lock to right
  patch, add XE_BO_FLAG_GGTT_INVALIDATE for cgp bo.
- Fix G2H_LEN_DW_MULTI_QUEUE_CONTEXT value.
- Add fs_reclaim lock dependency, add bspec ref, other minor cleanups.

Changes in v3:
- Add patch "drm/xe/xe3p: Disable GuC Dynamic ICS for Xe3p"
- Add patch "drm/xe/multi_queue: Reset GT upon CGP_SYNC failure"
- Code refactoring and kernel-doc update
- Assert CGP_SYNC message length is valid
- For CGP bo use PINNED_LATE_RESTORE/USER_VRAM/GGTT_INVALIDATE flags
- Properly handle cleanup of multi-queue group

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.c=
om>

Gustavo Sousa (1):
  drm/xe/xe3p: Disable GuC Dynamic ICS for Xe3p

Niranjana Vishwanathapura (17):
  drm/xe/multi_queue: Add multi_queue_enable_mask to gt information
  drm/xe/multi_queue: Add user interface for multi queue support
  drm/xe/multi_queue: Add GuC interface for multi queue support
  drm/xe/multi_queue: Add multi queue priority property
  drm/xe/multi_queue: Handle invalid exec queue property setting
  drm/xe/multi_queue: Add exec_queue set_property ioctl support
  drm/xe/multi_queue: Add support for multi queue dynamic priority
    change
  drm/xe/multi_queue: Add multi queue information to guc_info dump
  drm/xe/multi_queue: Handle tearing down of a multi queue
  drm/xe/multi_queue: Set QUEUE_DRAIN_MODE for Multi Queue batches
  drm/xe/multi_queue: Handle CGP context error
  drm/xe/multi_queue: Reset GT upon CGP_SYNC failure
  drm/xe/multi_queue: Tracepoint support
  drm/xe/multi_queue: Support active group after primary is destroyed
  drm/xe/doc: Add documentation for Multi Queue Group
  drm/xe/doc: Add documentation for Multi Queue Group GuC interface
  drm/xe/multi_queue: Enable multi_queue on xe3p_xpc

 Documentation/gpu/xe/xe_exec_queue.rst        |  14 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   4 +
 .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c               |   2 +
 drivers/gpu/drm/xe/xe_device.c                |   9 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            | 428 +++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h            |  51 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |  57 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |   5 +
 drivers/gpu/drm/xe/xe_guc.c                   |   7 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |   8 +
 drivers/gpu/drm/xe/xe_guc_fwif.h              |   3 +
 drivers/gpu/drm/xe/xe_guc_submit.c            | 627 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h            |   3 +
 drivers/gpu/drm/xe/xe_guc_submit_types.h      |  13 +
 drivers/gpu/drm/xe/xe_lrc.c                   |  29 +
 drivers/gpu/drm/xe/xe_lrc.h                   |   3 +
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |  68 +-
 drivers/gpu/drm/xe/xe_trace.h                 |  46 ++
 include/uapi/drm/xe_drm.h                     |  44 ++
 22 files changed, 1335 insertions(+), 91 deletions(-)

--
2.43.0


---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu usta=
wy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w trans=
akcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by others is strictly prohibited.

