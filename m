Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA51606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 06:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b7w2Iy43;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=O9ov95QL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0205710E197;
	Mon, 16 Nov 2026 06:09:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB06310E197
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 06:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794809351; x=1826345351;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j/XOequ3SjEDT+r3Uec7+lkibjARjX+yR2O5XKfdWFY=;
 b=b7w2Iy43xrfNt1ve1p8LrV6aoEhmEKQPeE2PnBhtHP5ol1iVVykm5Yn6
 FKzyNUaxD8UWGpK5kuZuIpHuUAGIPpnkPpWLkPsLDgzkYL7+Vm42YWbG5
 d3yVfEKNGrGC0s7m4TxyhljdEBFtDMM2hLAXz2r9yBFeu4U2gVGkvNYSw
 6fBNwmwGyiyf7E6e4jhquI8f7+bbLdt8LgdablLP2xuP74oXSMMRDCz0Q
 Y/+1hpdD7W9JIrjFCjXCENleOWGiETfr0srLpmymL92m2S5yqrEQa6sej
 Kvt3MM47H8doA4H/ey85CiYBVHDch89fGgqOVw+WFOByVcl21lJE07AW3 w==;
X-CSE-ConnectionGUID: KEvD4ixXTLKr0s8tyChueg==
X-CSE-MsgGUID: r0ueXAOOQ0ymV16SnsWX0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3428518"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3428518"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 22:09:09 -0800
X-CSE-ConnectionGUID: MTWpk7tTRaGcd3R+y/Dw0A==
X-CSE-MsgGUID: q1ILQ4orQFaU9VqWuqA1kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9783621"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 22:09:09 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 22:09:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 15 Nov 2026 22:09:09 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 22:09:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmOtOPybYGPFP76SdTzzmCXHpLYbpGMR7MFQqMLhENWKFTg4E8tHcziTuaPH5O7vpSIQLwnaLMxr5Zl4Cngto687XfFE4Efmb9sS5HVgim8lzKcrShK3ZxPmj1jwy2ey8wHlCrpbtcTCoPF9lxC4CQAWODasgtDS9gm3kp26z+M9u5gqncA03+qOMzAV9mavvY+7aIwHsN4qXIV2zHm3nkWU26f1hnXBfL129fEPDXLRyQaeuNR3a673ZdI3XJBfS3m/LoPDGp4o09295vWitHMm2BbqcsKIoD0RE3qsGb3WfvvpPh97MPi6V246+RbzU0aAsBypRx/lskEnOmxyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15MctbkPqGVGAyyhwdkOyx2oBam4Ayn3cNUj3CD8iVU=;
 b=n5UZBkMwe47oN5lnCLjbtKD1BetcFxwJvbNvse/knaefel8g68vc2i3/rsXgShhc4bY95gDbJH+ArXilatjcJTLK6DWONw1IMQWgUJTWunZ29sqGhDVzJtgua1fcwCu+23wPqnXGxEUHahvgLjKF9CCfrtnpnZpiycb4GFoFUAqrbrpJvHaDKYK7ndcyVvFiRNGcTtbd5j/vNF75tmMfmwEaAYcqGVTmgJRGDh9ju3XcvehTSfbVXRXoR9K7CpwKnyNrygvSjBIu98jSauB/nECZGIBuLfJvgA9EVJpObf1RjEyWw0mKll8Wo4jDTX0GbiK2XwoS5IuUMPF679mjBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15MctbkPqGVGAyyhwdkOyx2oBam4Ayn3cNUj3CD8iVU=;
 b=O9ov95QLQSpJkHiGt4/y7i1fcw3OBeVW2viBfznAjhN2XyZxvCx8RhU9b01HPFu7MLUTCDqcF/0wVRYnEpyfRmcXWwxKbDoRbAFc51+vUii4z0yJIKdPFSHYiiCE2cwkLZ5YgoKg7zLbHPzZTtgISZdb71nh7OUsNmLz0ewU4HY=
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SJ5PPF4422C5374.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::824) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:08:06 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 06:08:05 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Bai, Zongyao" <zongyao.bai@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/guc: Treat CT-disabled TLB invalidation as
 cancelled
Thread-Topic: [PATCH 1/2] drm/xe/guc: Treat CT-disabled TLB invalidation as
 cancelled
Thread-Index: AQHddVTG17UUAw9CbUKGzFUsMfNrHLcwMzFQ
Date: Mon, 16 Nov 2026 06:08:05 +0000
Message-ID: <DM4PR11MB5456D325DC251C7391827DBAEA7C2@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20261115225731.3073489-1-zongyao.bai@intel.com>
 <20261115225731.3073489-2-zongyao.bai@intel.com>
In-Reply-To: <20261115225731.3073489-2-zongyao.bai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SJ5PPF4422C5374:EE_
x-ms-office365-filtering-correlation-id: 115729fd-893b-47a6-9ff0-08df43a7facf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|10070799003|1800799024|366016|376014|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261102123227099003|38070700021|4143699003|11063799006|5023799004|56012099006|10067099003|22082099003|18002099003|261009223027099003;
x-microsoft-antispam-message-info: OtRACXjSs9nXV9WjpvFJ9pbq3NzHqMEaLcpnGvZzcKT35XdeG2qYWZbcWhB47YdABLBUWt1zJgh87tUltBhVWEWEWnIOKU6FdP5nY+99uYqEZwrxsYIcwKP5j0kV3Cv7ztsxbua5MowCJvSMsSAs0vPdFtfIJYe3/Syi2jPMVCSfNjzkNjHLek2KmN5Qth6Z1f9ABThYhUZuNn8PlHdF4FYDj1v+un773K8cgMs6RJk/OV0BJbIOL9y1kL5mmpEHaCL6gvmZ+dWJ69nuTA+9/RZ0mSUuP6KnhZbDTtpFd0Y1fHRtPolu0dwiJrAciaNHWMbzGO99C0nZ3NaF7N3rIF0+ldzSmHWdrGW5KGgsPiNREksBr/L+dkUvaf9/DZy5DXeaae9O+9Ed5ekuh4d01B1k2TCjXKP0LrQZh+1yULQ768geQTiGhkjCw3TlF+sk6bzy3PsXAgWsEjVS+VvCTSI7d80P+Y/fQxGEq9NMWo1gokLROy1oz0lwJTWOb8ZP9WCP4Mbet9njv1+bxnDaaL4+/U10bi6SHWvzGNTrUl3C3McAoUB6kRSxOXWDsFoYR0SKkF45LMeANKKsI7cYAtLPqJcGikTY8Gl2N+ZvZF9D//qgSgdyFrzJILkZhhk1VIwa+2U6kS4zJiM4OKsI0d+J/b78ch51tSkyz203YK4oz/DQ3zovHB8uCjNgxncCbCpjpE4QLEMY77td1FUzUSGiEjk1lmmiE4pK/oXSmRM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261102123227099003)(38070700021)(4143699003)(11063799006)(5023799004)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xKwKnWy/35F5Xvi3DQD9goAkGjqBdOztsbo+shW41kBv7qBOeO6QogQXXBoB?=
 =?us-ascii?Q?l65yKGA8xIqehIiTZwK99W6nHdHCiQ8opSpqY2jh/EMUV1jBjptRwATQpC6q?=
 =?us-ascii?Q?9yAQz7n6YyohpoIkEJptDtD0NlONiLBc9ErMJ28dFv4ZUKHVchCW3VoFJwNS?=
 =?us-ascii?Q?vBvmVGaecOq7wHJblK9jihitpgBkyRpOTZXAP+LnN7h0agn5kpM685ImeEgM?=
 =?us-ascii?Q?Ag5lz6/DH2s/sLqbx8u3SJzPZ3evHjNw30pXCDx32sMq9QQFWA8gMN6yJNf8?=
 =?us-ascii?Q?xn/okEV/Nnd4TwWd8S4FerqcSVrcMXvr8C+FltuO2WFs3zsvA3S3xR+z4Kmm?=
 =?us-ascii?Q?sysa7jiZCwNMyY9kUlThGGmahzsrfoSi0ZQZvQ93Qv9eIL//OMeY3qmD1E+b?=
 =?us-ascii?Q?ctPnD1PZUkK8dQqxAo/kII1acVVU1gMIfDgsXlwV+76edKm6k2WinCVO2ihS?=
 =?us-ascii?Q?W6B/gAWyCXN8riOQ4Tu7HIXwBlUay2qgqeCzn61934AxPwXWixoj5g4BpYWT?=
 =?us-ascii?Q?rodGXL9eAf6AymAvXS4OT9C/U+mAOr9/1Xo0rjzo60jlb/MaIn3+L1N63qw3?=
 =?us-ascii?Q?QOMeR1BNQyVcqQ7wMhOTRw3NqitIJQA/r3EXwl+1HKIrcFOvyEluF0Fbe/tL?=
 =?us-ascii?Q?6K7AVEzcUtAeRVCTR2T11WUbpNDPRcqCnqYMFD88epw31x5z3Due50fn2Dje?=
 =?us-ascii?Q?uLq5DjMqxOqr516kc8B9FhEZIy5cPxvHRNidl3mZvk0WUErE36ZOoY60Whkx?=
 =?us-ascii?Q?on+LexPJ6twZzlgGx3Y2PvrIxhUUW3/fg1hYKFpskgbIubsFtthDGfUapmuc?=
 =?us-ascii?Q?luMOISP0HkUK+ZJg1Iozf4B6G5Gz82wTfrcvVRm5Jbs6JLkwfNzsT9Oc9QAC?=
 =?us-ascii?Q?nmqthqQnYJdQ6J063LpxrsMgXZChfVqOfSIsY2Pm+Q+BIgkJVU6xLZuhqnBD?=
 =?us-ascii?Q?yKKpN4GWZvX9/1Fla9rqrU8xw/oNbSTx9Os2geHecN7XDRUCtp1IPeDKl5wB?=
 =?us-ascii?Q?U9GNTrl00W+BN2KHvGM7l23+q8NoIwCsQlEbw2FxFbmauBF9kClj7KJCaqnd?=
 =?us-ascii?Q?cuoJ53I5dA5EWHjWx8mVW06uruvGXht8nsqpWlBfkB7cU3RexoY5wXpRF0O6?=
 =?us-ascii?Q?QIOqzLdx+UTIUIY1R6oxzwrtcBgAAM8FUH1Y1AVcYMaKmFejyV+LqSRGvIUt?=
 =?us-ascii?Q?EhPxgKioi5SuALpTZHe9ONqd6cMXSF8i4ikPM4BEDGwUP7qsQybPbLi+0rU6?=
 =?us-ascii?Q?+DFFpPfnrwYTiqlMiM8nH1mBhbCwZHwu8T5hfrzAhvpka0lxPyQlvGlkn1dC?=
 =?us-ascii?Q?qlUMV5kkGkaaJow7frDAPRe6SK5/HiS6zb+TQnGWqbLZi5pruW8V28G1iu94?=
 =?us-ascii?Q?1zDsOtGm6LQlcl9dCu2NFZUWnI/DkwWgWsLN07ueO7eHYXm5unjs9z3Phiq6?=
 =?us-ascii?Q?kk9Dl+jKEQN5ceMkSOhJ5KVUkuBSpdIy+yaSXYCesVlqluciiRrBrG1AeZ/g?=
 =?us-ascii?Q?CTi1Ra4gUBco+Do9TnafP9r5MfkeP/VpMQqicJJTcTm1dibYeB/d0jpUvOym?=
 =?us-ascii?Q?D4zwO2UMmcFDObFqCsngrgfvzzZS+OlLfK0VJeGndgPQnmc6TUfsQ+fcFZvd?=
 =?us-ascii?Q?jzQ3uGtmlK9oUrVBFpLGD3m/9CBzS9JPqzRnoKwFkk7Fp//8FEzrjAYYFexh?=
 =?us-ascii?Q?VpiVhWw2QRMDetJIJUAF6RGCejWxf9ukWt5XqOF3k9UX+tCzQpk3p4FoSNv0?=
 =?us-ascii?Q?/Ei+k36Pg/Yy7+iw38jtFghn3fNwBv9HEtB7gh9gksYalQvFOXaYCiKrw2xc?=
x-ms-exchange-antispam-messagedata-1: eke5nBWkCDo+bw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dcWGMoUNmEezER1gQRqwD6leVQjtmK71l/hLZ7kFx09rsnmjW19cCUOUI6QAWOVWq9W81kc04NmB6JghB/MmOUw2BhzjNaxgqefO64SlmEDVoOEchCK019HzloKXYf5cip4k1RzHleZefqeik+RYKcI5u60atuPo3klycaeeCsOtu900vhmz0L/1P4I10o2hsSwjwbUI81vyKhoXKjRTTqCDxO5OvQ/wK8zMLxgFC/W36a3NRj0VY7fnwXT6M9HcZIq7h6LyrEOlOiNBi+rUY3v6wHRVSUId3QjjRhyQD/ud/CEQ6AprCJkCDqwXkkXWVLcBaUNBTUOxj/LfncfKzw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 115729fd-893b-47a6-9ff0-08df43a7facf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 06:08:05.6088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQE8hSWo78truyraLPQdqiPEhYGxUsdTfc9aQMVJN45PHsLxXMSlrNgbvgE1gAF9Ftgd7Qafo/YrmdG90v2kAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4422C5374
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

On Mon, Nov 16, 2026 6:58 AM Zongyao Bai wrote:
> During a GT reset the GuC CT channel goes through two states before it is
> enabled again:
>=20
>   gt_reset_worker()
>     xe_uc_stop()              ENABLED  -> STOPPED    send: -ECANCELED
>     xe_tlb_inval_reset()
>     do_gt_reset()
>     do_gt_restart()
>       xe_uc_sanitize_reset()  STOPPED  -> DISABLED   send: -ENODEV
>       GuC load, CT enable     DISABLED -> ENABLED
>=20
> xe_tlb_inval_issue() treats -ECANCELED as "undelivered, report done", but=
 -
> ENODEV is propagated to the caller. A userptr invalidation from an MMU
> notifier (e.g. munmap() on a fault-mode VM) issued in the DISABLED window
> thus trips the XE_WARN_ON() in xe_vma_userptr_do_inval() and taints the
> kernel:
>=20
>   Tile0: GT1: GT: reset started
>   WARNING: drivers/gpu/drm/xe/xe_userptr.c:133 at
> xe_vma_userptr_do_inval+0x340/0x4a0 [xe]
>   RAX: 00000000ffffffed
>    xe_vma_userptr_invalidate_start+0x4b7/0x7c0 [xe]
>    __mmu_notifier_invalidate_range_start+0x247/0x370
>    unmap_vmas+0x1af/0x1c0
>    unmap_region+0x91/0xf0
>    ...
>=20
> The TLB invalidation ops contract is that the backend returns -ECANCELED
> when it is mid-reset. The reset invalidates all TLBs, so there is nothing=
 left to
> do. Map -ENODEV to -ECANCELED in
> send_tlb_inval() so that every GuC TLB invalidation type handles it the s=
ame
> way, instead of only send_tlb_inval_ggtt_full() as done so far.
>=20
> The CT is also DISABLED across system suspend and runtime suspend. On
> resume from system suspend the GuC is reloaded with all TLBs invalid, so
> nothing is lost there either; user space and the MM kernel threads are fr=
ozen
> by then, so such a request is not expected anyway. A request issued while
> runtime suspended violates the PM rules and is still reported by the "Mis=
sing
> outer runtime PM protection" warning in xe_tlb_inval_fence_init().
>=20

Fixes tag is needed. Also add Cc stable kernel.

> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index dd38d95c6014..aa7436a1d1db 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -32,12 +32,32 @@
>  static int send_tlb_inval(struct xe_guc *guc, const u32 *action, int len=
)  {
>  	struct xe_gt *gt =3D guc_to_gt(guc);
> +	int ret;
>=20
>  	xe_gt_assert(gt, action[1]);	/* Seqno */
>=20
>  	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
> -	return xe_guc_ct_send(&guc->ct, action, len,
> -			      G2H_LEN_DW_TLB_INVALIDATE, 1);
> +	ret =3D xe_guc_ct_send(&guc->ct, action, len,
> G2H_LEN_DW_TLB_INVALIDATE,
> +1);
> +
> +	/*
> +	 * CT state  Entered                    CT returns  Reported here
> +	 * --------  -------------------------  ----------  -------------
> +	 * STOPPED   xe_uc_stop()               -ECANCELED  -ECANCELED
> +	 * DISABLED  before first GuC load,     -ENODEV     -ECANCELED
> +	 *           xe_guc_sanitize(),
> +	 *           runtime suspend
> +	 *
> +	 * In neither state can the request be delivered. A GT reset passes
> +	 * through both, and the GuC is reloaded with all TLBs invalid before
> +	 * the CT is enabled again, as it is on resume from system suspend, so
> +	 * report it as cancelled rather than failed. Issuing one while runtime
> +	 * suspended violates the PM rules and is already caught by
> +	 * xe_tlb_inval_fence_init().
> +	 */

This comment seems to be too detailed. The mentioned function names may be =
changed later and cause this comment out of date.
How about something like this?

        /*
         * A disabled CT can't deliver the request, and the GuC is reloaded
         * with all TLBs invalid before the CT is enabled again, so there i=
s
         * nothing left to invalidate. Report it as cancelled, like a stopp=
ed CT.
         */

> +	if (ret =3D=3D -ENODEV)
> +		return -ECANCELED;
> +
> +	return ret;

With Fixes tag and comment updated:
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

>  }
>=20
>  #define MAKE_INVAL_OP_FLUSH(type, flush_cache)	((type <<
> XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> --
> 2.43.0

