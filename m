Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14803606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 13:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mIrbNlw5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CA910FCA1;
	Wed, 28 Oct 2026 13:47:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6FA10FC6E
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 13:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793195215; x=1824731215;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8nHJ3r8XqPwx8J1wtSs8p9OBX8nZGsaTRuP7+pYet3I=;
 b=mIrbNlw5sowltwNNCID3aSh7x5wSs8ZiB8KEBtjSNofDhG2lCoH+0JzO
 3fdJHpkRd8jCbcSVypwypnZpCfCaTFtS7O8s1ADUdHQK3Evtyp2V4eZH7
 mSjuBkMp/3mCOBaLo0/Zta0HgPW7fXDZeli/MdI8771ZlN0LiwZegsxWO
 uYBaf4qqnXUXyiiyQwjr7Mo8Igw0j2IB7s0AqwnXNfn6DFC3Jj103fb3T
 3rGDGyTKQmvoHhVClCVP+JHRrk7uwRUHLtJiPNgGhLd5oZPRwmMZoazaM
 Zcp3u+sN4MDCXjKOm2CC+P8VFQLHEoE5ycGlz3YkB0fGICTGkWSJqQrw3 A==;
X-CSE-ConnectionGUID: OzcGp8BqSouobH5o3NPw7Q==
X-CSE-MsgGUID: oAnuDd9WQJya/yEdx815dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1801556"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1801556"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:46:54 -0700
X-CSE-ConnectionGUID: DdEm4AVcStSHTMZTZZIhrA==
X-CSE-MsgGUID: PZWxpZ7USdKCHvGMfyEKVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4736074"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:46:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 06:46:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 06:46:54 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 06:46:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrH1Qm2sq21vLeNP6visDvq9EDmvksST9Jyvt0qeOKFZneM1JLfd6hQJERGuP5usc6MV34m57IdDh3RP8FWRfZlHdzoPgHI+kEBd1K5YmzG2EHjHcCDQwATsVQoYSOGNEG083pSN40FsQiGYn3/BfRAak7vgX+AL8KSHOXcuxJPg8v4l8gRRPFzh5rW0A5pWmXuMyS9MEqqgid2/enG5KnswIpqq3v7hjXHZG5/OZ/2j9nd/9QA/53Gk0UYoCrWzLaSG7zL1Fvk7AorcBCuTsd9YbIYlb68w9idfC1CHQsC2zfsWjhCPt1XQEvHRjECEDio7B1+gGatRC64nnrzfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiyYpKppYNkliIJUkk0RQS2RDlm0F8Nv2e1aSS4XYPc=;
 b=dyUdcet2YSEEpKY7QdrdKzcWrVkRHVGfp68cRJqOlUNUkeInFrELoqxfH7m6cFViPlaT7Nh1jgddYJo88f3yABIsXOQjgLV0qA4pU+nLWuBynssPgsd7QD6IHB4d2cLWvq0WW439Z1y0sm/1yvEqKXJXB7sDptltvK5PJ9IsQVKULNSlbtS61Xc5udAvD1d77eUqv/sFb1A51MyEPwyZKDUhXEEr5wlXsdX6hG6x6cSyq8M4Ug10WlWmFRRghpFZIzLbHCphKOj455fsLOrOT+keZdncUmzkU031smROub9YYHKJ9Kt9NKXVCoI1I28/aaSYlxnhR0li4DjWN0AO/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by MN0PR11MB6087.namprd11.prod.outlook.com (2603:10b6:208:3cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 13:46:50 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 13:46:49 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 7/7] drm/xe/guc: capture additional engine state
 registers
Thread-Topic: [PATCH v6 7/7] drm/xe/guc: capture additional engine state
 registers
Thread-Index: AQHdZdHhSFWpX3uw60+nxGylVosmvLcS+amQ
Date: Wed, 28 Oct 2026 13:46:49 +0000
Message-ID: <DS0PR11MB87186DAF0CBC7404FCE6FF4A816F2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261027051024.465587-1-naresh.kumar.g@intel.com>
 <20261027051024.465587-8-naresh.kumar.g@intel.com>
In-Reply-To: <20261027051024.465587-8-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|MN0PR11MB6087:EE_
x-ms-office365-filtering-correlation-id: ac6ea2a7-67d5-4dac-4f80-08df34f9eaab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|261026140227099003|11063799006|4143699003|56012099006|261026121527099003|261022113327099003|261021121427099003|261021123027099003|261009223027099003|261022105027099003|10067099003|261022075727099003|22082099003|18002099003|3023799007|6133799003;
x-microsoft-antispam-message-info: ZwSnJyDy1aAdl1aftWxjQkOIPOTmi6TiUk+iJKXjJVBjwuNgMNeQTEZE46cF3iXo3fHBPGT/sNikgb/ZWCxxlNbSfkOr65nh7RTB6YyT2YrPE166b4BHq0xqA/9xjW9/dMgj/eHgvJAkGxjIRyQLV5X25HMApEybd6CVGafeK+SLEo4mCqtrV5RhRwJB+YKIYxNl3RKGx6Z8aeIkWPVdCSwmdOKOLVP+OhEMBDSDyWRuMyVoxPzn8CwNtMRhXi8z6/0UoFinLkxXT2O0hxT2Vuizf9I8GYfT1qAVqD9n58o8eeeYu1jWjUpPIZnGze6EZmvBJmbbiEmzfIDyUKlykXVxl7AVp6YhpR53qD3Hl1mO34OXpYqJK4tcLgt+g6qMC168/KGCdviURfjZz45ht6wA++tmFpt148/OS0mnKi154bEGXe76mwID9cs4LCSmbr8yt8/D6v90Ey3EG060lrzzMXOwHb2KFCHRU2ssklmaThapNTyIzeaShXjc747/amNwT6sbMtkdk82s7ewE3sBlAWC/gT76a+fKOjZxQQ89AE4d89mAomQ/uEqVaW5goej797idLZ4aiwLHyJGxEIJYhM3aS51HeXEWT0aG7dJwcLyUAJNTiiarp/q3drDyjrfRrh0HsCYmhWZUDyDwpL+20GNkP05emwTvqtK+oNANdhEqgayI51VLLzQuNtIPF7a6hCqdq6WsLUE9+9//7w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(261026140227099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261022113327099003)(261021121427099003)(261021123027099003)(261009223027099003)(261022105027099003)(10067099003)(261022075727099003)(22082099003)(18002099003)(3023799007)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Old7LOuSy2XOY2TkFe7cJntoi26Q1aUvhczkCV8ChVhJeq263T799EBWS2VA?=
 =?us-ascii?Q?dFyh2bKwfnAyY1Qq5kfgysPxqFjwsnExblFredB5iVRmzZ21Uv0gF7IyTMep?=
 =?us-ascii?Q?PA9iIS9OivfvXI+t6gfD+LL7WLjCwctf7BiErJEsWLK4M2+MrwF3RE0Q8shv?=
 =?us-ascii?Q?8AwjEDphXkvmNz006afVvKRGos5wVQe1x5w9O4kja30vPosHmcAIqI9SYYGa?=
 =?us-ascii?Q?s2aV6+06u3UYAhM6kpGFQQ7GheE0aF9T1QMVrFt/NQUypw/zCEK2N1JQezRm?=
 =?us-ascii?Q?1srA/CuPf45otbBuo3TvmQvDRJ9qMEDekLx4kU6J35T5NzFdd9grlck1eS8O?=
 =?us-ascii?Q?4oZr4PZKVHJm3zGpdej8VQvAtJwn0ziw6tuEdMUNfsiPRW9d42DNrVM9Ux2P?=
 =?us-ascii?Q?XuU6lu1SJsmJumnMUA/ajLvQjWTsCjGTHe3/jqttfnKIzGMi9Uujj3sZnmBg?=
 =?us-ascii?Q?3Uj06MIo+itl4S4BfEx4bdMKbWBI3XmvS4nz/oailwupIGuEcKgmDapiK7jX?=
 =?us-ascii?Q?XT6VL4wTfXxWT2nSA3pGCTfi5PPQ0WkRvNRgeYkrxVuMBg0luVtQ/QpvFOgr?=
 =?us-ascii?Q?nF8mwzIydTFqjBaQc71KQ/BUNaM00mUphcptghDB5Cgz+dZrT8I60BrCQzRF?=
 =?us-ascii?Q?ZvKtIdv/BI7bS0v1dl8qNsEZs/zTeyRZ7cisIJ/S3qtn8SXesQf8yPBLiRz3?=
 =?us-ascii?Q?W4oTaX1DDCJXtjC3AhR24DaScXLcpOX3t0baXpSWpLEs24i9PwsJo//294f7?=
 =?us-ascii?Q?2f5qr9SauiRrTDCTmsKqZLPqoZQQNrZ3UYLM7xMDcgQgeAdgN+hnvd2Z6TEj?=
 =?us-ascii?Q?3Dpf53kfdABpzsoZTYIDVRGn0S3BeZQ1Vi1xSlm+H3wlQvXXYNSCSDVb1fEU?=
 =?us-ascii?Q?LRJd6szLB8dSjdPpFkatJjmbY0tYfzLPVWLudAe+Qz5oZq+HLyGFljhblxTN?=
 =?us-ascii?Q?rzs1F8Cg4qGfkAONxAD6LurwJuR4I+wVRrHtRgNKFaS/JVNxo6UPaEwR+d6v?=
 =?us-ascii?Q?7mVjTyiWsqZfqMaLImSXt7K3TANavi9syprDufsT/eueMkBvkt2JC21vkQau?=
 =?us-ascii?Q?FYsY1LleuODoN0O1giFBQzm9EDzJeZohWw+nrBBZ2Fpzr8yT0XqrJUAN60V1?=
 =?us-ascii?Q?o3iuRe5e+2q9L7HPIhYHpZagtS6zFx5z4wZ5iZBfp0qzyeboazSsAWt0ukVQ?=
 =?us-ascii?Q?bdOPj7Hfmv4cBSngy6JG3aZSZZoILEaa7QLRK453pq7epJIidTMa6k/WdgMX?=
 =?us-ascii?Q?JGmKuM1/LOR+9J2BWJ9TR3MOGd3haHctT2eYC3b0dWmBafbj5KP6KMPGH1F/?=
 =?us-ascii?Q?A+fOQ8kTxSeb/Cx/othbTWcUsGeqBlAT7KASZunm5GhJECZbdc9gzQWu05qX?=
 =?us-ascii?Q?7G4kBPGd3STHnezoXqAPeXhwWAqZh5OTYMx5ePGVbjiZqSjxbcrq/p0zeawt?=
 =?us-ascii?Q?8KIWSJHUM9kvZmVTNT+60NoD3FpLtaWrZtW8BIzX0fdr5g3zBzXZo8wqRmKb?=
 =?us-ascii?Q?IEa7luuJq2Mcx0a9Ibwah30tmqv0BgpjHOJAUcZy9wvZuJKgsuk9lQy5fTvb?=
 =?us-ascii?Q?MnLeJ1+8fCA5CNlamlSID2vUa8w+QZvbOFYxMfbY29pxYBHKeAR6A1w5yZ0y?=
 =?us-ascii?Q?hhxYAyRFdzmLuDp5tBJdHjfG0+2yELi3Wes+q2a6uO0/PZ/CnIsLoOaARQNR?=
 =?us-ascii?Q?23Kd/1h8EWAZNSrcqEbAzIyxyBgMDKw19gAxvmLB20VlQNh2DtrvuXFtxscs?=
 =?us-ascii?Q?RrKeqezv4w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: s6twddxaDuWDDHi4zS5cFGIM68R70HmftTAyGQHymzxNJnIbIl0hxe8B31picWRiTVEGLenDIecUlabn85O1SLWADFq8Fi6wyxwKNM9VhODjNYSrWDElCpmCY+kx+5e5FZcPadw7luc98F7s7dbwpnlIk6rDWTcX7lz2Gbxv8rOKx674G28RK4qIIsqB6n5S4Nt7eWuUKTgRAyq1JVWeCnuclfB7wM7VVJ9nhstQXrIuDIMXq6TS/EedajLoxhtcql0h75DbTzNIZ61RjD83gVXHI3HBEpiBbKS4oVmnd1G12dKatkeamacnGEVSl8Zf7O0R3kW4b1UhZPMlXgROYg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6ea2a7-67d5-4dac-4f80-08df34f9eaab
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 13:46:49.8442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MWALU5Mr1930uY4BqgdLQaYYz2ROWrgO5qG6IZQlk5ovEOKVuZy6wmPw+mgFxUKebh9X3UlIrwLTbYxucxdcTU+8k1DQv6P+JTYpG1NBpGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6087
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sashiko comments are valid on this patch. Please address them.

Tejas

> -----Original Message-----
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: 27 October 2026 10:40
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Kumar G, Naresh
> <naresh.kumar.g@intel.com>
> Subject: [PATCH v6 7/7] drm/xe/guc: capture additional engine state regis=
ters
>=20
> Add a wider set of engine state registers to GuC error capture to improve=
 post-
> mortem debugging of engine hangs and reset-related failures.
>=20
> Define the missing register offsets in xe_engine_regs.h and include them =
in the
> GuC capture list. The additional registers cover reset state, front-end a=
nd back-
> end FSM state, power state, batch buffer state, instruction state, preemp=
tion
> status, and related chicken/debug controls.
>=20
> This provides more complete engine context in capture dumps, which should
> help root-cause analysis when investigating GuC-reported engine failures.
>=20
> v3:(Sashiko)
> - Move FF_SLICE_CS_CHICKEN1/2 out of
> COMMON_BASE_ENGINE_INSTANCE
> - Add XE3P_RC_SLICE_INSTANCE and include it only in xe3p_rc_inst_regs[]
> - Add XE_BCS_RCS_ENGINE_INSTANCE for registers shared only by
>   BCS/RCS paths
> - Include XE_BCS_RCS_ENGINE_INSTANCE only in
>   xe_blt_inst_regs[] and xe3p_rc_inst_regs[]
> - Keep COMMON_BASE_ENGINE_INSTANCE limited to registers
>   valid across all engine classes
>=20
> v5:(Sashiko)
> - Keep RING_EXECLIST_* in COMMON_BASE_ENGINE_INSTANCE
> - Drop XE_BCS_RCS_ENGINE_INSTANCE
> - BCS_SWCTRL only on xe3p_blt_inst_regs
> - CS_DEBUG_MODE1/CS_CHICKEN1/CS_PREEMPTION_STATUS only on
> xe3p_rc_inst_regs
>=20
> v6:(Tejas)
> - Add missed register to capture in coredump
>=20
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 24 +++++++++
>  drivers/gpu/drm/xe/xe_guc_capture.c      | 68 ++++++++++++++++++++++--
>  2 files changed, 88 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 94033982e6944..aaec9d02b9869 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -60,6 +60,8 @@
>=20
>  #define RING_START_UDW(base)			XE_REG((base) +
> 0x48)
>=20
> +#define RING_CSFE_GLB_CHICKEN3(base)		XE_REG((base) +
> 0x4c)
> +
>  #define RING_PSMI_CTL(base)			XE_REG((base) + 0x50,
> XE_REG_OPTION_MASKED)
>  #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
>  #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
> @@ -72,6 +74,7 @@
>  #define RING_DMA_FADD_UDW(base)			XE_REG((base) +
> 0x60)
>  #define RING_IPEHR(base)			XE_REG((base) + 0x68)
>  #define RING_INSTDONE(base)			XE_REG((base) +
> 0x6c)
> +#define RING_INSTPS(base)			XE_REG((base) + 0x70)
>  #define RING_ACTHD(base)			XE_REG((base) + 0x74)
>  #define RING_DMA_FADD(base)			XE_REG((base) +
> 0x78)
>  #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> @@ -102,6 +105,8 @@
>  #define   SELECTIVE_READ_GROUP			REG_GENMASK(29,
> 23)
>  #define   SELECTIVE_READ_INSTANCE		REG_GENMASK(22, 16)
>=20
> +#define RESET_CTRL(base)			XE_REG((base) + 0xd0)
> +
>  /*
>   * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
>   * The lsb of each can be considered a separate enabling bit for encrypt=
ion.
> @@ -123,14 +128,22 @@
>  #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0,
> XE_REG_OPTION_MASKED)
>  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>=20
> +#define FF_SLICE_CS_CHICKEN2(base)		XE_REG((base) + 0xe4,
> XE_REG_OPTION_MASKED)
> +
>  #define CS_DEBUG_MODE1(base)			XE_REG((base) + 0xec,
> XE_REG_OPTION_MASKED)
>  #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
>  #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
>=20
>  #define INDIRECT_RING_STATE(base)		XE_REG((base) + 0x108)
>=20
> +#define RING_BB_STATE(base)			XE_REG((base) + 0x110)
> +
>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>  #define RING_BBADDR_UDW(base)			XE_REG((base) +
> 0x168)
> +#define RING_BUFFER_HEAD_PREEMPT_REG(base)	XE_REG((base) +
> 0x14c)
> +#define BB_START_ADDR(base)			XE_REG((base) +
> 0x150)
> +#define RING_BB_ADDR_DIFF(base)			XE_REG((base) +
> 0x154)
> +#define BB_START_ADDR_UDW(base)			XE_REG((base) +
> 0x170)
>=20
>  #define PR_CTR_CTRL(base)			XE_REG((base) + 0x178)
>  #define   CTR_COUNT_SELECT_FF			REG_BIT(31)
> @@ -148,6 +161,8 @@
>  #define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
>  #define   BLIT_CCTL_SRC_MOCS_MASK		REG_GENMASK(6, 1)
>=20
> +#define RING_CSBEFSM3(base)			XE_REG((base) +
> 0x224)
> +
>  #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) +
> 0x234)
>  #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) +
> 0x234 + 4)
>=20
> @@ -169,9 +184,16 @@
>  #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>  #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>=20
> +#define RING_CSFESM(base)			XE_REG((base) + 0x2a0)
> +#define RING_CSFESM2(base)			XE_REG((base) + 0x2a4)
> +#define RING_CSFESM3(base)			XE_REG((base) + 0x2a8)
> +#define RING_CSPWRFSM(base)			XE_REG((base) +
> 0x2ac)
> +
>  #define RING_CSMQDEBUG(base)			XE_REG((base) +
> 0x2b0)
>  #define   CURRENT_ACTIVE_QUEUE_ID_MASK		REG_GENMASK(7, 0)
>=20
> +#define RING_CSBEFSM(base)			XE_REG((base) + 0x2bc)
> +
>  #define RING_QUEUE_TIMESTAMP(base)		XE_REG((base) +
> 0x4c0)
>  #define RING_QUEUE_TIMESTAMP_UDW(base)
> 	XE_REG((base) + 0x4c0 + 4)
>=20
> @@ -217,6 +239,8 @@
>  #define   PREEMPT_GPGPU_LEVEL_MASK
> 	PREEMPT_GPGPU_LEVEL(1, 1)
>  #define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
>=20
> +#define CS_PREEMPTION_STATUS(base)		XE_REG((base) +
> 0x5ac)
> +
>  #define CS_GPR_DATA(base, n)			XE_REG((base) + 0x600 + (n) *
> 4)
>  #define CS_GPR_REG(base, n)			CS_GPR_DATA((base), (n) * 2)
>  #define CS_GPR_REG_UDW(base, n)			CS_GPR_DATA((base),
> (n) * 2 + 1)
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c
> b/drivers/gpu/drm/xe/xe_guc_capture.c
> index a8a3271991e2a..f255799428617 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -124,6 +124,8 @@ struct __guc_capture_parsed_output {
>  	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,
> 	0,	"ACTHD"}, \
>  	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,
> 	0,	NULL}, \
>  	{ RING_BBADDR_UDW(0),		REG_64BIT_HI_DW, 0,	0,
> 	0,	"RING_BBADDR"}, \
> +	{ BB_START_ADDR(0),		REG_64BIT_LOW_DW, 0,	0,
> 	0,	"BB_START_ADDR"}, \
> +	{ BB_START_ADDR_UDW(0),		REG_64BIT_HI_DW, 0,	0,
> 	0,	"BB_START_ADDR_UDW"}, \
>  	{ RING_START(0),		REG_64BIT_LOW_DW, 0,	0,
> 	0,	NULL}, \
>  	{ RING_START_UDW(0),		REG_64BIT_HI_DW, 0,	0,
> 	0,	"RING_START"}, \
>  	{ RING_DMA_FADD(0),		REG_64BIT_LOW_DW, 0,	0,
> 	0,	NULL}, \
> @@ -131,7 +133,9 @@ struct __guc_capture_parsed_output {
>  	{ RING_EXECLIST_STATUS_LO(0),	REG_64BIT_LOW_DW, 0,
> 	0,	0,	NULL}, \
>  	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,
> 	0,	"RING_EXECLIST_STATUS"}, \
>  	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0,
> 	0,	0,	NULL}, \
> -	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,
> 	0,	"RING_EXECLIST_SQ_CONTENTS"}
> +	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,
> 	0,	"RING_EXECLIST_SQ_CONTENTS"}, \
> +	{ RING_BUFFER_HEAD_PREEMPT_REG(0),		REG_32BIT, 0,
> 	0,	0,	"RING_BUFFER_HEAD_PREEMPT_REG"}, \
> +	{ RING_BB_ADDR_DIFF(0),		REG_32BIT, 0,	0,	0,
> 	"RING_BB_ADDR_DIFF"} \
>=20
>  #define COMMON_XELP_RC_CLASS \
>  	{ RCU_MODE,			REG_32BIT,	0,	0,	0,
> 	"RCU_MODE"}
> @@ -150,6 +154,37 @@ struct __guc_capture_parsed_output {  #define
> XE3P_BASE_ENGINE_INSTANCE \
>  	{ RING_CSMQDEBUG(0),		REG_32BIT,	0,	0,
> 	0,	"CSMQDEBUG"}
>=20
> +#define XE3P_RC_SLICE_INSTANCE \
> +	{ FF_SLICE_CS_CHICKEN1(0), REG_32BIT, 0, 0, 0,
> "FF_SLICE_CS_CHICKEN1"}, \
> +	{ FF_SLICE_CS_CHICKEN2(0), REG_32BIT, 0, 0, 0,
> "FF_SLICE_CS_CHICKEN2"}
> +
> +#define XE3P_CS_DEBUG_INSTANCE \
> +	{ RESET_CTRL(0),		REG_32BIT,	0,	0,	0,
> 	"RESET_CTRL"}, \
> +	{ RING_CSBEFSM3(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSBEFSM3"}, \
> +	{ RING_CSFESM(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSFESM"}, \
> +	{ RING_CSFESM2(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSFESM2"}, \
> +	{ RING_CSFESM3(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSFESM3"}, \
> +	{ RING_CSPWRFSM(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSPWRFSM"}, \
> +	{ RING_CSBEFSM(0),		REG_32BIT,	0,	0,	0,
> 	"RING_CSBEFSM"}, \
> +	{ RING_CSFE_GLB_CHICKEN3(0),	REG_32BIT,	0,	0,
> 	0,	"RING_CSFE_GLB_CHICKEN3"}, \
> +	{ RING_PSMI_CTL(0),		REG_32BIT,	0,	0,	0,
> 	"RING_PSMI_CTL"}, \
> +	{ RING_INSTPS(0),		REG_32BIT,	0,	0,	0,
> 	"RING_INSTPS"}, \
> +	{ RING_BB_ADDR_DIFF(0),		REG_32BIT,	0,	0,
> 	0,	"RING_BB_ADDR_DIFF"}, \
> +	{ RING_BB_STATE(0),		REG_32BIT,	0,	0,	0,
> 	"RING_BB_STATE"}
> +
> +/*
> + * CS_CHICKEN1 has GPGPU/3D preempt bits; keep with RCS/CCS only.
> + * RCS+CCS share GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE, so these
> cannot
> + * be RCS-only.
> + */
> +#define XE3P_RC_CS_PREEMPT_INSTANCE \
> +	{ CS_DEBUG_MODE1(0),		REG_32BIT,	0,	0,
> 	0,	"CS_DEBUG_MODE1"}, \
> +	{ CS_CHICKEN1(0),		REG_32BIT,	0,	0,	0,
> 	"CS_CHICKEN1"}, \
> +	{ CS_PREEMPTION_STATUS(0),	REG_32BIT,	0,	0,	0,
> 	"CS_PREEMPTION_STATUS"}
> +
> +#define XE3P_BCS_ONLY_INSTANCE \
> +	{ BCS_SWCTRL(0),		REG_32BIT,	0,	0,	0,
> 	"BCS_SWCTRL"}
> +
>  /* XE_LP Global */
>  static const struct __guc_mmio_reg_descr xe_lp_global_regs[] =3D {
>  	COMMON_XELP_BASE_GLOBAL,
> @@ -186,9 +221,12 @@ static const struct __guc_mmio_reg_descr
> xe_vec_inst_regs[] =3D {
>  	COMMON_BASE_ENGINE_INSTANCE,
>  };
>=20
> +#define XE_BLT_INST_REGS \
> +	COMMON_BASE_ENGINE_INSTANCE
> +
>  /* Blitter Per-Engine-Instance */
>  static const struct __guc_mmio_reg_descr xe_blt_inst_regs[] =3D {
> -	COMMON_BASE_ENGINE_INSTANCE,
> +	XE_BLT_INST_REGS,
>  };
>=20
>  /* XE_LP - GSC Per-Engine-Instance */
> @@ -200,6 +238,16 @@ static const struct __guc_mmio_reg_descr
> xe_lp_gsc_inst_regs[] =3D {  static const struct __guc_mmio_reg_descr
> xe3p_rc_inst_regs[] =3D {
>  	COMMON_BASE_ENGINE_INSTANCE,
>  	XE3P_BASE_ENGINE_INSTANCE,
> +	XE3P_CS_DEBUG_INSTANCE,
> +	XE3P_RC_CS_PREEMPT_INSTANCE,
> +	XE3P_RC_SLICE_INSTANCE,
> +};
> +
> +/* Xe3p Blitter Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe3p_blt_inst_regs[] =3D {
> +	XE_BLT_INST_REGS,
> +	XE3P_CS_DEBUG_INSTANCE,
> +	XE3P_BCS_ONLY_INSTANCE,
>  };
>=20
>  /*
> @@ -264,7 +312,7 @@ static const struct __guc_mmio_reg_descr_group
> xe3p_lists[] =3D {
>  	MAKE_REGLIST(xe_vec_class_regs, PF, ENGINE_CLASS,
> GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>  	MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE,
> GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>  	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS,
> GUC_CAPTURE_LIST_CLASS_BLITTER),
> -	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE,
> GUC_CAPTURE_LIST_CLASS_BLITTER),
> +	MAKE_REGLIST(xe3p_blt_inst_regs, PF, ENGINE_INSTANCE,
> +GUC_CAPTURE_LIST_CLASS_BLITTER),
>  	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS,
> GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>  	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE,
> GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>  	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS,
> GUC_CAPTURE_LIST_CLASS_PAGING), @@ -377,9 +425,12 @@ static const
> struct __ext_steer_reg xehpg_extregs[] =3D {
>  	{"SC_INSTDONE_EXTRA",
> 	XEHPG_SC_INSTDONE_EXTRA},
>  	{"SC_INSTDONE_EXTRA2",
> 	XEHPG_SC_INSTDONE_EXTRA2},
>  	{"INSTDONE_GEOM_SVGUNIT",
> 	XEHPG_INSTDONE_GEOM_SVGUNIT},
> +};
> +
> +static const struct __ext_steer_reg xe2_extregs[] =3D {
>  	{"ROW_INSTDONE_TDL_GFX",	ROW_INSTDONE_TDL_GFX},
>  	{"SS_LSC_HDC_IDLE_TDL_GFX",	SS_LSC_HDC_IDLE_TDL_GFX},
> -	{"SLICE_ARB_STATUS",		SLICE_ARB_STATUS}
> +	{"SLICE_ARB_STATUS",		SLICE_ARB_STATUS},
>  };
>=20
>  static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext, @@ -422,6
> +473,8 @@ static int guc_capture_get_steer_reg_num(struct xe_device *xe)
>=20
>  	if (GRAPHICS_VERx100(xe) >=3D 1255)
>  		num +=3D ARRAY_SIZE(xehpg_extregs);
> +	if (GRAPHICS_VER(xe) >=3D 20)
> +		num +=3D ARRAY_SIZE(xe2_extregs);
>=20
>  	return num;
>  }
> @@ -434,6 +487,7 @@ static void guc_capture_alloc_steered_lists(struct
> xe_guc *guc)
>  	const struct __guc_mmio_reg_descr_group *lists =3D guc->capture-
> >reglists;
>  	const struct __guc_mmio_reg_descr_group *list;
>  	struct __guc_mmio_reg_descr_group *extlists;
> +	bool has_xe2_extregs =3D GRAPHICS_VER(gt_to_xe(gt)) >=3D 20;
>  	struct __guc_mmio_reg_descr *extarray;
>  	bool has_xehpg_extregs =3D GRAPHICS_VERx100(gt_to_xe(gt)) >=3D 1255;
>  	struct drm_device *drm =3D &gt_to_xe(gt)->drm; @@ -504,6 +558,12
> @@ static void guc_capture_alloc_steered_lists(struct xe_guc *guc)
>  				__fill_ext_reg(extarray, &xehpg_extregs[i],
> dss, slice, subslice);
>  				++extarray;
>  			}
> +
> +		if (has_xe2_extregs)
> +			for (i =3D 0; i < ARRAY_SIZE(xe2_extregs); ++i) {
> +				__fill_ext_reg(extarray, &xe2_extregs[i], dss,
> slice, subslice);
> +				++extarray;
> +			}
>  	}
>=20
>  	extlists[0].num_regs =3D total;
> --
> 2.43.0

