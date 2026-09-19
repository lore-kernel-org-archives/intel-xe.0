Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A34EC982DE
	for <intel-xe@archiver.kernel.org>; Sat, 19 Sep 2026 03:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CD610E4BC;
	Sat, 19 Sep 2026 03:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OUBeij1d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C95E10E04B
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Sep 2026 03:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789787177; x=1821323177;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TEWAOuQDt3tFIgS5x/0Mvadf3euLlYYbCdn9HhKyUbk=;
 b=OUBeij1dFZKZnzA6k3Xz5QKMnJdtDlLLrfZlTZK8SSYVQm8+h0YpCC0Z
 XI6dHQhsfhm93N3ZccG7Ujla/zOI+ftfleUaXHLy30wPL0N0Jg99QMIKm
 kHWL1V5OmEVd3jBRmdoTRqlGeUfJEUDAAIHhoz624Zc47W2B0YhMiNTFM
 Me3rJa0yLXycwq6g60xLmV70AF2QDvE1e3Io3n6GsOcb7HL7EvaH3G+Gi
 gAkk1W+K2r0OgDdh6T0Nmc7e61VAmeNi2HeWkwhrYWh9JogR4Lub21DRu
 2ZBs9XjQWs/w/LZHRLkj7eTmXlq5KwtzX21JSOVMx2ojRDlqS5zYq4ho7 w==;
X-CSE-ConnectionGUID: 2KQL44GhTwunrUS3bUsp5Q==
X-CSE-MsgGUID: 7ETRgGAWTtKn+ZK7vA8IHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="824005"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="824005"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 20:06:17 -0700
X-CSE-ConnectionGUID: Bi8WhUxzSHq4tTsr/SxBgA==
X-CSE-MsgGUID: TdjKCJOQTfGIYo5ipcubUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="299769395"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 20:06:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 20:06:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 20:06:15 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 20:06:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQEomX94T9/0L3iqgTxbJTapZgF+Zc4EwKqGmuBoDzQFN4yToygi8/XrbuMkXQXYmdKjKn0OkJwywGdOcZjE4IEI59Sci53Awtz+N0H8tIRH/8L/mULEvLZ4Zgl+BwGF/Y4hTCX83Autj42KeNlbR6dou3x9+apvNvvdxqvY4FmgTKaygAHTBhEC2I1dT2bO1C823hT8NR6BwWl59csKZa9hcuqlMGyGki2SfZpxlKXBNbtvV9lBF+/tWfWejOTWILAf77PX7dwWjgFqvLfG0Er1STO06X1Av5K1loOo4VJvMVekmOg+gpbx/iYDuUhAuaBnU6KHvdDT/vCLgSICew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5KS8NkEaMCHIC+3uhWgXXaOuHEeI6MelVvkW9q97Dg=;
 b=o5kvYSzNVtcy1bRG4fx0cssVDjvm6FXaOa7iRLGACFm6NgQBmbNravWCVWnx/IhjtuFZmZddK8oQQmNxHXkJsTHxGhfxdxQmKEtp9KCMX709VMPMPobSmh/tRBx6amfNnSCYmzZpm0n+Q7GSwGZBF2GBW+RFqulWAZQ8qKtL6oOYWI3+Cx1NHvtJxNUTuPRdlRON7+xjITUp85E5G1aN3ZURwVnJF/qhAeXZFdnyeFqHitizFng7JOx0m11rAHK2uzbmXQflbQxRy/oGDCSqtGRi1lsvYFqAdiPBqXXl4MjL4D7aKL1LUHBwzJD3ohjZE8JRCVbSRcmciISp+WYtRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH7PR11MB5768.namprd11.prod.outlook.com (2603:10b6:510:131::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.16; Sat, 19 Sep
 2026 03:06:13 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%3]) with mapi id 15.21.0428.011; Sat, 19 Sep 2026
 03:06:12 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 15/24] drm/xe: Make bind queues operate cross-tile
Thread-Topic: [PATCH v6 15/24] drm/xe: Make bind queues operate cross-tile
Thread-Index: AQHdPLKxW9KWvwVmMkOd+tvpYsYYlbbVRCOg
Date: Sat, 19 Sep 2026 03:06:12 +0000
Message-ID: <DM4PR11MB54566E02AE16942DC9484989EA862@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-16-matthew.brost@intel.com>
In-Reply-To: <20260904211613.3934307-16-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH7PR11MB5768:EE_
x-ms-office365-filtering-correlation-id: 117db997-3f9a-478c-2de5-08df15faf645
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|23010399003|38070700021|56012099006|6133799003|10067099003|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: AwpVJ9sngnVBuTMBdXv3/bBjX342nEBNlXMYrvk6ZNIwmqt4pFtJaKlhH24YjT9+WWiMSEiudJ8Ar8XKTpnoaophhtv7fMMUR8d6pKpf25VYvvVb5QKE45wZ7PQUFceT1UNKQfctkWdv/Y7f2i7AuDLgFqN7wOsiyoTANdVK1F1fgapeXeKwEW9HVQ58pm1gzHr9FRVT7uw2IqoE62Ycz62Qc+YMpa/jGp2OsPO9Q/9valXY4e8S5qKW3P1yVxnTS3/dPmxLpf1L33ZLZmR+6lFvZtqEXyOPq/nIjZ9D+xaitEVXeOcLItj8+Xy4EWJB+hNCNdOq0SYJjM1wUTjMuWIDV2rW8sY/0inTqaKlY00Lr/czcia3vueGQPLKDYg5j2p6BJCumfyQv+UGpmvmfFqlnmHH/4pfbMoU6wMXw4AHz1/+TZhuEVErFjkCKXG5bv9oz4uyhIG/dBfmKFY2WKcqzr9TPCfAbWHRCnink1vVbn7a6LHKqxxvrfSi9W5CeNinaHPYs6iCyTSryGp47nzOmfKgW2bvaF5NSmJZs/pSrAaL8tApGT01SPwJ611Ct5XNioZaUmD+pRSzSCm3quBB/UxUHLfD8Y4q4d5Q3EdIHqYpExE884SRt7m0DwFcHHyGYswCIwbKdyDTEyl2UVRZ6DZVeRqBSEuEthyubUo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(6133799003)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?d8ReoEc+Pjy9MqlXgXxy0o/bZwp/oLwtb6+3+pQlEpN5+NHhT4+PZuKpFRC+?=
 =?us-ascii?Q?Zog52OCl4tGWxlp5qeACVC+g6dfzSxke9FbavGLwwVD9xJ/u6fi85g12b1xJ?=
 =?us-ascii?Q?N7MYQyViduFcDN8pS25ykjksNoqyAOBCLeGVAmSKGzHf+ZyP7C3b8IeSoc+T?=
 =?us-ascii?Q?KTTZG2PYKoabgwsH3Red7yhTAhqauZcAG8WnbjjSV9LqVv1u7fjL8525Cqk2?=
 =?us-ascii?Q?xI7dypzu1rh/U25dZ16zbjwRK9mmFtC8ycyWfH+F1sm21BOzkBOLf5Y5azGc?=
 =?us-ascii?Q?/wWflIkHPY3CvP48i285if8o75uf+TBpByhVFIQ8lajTAFjUaRwRG7YB2nPc?=
 =?us-ascii?Q?alfE7OLPmJFe0hH9irvsNm1s0tiXn1PS9qoPQK5fbCaElL0JIv1r5FN9Pg7b?=
 =?us-ascii?Q?c0Iclmz5RunWVmbSIvohPO18xUVlACGRDvx3qp0USVrlrLr8Ip46MywDHUZd?=
 =?us-ascii?Q?HRGM00UlpLcTq6dr6bPI3/OKwpfAlhbkUiMQYcT9cw2wyIzbzou3rexf+jI/?=
 =?us-ascii?Q?wNTxJFgYUjUiFhvRGArM1K6n1R8SosBWJ6uSr41TELsfs4tNw73WpX4pSjA8?=
 =?us-ascii?Q?1SaKer5n4uF6puZrDzjWbEDM9QyblfxwCD2DT6COdkYFJCVJmBZ2/qUqIWOp?=
 =?us-ascii?Q?XudUlHdFtSPJN6FhE2g0guOJsHnNozqLws02wPB2HzcAbCQA1VtY1ZbXSGm9?=
 =?us-ascii?Q?T3nGzaFjKDvXfd80GrToAJAlCY2x+NLWVDacbfQZPQAXkezLDDioiEtEFewp?=
 =?us-ascii?Q?7DTx9hgvjwrRdlCTxg7ciVrFGD6DcxyRheRsmpicbaisvq4gWAy5owL6MGKY?=
 =?us-ascii?Q?/amJuDPxrnQYcH/T40h0HsNfPO+xXPTgQQQQi74cZn4tmTdP5zQaC2hOcNA2?=
 =?us-ascii?Q?HOtBSJ6qRxPJcO+WqZIGih3EheJT0xOAE5IsK/BAnE9Wi03lPZ/Gck3LYSXF?=
 =?us-ascii?Q?UObY+6ryjkOBokfZ+IGrg+ZgKkE2erQy0p1dw3jGJDyDTbtvzIjlQaLflhb7?=
 =?us-ascii?Q?vkwqUiCp9vBGoDb3qqfSPKih6NfAUhKCHO+F64uhgl5lxjTQcYA1fcxDFMD2?=
 =?us-ascii?Q?H2HAvhbyiGo8N4NtgkL/gnQVTRzldlkRoIyiBIABpEGqLSdfJoLJpHDfSTnR?=
 =?us-ascii?Q?yEjRJCTKQSncQAnX2tLlyu5CCBcNlKVnJkidgEeAtGJpoxHKyAjG0IlaJksi?=
 =?us-ascii?Q?A0urzpUT9gXCQFj86Ff8NR2DjMQgPZgLLVwozwN9kI6Vpo986cg3sVi9WZ/p?=
 =?us-ascii?Q?6AbU3REJ7woEi+AWDm6v2VhHwdPq0z7h46rSX3Lu4DrGGzTvIVJxum/h/V6x?=
 =?us-ascii?Q?qw47sRRLrFRLocJuYI8isTAOHcdcsPqjmgUPVxZgIshGhQ5mmgBFlCroH25r?=
 =?us-ascii?Q?2dkHxm6ZXtwhsh5GCiJgIBVlxUmo7C6yAmKlbZeY/e5dcplN2kt3KiUX4rp9?=
 =?us-ascii?Q?t+G4IYTZjk97W0q1r2TZIuqdsc3lmIA3EcwKo8az8AEDK4qlqrjHnlbkM/Nz?=
 =?us-ascii?Q?IZOK/O8bkfI4M/Sct1JyuheJi3cwC/57Aby9xsRtNqQt/xbThJrARAmV+ZbS?=
 =?us-ascii?Q?7jYEeKBtpJEv7r2XQ9HwQHB6c9I+g7oAJiUOCWZ76MaJ7POEpurAcB4CjD0C?=
 =?us-ascii?Q?QOsP43sEBOCYCOhd8DC7l6CIP5lQNyzt1bQDvZI7QBNFFAmZKpE/6bJJ1t3x?=
 =?us-ascii?Q?7AaC14NUb28HmxH1pf/BLQULNbBwoGyFHJrxlZvKKe9FvnSW8fDMcHrD6mYa?=
 =?us-ascii?Q?6TyIIvHKGpSvfb8yjekIrNKfHPm4s5YRk5jMgtk09T+EDhGYgb1bxSpyeV7n?=
x-ms-exchange-antispam-messagedata-1: xxGYCcWzVqgJ1w==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GEe3RONA8ivqW7aU0/s36rho4DJ4T8u5Bk9+JDvFwj0i0qVU97/4qjwGTpi3hf8O7KslEpg/qLn5OUq2545PV/weLb6QWwWpWHPTbM4gfRUT17OpaCV1va74eUK6mYExJYuWrqdzUbtYLKDFAxCGPB73CEQWPQTLHjXpk/xcB+HLFj9UYo0jneqYitrrSaNAJf6Sl+MLX0bZVaqWUSJn8IDmWwyAElP9s72I9hIkd5c7rPC2rhDPTWIPh3u9mo17qI5PuX67/Cz5hGWHeMaX/HSdo2+Sxmx+a0p4AByqIGppbFvttcGbEJuTF/zAIV5RjVkxwyVq2sODJWuytsOZpA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117db997-3f9a-478c-2de5-08df15faf645
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2026 03:06:12.7441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rtmzd04FP/yKKSZpuFqIZjs96Kxq+NRWti7oVZ67qTQZ7TdLWENv8KI/llYY9tq+8RATrrfyou8SkzNCnl1qtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5768
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

On Fri, Sep 4, 2026 2:16 PM Matthew Brost wrote:
> Since bind jobs execute on the CPU rather than the GPU, maintaining a per=
-tile
> bind queue no longer provides value. Convert the driver to use a single b=
ind
> queue shared across tiles. The primary change is routing all GT TLB
> invalidations through this unified bind queue.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-16-
> matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 142 +++++++++--------------
>  drivers/gpu/drm/xe/xe_exec_queue.h       |  14 +--
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  20 +---
>  drivers/gpu/drm/xe/xe_pt.c               |  22 ++--
>  drivers/gpu/drm/xe/xe_sync.c             |  20 +---
>  drivers/gpu/drm/xe/xe_tlb_inval_job.c    |  15 ++-
>  drivers/gpu/drm/xe/xe_tlb_inval_job.h    |   2 +-
>  drivers/gpu/drm/xe/xe_vm.c               |  65 +++++------
>  drivers/gpu/drm/xe/xe_vm_types.h         |   2 +-
>  9 files changed, 125 insertions(+), 177 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 7bbb31431900..d4c1d0de07b9 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -142,9 +142,8 @@ static void __xe_exec_queue_free(struct
> xe_exec_queue *q)  {
>  	int i;
>=20
> -	for (i =3D 0; i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++i)
> -		if (q->tlb_inval[i].dep_scheduler)
> -			xe_dep_scheduler_fini(q->tlb_inval[i].dep_scheduler);
> +	for_each_tlb_inval(q, i)
> +		xe_dep_scheduler_fini(q->tlb_inval[i].dep_scheduler);
>=20
>  	if (xe_exec_queue_uses_pxp(q))
>  		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q); @@ -
> 166,31 +165,34 @@ static void __xe_exec_queue_free(struct xe_exec_queue
> *q)
>=20
>  static int alloc_dep_schedulers(struct xe_device *xe, struct xe_exec_que=
ue *q)
> {
> -	struct xe_tile *tile =3D gt_to_tile(q->gt);
> -	int i;
> +	struct xe_tile *tile;
> +	int i =3D 0, j;
> +	u8 id;
>=20
> -	for (i =3D 0; i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++i) {
> -		struct xe_dep_scheduler *dep_scheduler;
> -		struct xe_gt *gt;
> -		struct workqueue_struct *wq;
> +	for_each_tile(tile, xe, id) {
> +		for (j =3D 0; j < (XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT + 1);
> ++j, ++i) {
> +			struct xe_dep_scheduler *dep_scheduler;
> +			struct xe_gt *gt;
> +			struct workqueue_struct *wq;
>=20
> -		if (i =3D=3D XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT)
> -			gt =3D tile->primary_gt;
> -		else
> -			gt =3D tile->media_gt;
> +			if (j =3D=3D XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT)
> +				gt =3D tile->primary_gt;
> +			else
> +				gt =3D tile->media_gt;
>=20
> -		if (!gt)
> -			continue;
> +			if (!gt)
> +				continue;
>=20
> -		wq =3D gt->tlb_inval.job_wq;
> +			wq =3D gt->tlb_inval.job_wq;
>=20
>  #define MAX_TLB_INVAL_JOBS	16	/* Picking a reasonable value */
> -		dep_scheduler =3D xe_dep_scheduler_create(xe, wq, q->name,
> -
> 	MAX_TLB_INVAL_JOBS);
> -		if (IS_ERR(dep_scheduler))
> -			return PTR_ERR(dep_scheduler);
> +			dep_scheduler =3D xe_dep_scheduler_create(xe, wq, q-
> >name,
> +
> 	MAX_TLB_INVAL_JOBS);
> +			if (IS_ERR(dep_scheduler))
> +				return PTR_ERR(dep_scheduler);
>=20
> -		q->tlb_inval[i].dep_scheduler =3D dep_scheduler;
> +			q->tlb_inval[i].dep_scheduler =3D dep_scheduler;
> +		}
>  	}
>  #undef MAX_TLB_INVAL_JOBS
>=20
> @@ -224,7 +226,6 @@ static struct xe_exec_queue
> *__xe_exec_queue_alloc(struct xe_device *xe,
>  	q->ops =3D gt->exec_queue_ops;
>  	INIT_LIST_HEAD(&q->lr.link);
>  	INIT_LIST_HEAD(&q->vm_exec_queue_link);
> -	INIT_LIST_HEAD(&q->multi_gt_link);
>  	INIT_LIST_HEAD(&q->hw_engine_group_link);
>  	INIT_LIST_HEAD(&q->pxp.link);
>  	spin_lock_init(&q->multi_queue.lock);
> @@ -636,7 +637,6 @@
> ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);  void
> xe_exec_queue_destroy(struct kref *ref)  {
>  	struct xe_exec_queue *q =3D container_of(ref, struct xe_exec_queue,
> refcount);
> -	struct xe_exec_queue *eq, *next;
>  	int i;
>=20
>  	xe_assert(gt_to_xe(q->gt), atomic_read(&q->job_cnt) =3D=3D 0); @@ -
> 648,15 +648,9 @@ void xe_exec_queue_destroy(struct kref *ref)
>  		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
>=20
>  	xe_exec_queue_last_fence_put_unlocked(q);
> -	for_each_tlb_inval(i)
> +	for_each_tlb_inval(q, i)
>  		xe_exec_queue_tlb_inval_last_fence_put_unlocked(q, i);
>=20
> -	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
> -		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
> -					 multi_gt_link)
> -			xe_exec_queue_put(eq);
> -	}
> -
>  	if (q->user_vm) {
>  		xe_vm_put(q->user_vm);
>  		q->user_vm =3D NULL;
> @@ -1343,7 +1337,6 @@ int xe_exec_queue_create_ioctl(struct drm_device
> *dev, void *data,
>  		u64_to_user_ptr(args->instances);
>  	struct xe_hw_engine *hwe;
>  	struct xe_vm *vm;
> -	struct xe_tile *tile;
>  	struct xe_exec_queue *q =3D NULL;
>  	u32 logical_mask;
>  	u32 flags =3D 0;
> @@ -1392,31 +1385,16 @@ int xe_exec_queue_create_ioctl(struct
> drm_device *dev, void *data,
>  			return -ENOENT;
>  		}
>=20
> -		for_each_tile(tile, xe, id) {
> -			struct xe_exec_queue *new;
> -
> -			flags |=3D EXEC_QUEUE_FLAG_VM;
> -			if (id)
> -				flags |=3D
> EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
> -
> -			new =3D xe_exec_queue_create_bind(xe, tile, vm, flags,
> -							args->extensions);
> -			if (IS_ERR(new)) {
> -				up_read(&vm->lock);
> -				xe_vm_put(vm);
> -				err =3D PTR_ERR(new);
> -				if (q)
> -					goto put_exec_queue;
> -				return err;
> -			}
> -			if (id =3D=3D 0)
> -				q =3D new;
> -			else
> -				list_add_tail(&new->multi_gt_list,
> -					      &q->multi_gt_link);
> -		}
> +		flags |=3D EXEC_QUEUE_FLAG_VM;
> +
> +		q =3D xe_exec_queue_create_bind(xe,
> xe_device_get_root_tile(xe),
> +					      vm, flags, args->extensions);
>  		up_read(&vm->lock);
>  		xe_vm_put(vm);
> +		if (IS_ERR(q)) {
> +			err =3D PTR_ERR(q);
> +			return err;

nit: return PTR_ERR(q);

> +		}
>  	} else {
>  		logical_mask =3D calc_validate_logical_mask(xe, eci,
>  							  args->width,
> @@ -1638,14 +1616,6 @@ void xe_exec_queue_update_run_ticks(struct
> xe_exec_queue *q)
>   */
>  void xe_exec_queue_kill(struct xe_exec_queue *q)  {
> -	struct xe_exec_queue *eq =3D q, *next;
> -
> -	list_for_each_entry_safe(eq, next, &eq->multi_gt_list,
> -				 multi_gt_link) {
> -		q->ops->kill(eq);
> -		xe_vm_remove_compute_exec_queue(q->vm, eq);
> -	}
> -
>  	q->ops->kill(q);
>  	xe_vm_remove_compute_exec_queue(q->vm, q);  } @@ -1806,42
> +1776,40 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *q,
> struct xe_vm *vm,
>   * xe_exec_queue_tlb_inval_last_fence_put() - Drop ref to last TLB inval=
idation
> fence
>   * @q: The exec queue
>   * @vm: The VM the engine does a bind for
> - * @type: Either primary or media GT
> + * @idx: Index of tlb invalidation
>   */
>  void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
>  					    struct xe_vm *vm,
> -					    unsigned int type)
> +					    unsigned int idx)
>  {
>  	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> -	xe_assert(vm->xe, type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT
> ||
> -		  type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> +	xe_assert(vm->xe, idx < XE_EXEC_QUEUE_TLB_INVAL_COUNT);
>=20
> -	xe_exec_queue_tlb_inval_last_fence_put_unlocked(q, type);
> +	xe_exec_queue_tlb_inval_last_fence_put_unlocked(q, idx);
>  }
>=20
>  /**
>   * xe_exec_queue_tlb_inval_last_fence_put_unlocked() - Drop ref to last =
TLB
>   * invalidation fence unlocked
>   * @q: The exec queue
> - * @type: Either primary or media GT
> + * @idx: Index of tlb invalidation
>   *
>   * Only safe to be called from xe_exec_queue_destroy().
>   */
>  void xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct
> xe_exec_queue *q,
> -						     unsigned int type)
> +						     unsigned int idx)
>  {
> -	xe_assert(gt_to_xe(q->gt), type =3D=3D
> XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
> -		  type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> +	xe_assert(q->vm->xe, idx < XE_EXEC_QUEUE_TLB_INVAL_COUNT);

"gt_to_xe(q->gt)" is better than "q->vm->xe", as vm might be NULL.


>=20
> -	dma_fence_put(q->tlb_inval[type].last_fence);
> -	q->tlb_inval[type].last_fence =3D NULL;
> +	dma_fence_put(q->tlb_inval[idx].last_fence);
> +	q->tlb_inval[idx].last_fence =3D NULL;
>  }
>=20
>  /**
>   * xe_exec_queue_tlb_inval_last_fence_get() - Get last fence for TLB
> invalidation
>   * @q: The exec queue
>   * @vm: The VM the engine does a bind for
> - * @type: Either primary or media GT
> + * @idx: Index of tlb invalidation
>   *
>   * Get last fence, takes a ref
>   *
> @@ -1849,22 +1817,21 @@ void
> xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct xe_exec_queue *q,
>   */
>  struct dma_fence *xe_exec_queue_tlb_inval_last_fence_get(struct
> xe_exec_queue *q,
>  							 struct xe_vm *vm,
> -							 unsigned int type)
> +							 unsigned int idx)
>  {
>  	struct dma_fence *fence;
>=20
>  	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> -	xe_assert(vm->xe, type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT
> ||
> -		  type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> +	xe_assert(vm->xe, idx < XE_EXEC_QUEUE_TLB_INVAL_COUNT);
>  	xe_assert(vm->xe, q->flags & (EXEC_QUEUE_FLAG_VM |
>  				      EXEC_QUEUE_FLAG_MIGRATE));
>=20
> -	if (q->tlb_inval[type].last_fence &&
> +	if (q->tlb_inval[idx].last_fence &&
>  	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -		     &q->tlb_inval[type].last_fence->flags))
> -		xe_exec_queue_tlb_inval_last_fence_put(q, vm, type);
> +		     &q->tlb_inval[idx].last_fence->flags))
> +		xe_exec_queue_tlb_inval_last_fence_put(q, vm, idx);
>=20
> -	fence =3D q->tlb_inval[type].last_fence ?: dma_fence_get_stub();
> +	fence =3D q->tlb_inval[idx].last_fence ?: dma_fence_get_stub();
>  	dma_fence_get(fence);
>  	return fence;
>  }
> @@ -1874,26 +1841,25 @@ struct dma_fence
> *xe_exec_queue_tlb_inval_last_fence_get(struct xe_exec_queue *q
>   * @q: The exec queue
>   * @vm: The VM the engine does a bind for
>   * @fence: The fence
> - * @type: Either primary or media GT
> + * @idx: Index of tlb invalidation
>   *
> - * Set the last fence for the tlb invalidation type on the queue. Increa=
ses
> + * Set the last fence for the tlb invalidation client on the queue.
> + Increases
>   * reference count for fence, when closing queue
>   * xe_exec_queue_tlb_inval_last_fence_put should be called.
>   */
>  void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
>  					    struct xe_vm *vm,
>  					    struct dma_fence *fence,
> -					    unsigned int type)
> +					    unsigned int idx)
>  {
>  	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> -	xe_assert(vm->xe, type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT
> ||
> -		  type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> +	xe_assert(vm->xe, idx < XE_EXEC_QUEUE_TLB_INVAL_COUNT);
>  	xe_assert(vm->xe, q->flags & (EXEC_QUEUE_FLAG_VM |
>  				      EXEC_QUEUE_FLAG_MIGRATE));
>  	xe_assert(vm->xe, !dma_fence_is_container(fence));
>=20
> -	xe_exec_queue_tlb_inval_last_fence_put(q, vm, type);
> -	q->tlb_inval[type].last_fence =3D dma_fence_get(fence);
> +	xe_exec_queue_tlb_inval_last_fence_put(q, vm, idx);
> +	q->tlb_inval[idx].last_fence =3D dma_fence_get(fence);
>  }
>=20
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h
> b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 0225426c57b0..b02a390ba989 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -14,9 +14,9 @@ struct drm_file;
>  struct xe_device;
>  struct xe_file;
>=20
> -#define for_each_tlb_inval(__i)	\
> -	for (__i =3D XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT; \
> -	     __i <=3D XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT; ++__i)
> +#define for_each_tlb_inval(__q, __i)	\
> +	for (__i =3D 0; __i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++__i)	\
> +		for_each_if((__q)->tlb_inval[__i].dep_scheduler)
>=20
>  struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct
> xe_vm *vm,
>  					   u32 logical_mask, u16 width,
> @@ -141,19 +141,19 @@ void xe_exec_queue_last_fence_set(struct
> xe_exec_queue *e, struct xe_vm *vm,
>=20
>  void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
>  					    struct xe_vm *vm,
> -					    unsigned int type);
> +					    unsigned int idx);
>=20
>  void xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct
> xe_exec_queue *q,
> -						     unsigned int type);
> +						     unsigned int idx);
>=20
>  struct dma_fence *xe_exec_queue_tlb_inval_last_fence_get(struct
> xe_exec_queue *q,
>  							 struct xe_vm *vm,
> -							 unsigned int type);
> +							 unsigned int idx);
>=20
>  void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
>  					    struct xe_vm *vm,
>  					    struct dma_fence *fence,
> -					    unsigned int type);
> +					    unsigned int idx);
>=20
>  void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 836f88fc0faa..48c05398b016 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -137,16 +137,14 @@ struct xe_exec_queue {
>  #define EXEC_QUEUE_FLAG_KERNEL			BIT(0)
>  /* for VM jobs. Caller needs to hold rpm ref when creating queue with th=
is
> flag */
>  #define EXEC_QUEUE_FLAG_VM			BIT(1)
> -/* child of VM queue for multi-tile VM jobs */
> -#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(2)
>  /* kernel exec_queue only, set priority to highest level */
> -#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(3)
> +#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(2)
>  /* flag to indicate low latency hint to guc */
> -#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(4)
> +#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(3)
>  /* for migration (kernel copy, clear, bind) jobs */
> -#define EXEC_QUEUE_FLAG_MIGRATE			BIT(5)
> +#define EXEC_QUEUE_FLAG_MIGRATE			BIT(4)
>  /* for programming COMMON_SLICE_CHICKEN3 on first submission */
> -#define EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX	BIT(6)
> +#define EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX	BIT(5)
>=20
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside fro=
m
> ban @@ -157,13 +155,6 @@ struct xe_exec_queue {
>  	/** @ban_reason: Bitmask of ban reasons
> (DRM_XE_EXEC_QUEUE_BAN_REASON_*) */
>  	atomic_t ban_reason;
>=20
> -	union {
> -		/** @multi_gt_list: list head for VM bind engines if multi-GT */
> -		struct list_head multi_gt_list;
> -		/** @multi_gt_link: link for VM bind engines if multi-GT */
> -		struct list_head multi_gt_link;
> -	};
> -
>  	union {
>  		/** @execlist: execlist backend specific state for exec queue */
>  		struct xe_execlist_exec_queue *execlist; @@ -230,7 +221,8
> @@ struct xe_exec_queue {
>=20
>  #define XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT	0
>  #define XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT	1
> -#define XE_EXEC_QUEUE_TLB_INVAL_COUNT
> 	(XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT  + 1)
> +#define XE_EXEC_QUEUE_TLB_INVAL_COUNT	\
> +	((XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT + 1) * 2)
>=20
>  	/** @tlb_inval: TLB invalidations exec queue state */
>  	struct {
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c inde=
x
> c17d5f96f00a..bdeffd6f1828 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2710,12 +2710,18 @@ static const struct xe_migrate_pt_update_ops
> svm_userptr_migrate_ops;  #endif
>=20
>  static struct xe_dep_scheduler *to_dep_scheduler(struct xe_exec_queue *q=
,
> -						 struct xe_gt *gt)
> +						 struct xe_tile *tile,
> +						 struct xe_gt *gt,
> +						 unsigned int *type)

@tile looks redundant since it could get from gt_to_tile().
As this function is removed in later patch, so feel free to ignore it.

With upper 2 fixed:
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

>  {
> +	int tile_ofs =3D tile->id * (XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT + 1);
> +
>  	if (xe_gt_is_media_type(gt))
> -		return q-
> >tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT].dep_scheduler;
> +		*type =3D tile_ofs + XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT;
> +	else
> +		*type =3D tile_ofs + XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT;
>=20
> -	return q-
> >tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT].dep_scheduler;
> +	return q->tlb_inval[*type].dep_scheduler;
>  }
>=20
>  /**
> @@ -2740,6 +2746,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct
> xe_vma_ops *vops)
>  	struct xe_tlb_inval_job *ijob =3D NULL, *mjob =3D NULL;
>  	struct xe_range_fence *rfence;
>  	struct xe_vma_op *op;
> +	unsigned int type;
>  	int err =3D 0, i;
>  	struct xe_migrate_pt_update update =3D {
>  		.ops =3D pt_update_ops->needs_svm_lock ?
> @@ -2766,13 +2773,13 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
>=20
>  	if (pt_update_ops->needs_invalidation) {
>  		struct xe_dep_scheduler *dep_scheduler =3D
> -			to_dep_scheduler(q, tile->primary_gt);
> +			to_dep_scheduler(q, tile, tile->primary_gt, &type);
>=20
>  		ijob =3D xe_tlb_inval_job_create(q, &tile->primary_gt->tlb_inval,
>  					       dep_scheduler, vm,
>  					       pt_update_ops->start,
>  					       pt_update_ops->last,
> -
> XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> +					       type);
>  		if (IS_ERR(ijob)) {
>  			err =3D PTR_ERR(ijob);
>  			goto kill_vm_tile1;
> @@ -2791,14 +2798,15 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
>  		}
>=20
>  		if (tile->media_gt) {
> -			dep_scheduler =3D to_dep_scheduler(q, tile->media_gt);
> +			dep_scheduler =3D to_dep_scheduler(q, tile,
> +							 tile->media_gt,
> &type);
>=20
>  			mjob =3D xe_tlb_inval_job_create(q,
>  						       &tile->media_gt-
> >tlb_inval,
>  						       dep_scheduler, vm,
>  						       pt_update_ops->start,
>  						       pt_update_ops->last,
> -
> XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT);
> +						       type);
>  			if (IS_ERR(mjob)) {
>  				err =3D PTR_ERR(mjob);
>  				goto free_ijob;
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 37866768d64c..06b1c913588a 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -345,15 +345,9 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync,
> int num_sync,
>  			return ERR_PTR(-EOPNOTSUPP);
>=20
>  	if (q->flags & EXEC_QUEUE_FLAG_VM) {
> -		struct xe_exec_queue *__q;
> -		struct xe_tile *tile;
> -		u8 id;
> -
> -		for_each_tile(tile, vm->xe, id) {
> +		num_fence++;
> +		for_each_tlb_inval(q, i)
>  			num_fence++;
> -			for_each_tlb_inval(i)
> -				num_fence++;
> -		}
>=20
>  		fences =3D kmalloc_objs(*fences, num_fence);
>  		if (!fences)
> @@ -361,17 +355,9 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync,
> int num_sync,
>=20
>  		fences[current_fence++] =3D
>  			xe_exec_queue_last_fence_get(q, vm);
> -		for_each_tlb_inval(i)
> +		for_each_tlb_inval(q, i)
>  			fences[current_fence++] =3D
>  				xe_exec_queue_tlb_inval_last_fence_get(q,
> vm, i);
> -		list_for_each_entry(__q, &q->multi_gt_list,
> -				    multi_gt_link) {
> -			fences[current_fence++] =3D
> -				xe_exec_queue_last_fence_get(__q, vm);
> -			for_each_tlb_inval(i)
> -				fences[current_fence++] =3D
> -
> 	xe_exec_queue_tlb_inval_last_fence_get(__q, vm, i);
> -		}
>=20
>  		xe_assert(vm->xe, current_fence =3D=3D num_fence);
>  		cf =3D dma_fence_array_create(num_fence, fences, diff --git
> a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> index 04d21015cd5d..81f560068d3c 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> @@ -39,8 +39,8 @@ struct xe_tlb_inval_job {
>  	u64 start;
>  	/** @end: End address to invalidate */
>  	u64 end;
> -	/** @type: GT type */
> -	int type;
> +	/** @idx: Index of tlb invalidation */
> +	int idx;
>  	/** @fence_armed: Fence has been armed */
>  	bool fence_armed;
>  };
> @@ -87,7 +87,7 @@ static const struct xe_dep_job_ops dep_job_ops =3D {
>   * @vm: VM which TLB invalidation is being issued for
>   * @start: Start address to invalidate
>   * @end: End address to invalidate
> - * @type: GT type
> + * @idx: Index of tlb invalidation
>   *
>   * Create a TLB invalidation job and initialize internal fields. The cal=
ler is
>   * responsible for releasing the creation reference.
> @@ -97,7 +97,7 @@ static const struct xe_dep_job_ops dep_job_ops =3D
> {  struct xe_tlb_inval_job *  xe_tlb_inval_job_create(struct xe_exec_queu=
e *q,
> struct xe_tlb_inval *tlb_inval,
>  			struct xe_dep_scheduler *dep_scheduler,
> -			struct xe_vm *vm, u64 start, u64 end, int type)
> +			struct xe_vm *vm, u64 start, u64 end, int idx)
>  {
>  	struct xe_tlb_inval_job *job;
>  	struct drm_sched_entity *entity =3D
> @@ -105,8 +105,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q,
> struct xe_tlb_inval *tlb_inval,
>  	struct xe_tlb_inval_fence *ifence;
>  	int err;
>=20
> -	xe_assert(vm->xe, type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT
> ||
> -		  type =3D=3D XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
> +	xe_assert(vm->xe, idx < XE_EXEC_QUEUE_TLB_INVAL_COUNT);
>=20
>  	job =3D kmalloc_obj(*job);
>  	if (!job)
> @@ -120,7 +119,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q,
> struct xe_tlb_inval *tlb_inval,
>  	job->fence_armed =3D false;
>  	xe_page_reclaim_list_init(&job->prl);
>  	job->dep.ops =3D &dep_job_ops;
> -	job->type =3D type;
> +	job->idx =3D idx;
>  	kref_init(&job->refcount);
>  	xe_exec_queue_get(q);	/* Pairs with put in xe_tlb_inval_job_destroy
> */
>  	xe_vm_get(vm);		/* Pairs with put in
> xe_tlb_inval_job_destroy */
> @@ -280,7 +279,7 @@ struct dma_fence *xe_tlb_inval_job_push(struct
> xe_tlb_inval_job *job,
>  	/* Let the upper layers fish this out */
>  	xe_exec_queue_tlb_inval_last_fence_set(job->q, job->vm,
>  					       &job->dep.drm.s_fence->finished,
> -					       job->type);
> +					       job->idx);
>=20
>  	xe_migrate_job_unlock(m, job->q);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> index 03d6e21cd611..2a4478f529e6 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> @@ -20,7 +20,7 @@ struct xe_vm;
>  struct xe_tlb_inval_job *
>  xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval
> *tlb_inval,
>  			struct xe_dep_scheduler *dep_scheduler,
> -			struct xe_vm *vm, u64 start, u64 end, int type);
> +			struct xe_vm *vm, u64 start, u64 end, int idx);
>=20
>  void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
>  				       struct xe_page_reclaim_list *prl); diff --git
> a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c index
> 13e984ac4e4f..433a0a681556 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1815,7 +1815,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> u32 flags, struct xe_file *xef)
>  			struct xe_exec_queue *q;
>  			u32 create_flags =3D EXEC_QUEUE_FLAG_VM;
>=20
> -			if (!vm->pt_root[id])
> +			if (!vm->pt_root[id] || vm->q)
>  				continue;
>=20
>  			if (!xef) /* Not from userspace */
> @@ -1826,7 +1826,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> u32 flags, struct xe_file *xef)
>  				err =3D PTR_ERR(q);
>  				goto err_close;
>  			}
> -			vm->q[id] =3D q;
> +			vm->q =3D q;
>  		}
>  	}
>=20
> @@ -1933,24 +1933,18 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	if (xe_vm_in_fault_mode(vm))
>  		xe_svm_close(vm);
>=20
> -	down_write(&vm->lock);
> -	for_each_tile(tile, xe, id) {
> -		if (vm->q[id]) {
> -			int i;
> +	if (vm->q) {
> +		int i;
>=20
> -			xe_exec_queue_last_fence_put(vm->q[id], vm);
> -			for_each_tlb_inval(i)
> -				xe_exec_queue_tlb_inval_last_fence_put(vm-
> >q[id], vm, i);
> -		}
> -	}
> -	up_write(&vm->lock);
> +		down_write(&vm->lock);
> +		xe_exec_queue_last_fence_put(vm->q, vm);
> +		for_each_tlb_inval(vm->q, i)
> +			xe_exec_queue_tlb_inval_last_fence_put(vm->q, vm,
> i);
> +		up_write(&vm->lock);
>=20
> -	for_each_tile(tile, xe, id) {
> -		if (vm->q[id]) {
> -			xe_exec_queue_kill(vm->q[id]);
> -			xe_exec_queue_put(vm->q[id]);
> -			vm->q[id] =3D NULL;
> -		}
> +		xe_exec_queue_kill(vm->q);
> +		xe_exec_queue_put(vm->q);
> +		vm->q =3D NULL;
>  	}
>=20
>  	down_write(&vm->lock);
> @@ -2084,7 +2078,7 @@ u64 xe_vm_pdp4_descriptor(struct xe_vm *vm,
> struct xe_tile *tile)  static struct xe_exec_queue *  to_wait_exec_queue(=
struct
> xe_vm *vm, struct xe_exec_queue *q)  {
> -	return q ? q : vm->q[0];
> +	return q ? q : vm->q;
>  }
>=20
>  static struct xe_user_fence *
> @@ -3527,13 +3521,10 @@ static int vm_ops_setup_tile_args(struct xe_vm
> *vm, struct xe_vma_ops *vops)
>  		if (vops->pt_update_ops[id].q)
>  			continue;
>=20
> -		if (q) {
> +		if (q)
>  			vops->pt_update_ops[id].q =3D q;
> -			if (vm->pt_root[id] && !list_empty(&q-
> >multi_gt_list))
> -				q =3D list_next_entry(q, multi_gt_list);
> -		} else {
> -			vops->pt_update_ops[id].q =3D vm->q[id];
> -		}
> +		else
> +			vops->pt_update_ops[id].q =3D vm->q;
>  	}
>=20
>  	return number_tiles;
> @@ -3553,15 +3544,15 @@ static struct dma_fence *ops_execute(struct
> xe_vm *vm,
>  	if (number_tiles =3D=3D 0)
>  		return ERR_PTR(-ENODATA);
>=20
> -	for_each_tile(tile, vm->xe, id) {
> +	for_each_tile(tile, vm->xe, id)
>  		++n_fence;
>=20
> -		if (!(vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT))
> -			for_each_tlb_inval(i)
> -				++n_fence;
> +	if (!(vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT)) {
> +		for_each_tlb_inval(vops->pt_update_ops[0].q, i)
> +			++n_fence;
>  	}
>=20
> -	fences =3D kmalloc_objs(*fences, n_fence);
> +	fences =3D kcalloc(n_fence, sizeof(*fences), GFP_KERNEL);
>  	if (!fences) {
>  		fence =3D ERR_PTR(-ENOMEM);
>  		goto err_trace;
> @@ -3603,9 +3594,15 @@ static struct dma_fence *ops_execute(struct
> xe_vm *vm,
>  			continue;
>=20
>  		xe_migrate_job_lock(tile->migrate, q);
> -		for_each_tlb_inval(i)
> -			fences[current_fence++] =3D
> -				xe_exec_queue_tlb_inval_last_fence_get(q,
> vm, i);
> +		for_each_tlb_inval(q, i) {
> +			if (i >=3D (tile->id + 1) * XE_MAX_GT_PER_TILE ||
> +			    i < tile->id * XE_MAX_GT_PER_TILE)
> +				continue;
> +
> +			fences[current_fence++] =3D fence ?
> +				xe_exec_queue_tlb_inval_last_fence_get(q,
> vm, i) :
> +				dma_fence_get_stub();
> +		}
>  		xe_migrate_job_unlock(tile->migrate, q);
>  	}
>=20
> @@ -4135,7 +4132,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
>=20
>  	syncs_user =3D u64_to_user_ptr(args->syncs);
>  	for (num_syncs =3D 0; num_syncs < args->num_syncs; num_syncs++) {
> -		struct xe_exec_queue *__q =3D q ?: vm->q[0];
> +		struct xe_exec_queue *__q =3D q ?: vm->q;
>=20
>  		err =3D xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
>  					  &syncs_user[num_syncs],
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 648031e64145..c91cb13fc4f1 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -262,7 +262,7 @@ struct xe_vm {
>  	struct xe_device *xe;
>=20
>  	/* exec queue used for (un)binding vma's */
> -	struct xe_exec_queue *q[XE_MAX_TILES_PER_DEVICE];
> +	struct xe_exec_queue *q;
>=20
>  	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
>  	struct ttm_lru_bulk_move lru_bulk_move;
> --
> 2.34.1

