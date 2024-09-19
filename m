Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A05CF3958
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 14:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2318610E2B9;
	Thu, 19 Sep 2024 14:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnEgf3Ml";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47BD10E2B9
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 14:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726757089; x=1758293089;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/8GlRL0FXUkrHTTqvMfBsJB0cCZ2PfYF/Hmj1j9k888=;
 b=GnEgf3Mlt6TVOeDeUcfB21PCbw9PoKCGUo6CTob9ABh4QRYMQT8hwjPs
 nbxVcd2pdWyY6sD/b3gUG+12etkp2vgMQnmbBi5MrHOGjEaydY4QsDaPm
 CQTPHRuB6YeEELmH37FpynTGEGxyoynKNORb4njzf+aadvXwjAKsZxhFF
 NtHaUpYSdfO6yHzRD+MpBHm3ORxhOHUfpj1xuzao06nG5UjNipwe57CyO
 VwUyxjOtZQbLpwkJtKhuzlspesE7hs93yWbV3WXNE2kaXW4yofQMI80om
 nhNzqJuh8KMd1Qh+CyKv4bpwMh3ycK4IUpdgrJdr3KCdu4gmLzqoMtLdI g==;
X-CSE-ConnectionGUID: usBxjzvtSju2nsrvQvw/lA==
X-CSE-MsgGUID: VwhG4g7xTiWm9IJ7a6ZeTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25866832"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="25866832"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 07:44:48 -0700
X-CSE-ConnectionGUID: H1hZZXEPSP+Kofh7e5IOpw==
X-CSE-MsgGUID: xMMSw2mzSX+UI/FB9oakJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="69843490"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 07:44:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 07:44:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 07:44:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 07:44:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRH9mKa7w6A/Rhim4vL6VNTxMjxWAJowYbHvi+UiMYnmgLtRZFp7M3QpuSa6qcuoccLTpm0vxr+unsjuTgt+ApL5yf6iCz7dVfC6xmSdQGAsXe+hL8D7b69h4yv+iEXHChm9e7R41la6hOfczEGQIgFIHWMZVLW9k3Ka25VwAuTrY1MtfztcMShWOkprxoYHBaek+HNTH/Xf2hF6tvt1K9h+tZkJjkSrTP2tfo/lfHglQx26g8aJVQOjATfrXE9Ec/BBDMX+eyMg4zyKliq3yBUSpmq3yMQzVd3TtDlDGd6lvVRQvlDecQBHzmEMZLs6GaOT6iRnb/2AJAKOJzHL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8GlRL0FXUkrHTTqvMfBsJB0cCZ2PfYF/Hmj1j9k888=;
 b=UGI/gyJS74+lFJ1y41IfTrx1bZKVjzZpRWZ1vpNt+F5LICrfq25ACLS6kPXrJPFIrPlLJEVxGn52qQuqeKtoRuF9rmKJl8FT9PixcTOIzH9KEJd8Gq9DR8GOFd2/CTZG8XlM0pllBmc9FW27AgE740m5a7RSp9FIqd4mitQP18AGcIOeDS3pgdX1iCqVhAkIUAdyLuEhUgM2E2kW1iIPyNuKq+2g+JRS/lmyUkQ8KAySoXMpvFG2EZkcnzkNGRZpGO5qVFfHuCK+7+iKgdiJLJy0I/GnbDXWFmxbWWHdzSwOSVSPRZcG5keOlgBLAHdkYOsEU39dRAUlFmVdKZQFWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8360.namprd11.prod.outlook.com (2603:10b6:930:c3::9)
 by DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 14:44:34 +0000
Received: from CYYPR11MB8360.namprd11.prod.outlook.com
 ([fe80::4a38:8db0:72da:d89a]) by CYYPR11MB8360.namprd11.prod.outlook.com
 ([fe80::4a38:8db0:72da:d89a%5]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 14:44:34 +0000
From: "Cabral, Matias A" <matias.a.cabral@intel.com>
To: "Chegondi, Harish" <harish.chegondi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ausmus,
 James" <james.ausmus@intel.com>, "Degrood, Felix J"
 <felix.j.degrood@intel.com>, "Souza, Jose" <jose.souza@intel.com>, "Ranjan,
 Joshua Santhosh" <joshua.santosh.ranjan@intel.com>, "Kumar, Shubham"
 <shubham.kumar@intel.com>
Subject: RE: [PATCH v3 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Topic: [PATCH v3 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Index: AQHbAosa//j3kClm8EGm0N1160W4CrJQJkAAgAMXPgCAAbz2gIAKRQwg
Date: Thu, 19 Sep 2024 14:44:34 +0000
Message-ID: <CYYPR11MB83604DFC28AA80ED70852E7EB2632@CYYPR11MB8360.namprd11.prod.outlook.com>
References: <cover.1725866097.git.harish.chegondi@intel.com>
 <5f7adcc0dffec68bf88b282a5d2f92a9f05834ca.1725866097.git.harish.chegondi@intel.com>
 <20240910000914.GD5774@mdroper-desk1.amr.corp.intel.com>
 <87ldzx3hg7.wl-ashutosh.dixit@intel.com> <ZuObKzhNGK3O5P1Q@intel.com>
In-Reply-To: <ZuObKzhNGK3O5P1Q@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8360:EE_|DS0PR11MB7971:EE_
x-ms-office365-filtering-correlation-id: 20a49baf-5c3d-4bab-8ff3-08dcd8b9942a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MGlDQmRoTmxqSHg2M1ozOVRWRFg0Nm9kZlpBMU80Vi9QWk5pSElEUHlNaGd0?=
 =?utf-8?B?cVdXcDRzVkw2MHBtWE03OSt0ZFBJNGg2SDdZdWNXUERmS0d4UGhKaHgzeVE0?=
 =?utf-8?B?MVY2aFNyK0pPQWFKVmNLcnE2TE5zQTdlcHVWdXcxamhLbVM5dFFiT1djMll0?=
 =?utf-8?B?OGpGYyt4cklLaVFzV0xlbjgrdWxJSVNocTBzN0FZZlBZUUtiYkFMS0JEZUtV?=
 =?utf-8?B?RW82MG1jQ3NNRkxLQjVTbVZiNndoZ2RNQW9oVVUxOVlpZ3pPMzlWV2ZFMFU5?=
 =?utf-8?B?aDBrdzdvOFZIdyt5ZmtQeXZ4RFNzK3hlakpEeFh5bFUvdURNakpWc2ZGdVBq?=
 =?utf-8?B?TlFUWU9iSndMWm5rQi84aDl1SWhteU1OeHNlWnlsaVJIeWFiQVVqaE9SeDV1?=
 =?utf-8?B?ajdhbzZGaEdzTlJqWHE1QkdTYUwweUxKUGhoeFEwTnJqenVQaXhNeTdMZnFI?=
 =?utf-8?B?dFFXdGdUclFoR3hFMTJ4QldPSjFYL2QvajNoUEhCV08zLzZ1a3NVWjBjaG9r?=
 =?utf-8?B?a01FK21JUFVuYm9hZW8wTG1jbjdjN0o2dFlWUXBTckNzZy9aczh0eHhwbFow?=
 =?utf-8?B?VXQ4V0FQNFBzcHBsdTBxcExONHdlMFZ3Mjk4ODcyRnJRNmMrc2xudjZPN3di?=
 =?utf-8?B?UjR5QzJ2NmJtay9UUG01ZkVBVExOVjhIWW1DMjRlU3NNZGF0TGZFTHlYUGZB?=
 =?utf-8?B?elgwY24rTEF0NFNVSU1yZzA5MWN4c01tMlRMM0tYcjQxOEFnN2xqdE84b3RU?=
 =?utf-8?B?RTVicWdiQ3k1QVZKcHBzdXpZSGN4TTRVWDhoYWk2T0ZFaGwrM21RTlJ2Uzh1?=
 =?utf-8?B?T0RyMDVPK1dIRWF6bSszbXBHckt2Nks0M3ZZQW1rRURyVldmL0VoOFVnRVpK?=
 =?utf-8?B?Q2piNVoxUVdiaHU3elhoVS9hV0NCdWFmWUV2b3ByNE0yamhmMkhXZjNmQXlN?=
 =?utf-8?B?OVVWRVF6eUZzZnBpYmNIcWZmUWlORnBLK2JKQ1lKZG5aZEY2Q3l4Uks5V00v?=
 =?utf-8?B?Y01meTZzamdNZUNia3BFZTNOK3lCZnV5Zk9EUkt2TlkvNmZDVUNySE9hcFZq?=
 =?utf-8?B?SWdDYSswS20vVFMwZTdrUWgzL3Q4WWcyWWlzOXJJRzMybW8rczZBamJSdFF3?=
 =?utf-8?B?S2ptQlY2VnJLNUlIbWg5eG16clFtaDNVNTgxU28zTVphR3A3alNVM0k4RDYr?=
 =?utf-8?B?TndtZkdBNGpNeGc5Q3kvZVlvVDhhL0F5N015L2JBS01vZEtKaWIyNjV4VXJE?=
 =?utf-8?B?S2J6QlNDSDFqa3JzWnp1eFAwQVlUNGN0UHh2Zlo2T3VrOG15NnhGVFhDM2NJ?=
 =?utf-8?B?NXhFL2VDamVMTzlBdGtCWEk1MmViYjB3eHpLajVtMlVXUWRGVHlPUjZ3bG0x?=
 =?utf-8?B?YXNkdnh3Q2t2ZUhYNXFRY0pDNEFSOWg2Y3ArUzNCdVVxUkRHV0d0SmF3aHBq?=
 =?utf-8?B?c3JwcTFSTjVZU0t5OHM5aDFaaGJvbGkyUGZUb0p0c2h5YnRDci92N01HQ2cr?=
 =?utf-8?B?Vjhnc1FJMUpuZHdBMlovTy9sUjkvZUJpcStvbTRRTEFPeXRjT2pscld0aGkr?=
 =?utf-8?B?TkhmQlgxSFVBcjRTYXovU1NjSkNBSXhzNXJRS0hZcmlPWDBhbmZIaDVKTVI1?=
 =?utf-8?B?bk5EaWd6YVJEKzNFdStkd3F4cFNPeUFQR21DNTlraUQ4M2MyaVpxS0Q5MzB3?=
 =?utf-8?B?N2lOQittZDlaREpVMUhqbzBzUmFXa2dnTVdzQnN5RGtKQzdUdVBjKzYzK0o2?=
 =?utf-8?B?UHJubFRHUWlZVTBkLzNiNlJKU1BEQUNabXZuc29QOU9odUlNMWxWdHhwWGJP?=
 =?utf-8?B?RUxYTkNvQUdGTUp5VEdTVjdBeUtNeWtEV3MxaVl6eHFrSnZDQlVtd05zZVBJ?=
 =?utf-8?B?K3BrMDZlVjc1Ynp2bEdmcGNtM3psbVR2bXA3b2pXZWNrUlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2d3ZkZwMmRrQ1lJK0pjSnBVeFRGcU5kRldjY01NeTNXY3o3OStJbG5FK3BQ?=
 =?utf-8?B?eG9xVzB6M2xkeTFyL0luSnJ1VVdtVkF0SUQzVEhVMWFLV25SNi9UU1NtbnlL?=
 =?utf-8?B?OUhXVldKelRxTEtnZUM2OENhdjJmbnBEbTF0dU1PeUhUMFVGN2l0QVpRSnlH?=
 =?utf-8?B?Yzl0WlMyVXArbGFaWWdmMUswbWdIRHBPK0g1ekJYRFlnVWh1TThFcUo2UWo0?=
 =?utf-8?B?TjdoN010VzdlbUMvMzdER1VkQjQzSGpsZFlzaGpXcnJKZHhMVDBlK2JSZmJ5?=
 =?utf-8?B?WXRZV0NBc0pDSTZMWjBXTjRYbjNycm9oLys3TUVNMmpKYzNWR0xxVytTUTFx?=
 =?utf-8?B?NEVxNlROd1NKSmdMcFhvWDk0Y2tOVU5Ucm9nakdRUXgwYmF0N0FEK0EwUjZG?=
 =?utf-8?B?Qm5zWXlwczBINDhvS2kxSkNoUThUUHdmVnVhT1hPUmV1WmQ0ZmVScEhIRWJ3?=
 =?utf-8?B?VFBhZUNqQmJkOVcrNTg5d3pnbHR5dWl0L2pVVzZkT0JZR2pZbGpkaWs3U2Fv?=
 =?utf-8?B?c3p0MCtQYTJDZ25GQVBVaFhCUlFoMFE4Y3dBQyszbkcyMlF3SG51YVFhclgy?=
 =?utf-8?B?MGJpTGF0WFFyVVBBMFZNdzJpRlB1S3NQTG56WnZYWnIvQ2xCZkt3clA2ZGNS?=
 =?utf-8?B?UkJ5VG12RENGVEFyRmNTMVUwcWQ4YlFaRGFlVEprcHFCN1hVTTRsNmcyR1pN?=
 =?utf-8?B?OFdNNkU5VUtNc2cyU3NqVEVlSzJ3ellGckhNZjNGOEFyWVpydmZGbTdiOVo4?=
 =?utf-8?B?OGV5VC85dkZ2c0JVOENFNzNTWDRiVkdUTGV1QVYyOGlWRGpSOVhSazhYTWd6?=
 =?utf-8?B?bWJHYmdkdzdzY0F3OXFXQ1ZUK04veWtZS1EzaDZRWDhvaDFrS2gyZ0hwVXpC?=
 =?utf-8?B?V0IrQS9DQjJDcGNkbU9XOGtIc1JOZHU1RmV1WDN6R054eHo0dzl2aWpLbmN6?=
 =?utf-8?B?LzNYcWFGbG0zdDJ2dXQ4VDJnNHBxaFQ1Z3AzZmRHT2kyREovaVhvUGY4L09t?=
 =?utf-8?B?VG1nREswUjVXUHR6WFUxaFRieUFhMXFGeDl4M21EczNmaUtLQzMwR1NTd3pM?=
 =?utf-8?B?V1NwRGNmV25wZXNGaDdxSlJGU2l5cTlHTVJwbkROb0dqbWdubWZkWTd0MG1N?=
 =?utf-8?B?cVl3dVZjUk1XR0RKRC9OekEycGE5aDNFZVNwdGpTSmVBM3Nqa1JveUFHQlNY?=
 =?utf-8?B?bGxPNVplamIxWS8za3VSUk1hbm1HL0o2MStiNXJYQmR3ZnFHOXpLV2ZmV2o1?=
 =?utf-8?B?ZVBmQ21Wd1RhNmQyNjdJUCtnbVVLWmhCVlR5djBrK2ladW9DMmdXcUdSemlZ?=
 =?utf-8?B?NEc4WjJQQWx1Y09yejl1WWRMME1rT28rWU5uSU9ZSUhzTStSYnVvNGUxNmRD?=
 =?utf-8?B?d3FWMlZzMVdzRVlNdTBQYnM2TklvRjBocEhhVFJBZkh2UG1GanBsS1NyemY1?=
 =?utf-8?B?b1VPRTIyUFVZOXZWdklZVlpReEt6TlJQZ1VnZlNrcnY3YktTSW5jdHYyOTQ0?=
 =?utf-8?B?bTNBTWF1eHlCdkpqeDBTMytjTlBNc2w0SjdabmdBQm1ST3lQaUQvb3MyaTlI?=
 =?utf-8?B?MWpUYm94aDJHVklVSTN1TXdDbHFVRklsUnpPNEw4am0rcEZDL3dCZUkzTVFI?=
 =?utf-8?B?aVVPR2xsc3VXZ1ZqWDNjQ3JNRkdpaTgrWEhha3lLZHFVN21GSzArZDBtNlFG?=
 =?utf-8?B?eW8ySUNKbHNZWjBjZ1VpWlhzTHVnK2EyZ3RscHdHeXY0VEpmWUk1Mm4zWlcx?=
 =?utf-8?B?SWNDcDBQUzV2OTVUS05yeEp6aVVsaHp1dEdEWUtrZ3RLOFh4SEpaa1VtL0tV?=
 =?utf-8?B?WGdQb3c4VGZYVCs5ckI1SDliRVBpdXBubXh1OHljbWlTWk1BaDM0TUs0c1lq?=
 =?utf-8?B?d0pkakpLWURyZXI4NTJ1WS9kK1cwbmNDVmIwZmVvK05ZOUNNVXQ2UXFqOEF4?=
 =?utf-8?B?NXdzYmRRRWV2aDZpQit6VHBxMWxqdkdlQmJCakRLNHRZdGZ6eGsxZ0dzZW5a?=
 =?utf-8?B?U3dYZElwd2lWNmVTdTBwSnJaeHRwdnQxK0ZhcnZFV2NrYjlWcXpTbmxoekpm?=
 =?utf-8?B?aGRjUmUzVGNsYllISkFWVHFyTTJCTnZJLy9uc0l6dWkzSjUwRkRDazJ1NVNO?=
 =?utf-8?Q?MOVrRASv2cJiR7e87KB3XtyMx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a49baf-5c3d-4bab-8ff3-08dcd8b9942a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 14:44:34.5504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zeI9bOkG+CbCA8+YbiWDz6YPOuWcKJPkOG0k5DfCkA0dO5eCDLT7nfCsWbQseUPDqSAhrp0+BHyz7yRwfyahOCnPm8Xm9fN/2M/gCIUeQ5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7971
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

SGkgSGFyaXNoLCANCg0KQW55IHVwZGF0ZXMgb24gdGhlIGRlZmluaXRpb24gb2YgdGhlIHVBUEk/
IA0KQnR3LCBhbnkgaWd0IGNvbnRlbnQgYXZhaWxhYmxlID8gDQoNClRoYW5rcywgDQpfTUFDDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBDaGVnb25kaSwgSGFyaXNoIDxoYXJp
c2guY2hlZ29uZGlAaW50ZWwuY29tPiANClNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTIsIDIw
MjQgNjo1NCBQTQ0KVG86IERpeGl0LCBBc2h1dG9zaCA8YXNodXRvc2guZGl4aXRAaW50ZWwuY29t
Pg0KQ2M6IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+OyBpbnRl
bC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEF1c211cywgSmFtZXMgPGphbWVzLmF1c211c0Bp
bnRlbC5jb20+OyBEZWdyb29kLCBGZWxpeCBKIDxmZWxpeC5qLmRlZ3Jvb2RAaW50ZWwuY29tPjsg
U291emEsIEpvc2UgPGpvc2Uuc291emFAaW50ZWwuY29tPjsgQ2FicmFsLCBNYXRpYXMgQSA8bWF0
aWFzLmEuY2FicmFsQGludGVsLmNvbT47IFJhbmphbiwgSm9zaHVhIFNhbnRob3NoIDxqb3NodWEu
c2FudG9zaC5yYW5qYW5AaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzFdIGRy
bS94ZS9ldXN0YWxsOiBBZGQgc3VwcG9ydCBmb3IgRVUgc3RhbGwgc2FtcGxpbmcNCg0KT24gV2Vk
LCBTZXAgMTEsIDIwMjQgYXQgMDQ6MjE6MTJQTSAtMDcwMCwgRGl4aXQsIEFzaHV0b3NoIHdyb3Rl
Og0KPiBPbiBNb24sIDA5IFNlcCAyMDI0IDE3OjA5OjE0IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3Rl
Og0KPiA+DQo+IA0KPiBIaSBNYXR0LA0KPiANCj4gU29tZSBjb21tZW50cyBhYm91dCB0aGUgdWFw
aSBiZWxvdy4NCj4gDQo+ID4gPiBAQCAtMTY5NCw2ICsxNjk2LDEzOCBAQCBzdHJ1Y3QgZHJtX3hl
X29hX3N0cmVhbV9pbmZvIHsNCj4gPiA+CV9fdTY0IHJlc2VydmVkWzNdOw0KPiA+ID4gIH07DQo+
ID4gPg0KPiA+ID4gKy8qKg0KPiA+ID4gKyAqIGVudW0gZHJtX3hlX2V1X3N0YWxsX3Byb3BlcnR5
X2lkIC0gRVUgc3RhbGwgZGF0YSBzdHJlYW0gcHJvcGVydHkgaWRzLg0KPiA+ID4gKyAqDQo+ID4g
PiArICogVGhlc2UgcHJvcGVydGllcyBhcmUgcGFzc2VkIHRvIHRoZSBkcml2ZXIgYXMgYSBjaGFp
biBvZg0KPiA+ID4gKyAqIEBkcm1feGVfZXh0X3NldF9wcm9wZXJ0eSBzdHJ1Y3R1cmVzIHdpdGgg
QHByb3BlcnR5IHNldCB0byANCj4gPiA+ICt0aGVzZQ0KPiA+ID4gKyAqIHByb3BlcnRpZXMnIGVu
dW1zIGFuZCBAdmFsdWUgc2V0IHRvIHRoZSBjb3JyZXNwb25kaW5nIHZhbHVlcyANCj4gPiA+ICtv
ZiB0aGVzZQ0KPiA+ID4gKyAqIHByb3BlcnRpZXMuIEBkcm1feGVfdXNlcl9leHRlbnNpb24gYmFz
ZS5uYW1lIHNob3VsZCBiZSBzZXQgdG8NCj4gPiA+ICsgKiBARFJNX1hFX0VVX1NUQUxMX0VYVEVO
U0lPTl9TRVRfUFJPUEVSVFkuDQo+ID4gPiArICovDQo+ID4gPiArZW51bSBkcm1feGVfZXVfc3Rh
bGxfcHJvcGVydHlfaWQgew0KPiA+ID4gKyNkZWZpbmUgRFJNX1hFX0VVX1NUQUxMX0VYVEVOU0lP
Tl9TRVRfUFJPUEVSVFkJCTANCj4gPiA+ICsJLyoqDQo+ID4gPiArCSAqIEBEUk1fWEVfRVVfU1RB
TExfUFJPUF9CVUZfU1o6IFBlciBEU1MgTWVtb3J5IEJ1ZmZlciBTaXplLg0KPiA+ID4gKwkgKiBW
YWxpZCB2YWx1ZXMgYXJlIDEyOCBLQiwgMjU2IEtCLCBhbmQgNTEyIEtCLg0KPiA+ID4gKwkgKi8N
Cj4gPiA+ICsJRFJNX1hFX0VVX1NUQUxMX1BST1BfQlVGX1NaID0gMSwNCj4gPg0KPiA+IERvZXMg
dXNlcnNwYWNlIHJlYWxseSBjYXJlIGFib3V0IHRoaXMgYmVpbmcgY29uZmlndXJhYmxlPyAgRXZl
biBpZiANCj4gPiB3ZSBoYXZlIGEgcGxhdGZvcm0gd2l0aCBYRV9NQVhfRFNTX0ZVU0VfQklUUyB0
b3RhbCBYZUNvcmVzLCB0aGUgDQo+ID4gZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBsYXJnZXN0IGFu
ZCBzbWFsbGVzdCBzaXplcyBoZXJlIG9ubHkgc2F2ZXMgNDhNQiBvZiBtZW1vcnkuDQo+ID4gVGhl
IGhhcmR3YXJlIG1ha2VzIHRoaXMgY29uZmlndXJhYmxlLCBidXQgaXMgdGhlcmUgYWN0dWFsbHkg
YW4gYXNrIA0KPiA+IHRvIGV4cG9zZSB0aGlzIHRocm91Z2ggdGhlIHVhcGk/ICBJZiBub3QsIEkn
ZCBzYXkgd2Ugc2hvdWxkIGp1c3QgDQo+ID4gYWx3YXlzIHBpY2sgNTEyS0IgaW50ZXJuYWxseSBh
bmQga2VlcCB0aGluZ3Mgc2ltcGxlLg0KPiANCj4gQWdyZWVkLg0KPiANCj4gPg0KPiA+ID4gKw0K
PiA+ID4gKwkvKioNCj4gPiA+ICsJICogQERSTV9YRV9FVV9TVEFMTF9QUk9QX1NBTVBMRV9SQVRF
OiBTYW1wbGluZyByYXRlDQo+ID4gPiArCSAqIGluIG11bHRpcGxlcyBvZiAyNTEgY3ljbGVzLiBW
YWxpZCB2YWx1ZXMgYXJlIDEgdG8gNy4NCj4gPiA+ICsJICogSWYgdGhlIHZhbHVlIGlzIDEsIHNh
bXBsaW5nIGludGVydmFsIGlzIDI1MSBjeWNsZXMuDQo+ID4gPiArCSAqIElmIHRoZSB2YWx1ZSBp
cyA3LCBzYW1wbGluZyBpbnRlcnZhbCBpcyA3IHggMjUxIGN5Y2xlcy4NCj4gPiA+ICsJICovDQo+
ID4gPiArCURSTV9YRV9FVV9TVEFMTF9QUk9QX1NBTVBMRV9SQVRFLA0KPiA+ID4gKw0KPiA+ID4g
KwkvKioNCj4gPiA+ICsJICogQERSTV9YRV9FVV9TVEFMTF9QUk9QX1BPTExfUEVSSU9EOiBFVSBz
dGFsbCBkYXRhDQo+ID4gPiArCSAqIHBvbGwgcGVyaW9kIGluIG5hbm9zZWNvbmRzLiBzaG91bGQg
YmUgYXQgbGVhc3QgMTAwMDAwIG5zLg0KPiA+ID4gKwkgKi8NCj4gPiA+ICsJRFJNX1hFX0VVX1NU
QUxMX1BST1BfUE9MTF9QRVJJT0QsDQo+ID4gPiArDQo+ID4gPiArCS8qKg0KPiA+ID4gKwkgKiBA
RFJNX1hFX0VVX1NUQUxMX1BST1BfRVZFTlRfUkVQT1JUX0NPVU5UOiBNaW5pbXVtIG51bWJlciBv
Zg0KPiA+ID4gKwkgKiBFVSBzdGFsbCBkYXRhIHJvd3MgdG8gYmUgcHJlc2VudCBpbiB0aGUga2Vy
bmVsIGJ1ZmZlciBmb3INCj4gPiA+ICsJICogcG9sbCgpIHRvIHNldCBQT0xMSU4gKGRhdGEgcHJl
c2VudCkuDQo+ID4gPiArCSAqLw0KPiA+ID4gKwlEUk1fWEVfRVVfU1RBTExfUFJPUF9FVkVOVF9S
RVBPUlRfQ09VTlQsDQo+ID4gPiArDQo+ID4gPiArCS8qKg0KPiA+ID4gKwkgKiBARFJNX1hFX0VV
X1NUQUxMX1BST1BfR1RfSUQ6IEdUIElEIG9mIHRoZSBHVCBvbiB3aGljaA0KPiA+ID4gKwkgKiBF
VSBzdGFsbCBkYXRhIHdpbGwgYmUgY2FwdHVyZWQuDQo+ID4gPiArCSAqLw0KPiA+ID4gKwlEUk1f
WEVfRVVfU1RBTExfUFJPUF9HVF9JRCwNCj4gPg0KPiA+IEkgbWVudGlvbmVkIGFib3ZlLCBidXQg
aXQgZmVlbHMgbGlrZSB0aGlzIHNob3VsZCBiZSBhbiBpbnRyaW5zaWMgDQo+ID4gcGFydCBvZiB0
aGUgQVBJLCBub3Qgc29tZXRoaW5nIGNvbWluZyBpbiB0aHJvdWdoIGFuIG9wdGlvbmFsIGV4dGVu
c2lvbi4uLg0KPiANCj4gTm90IHN1cmUgd2hhdCAiaW50cmluc2ljIHBhcnQgb2YgdGhlIEFQSSIg
c2hvdWxkIGJlLiBFVSBTdGFsbCwgT0EgZXRjLiANCj4gYXJlIG5vdyB0eXBlcyBvZiAib2JzZXJ2
YXRpb24gc3RyZWFtcyIgYW5kIHRoZXJlIGlzIG5vIG90aGVyIA0KPiBvcHBvcnR1bml0eSBpbiB0
aGUgb2JzZXJ2YXRpb24gc3RyZWFtIGludGVyZmFjZSBmb3IgdGhpcyBraW5kIG9mIA0KPiBpbmZv
cm1hdGlvbi4gQWxzbywgZ3RfaWQgaXMgRVUgc3RhbGwgc3BlY2lmaWMgKGUuZy4gT0EgdXNlcyBv
YV91bml0X2lkIA0KPiBub3QgZ3RfaWQpIHNvIGl0IHNob3VsZCBjb21lIGluIGFzIGFuIEVVIFN0
YWxsIHByb3BlcnR5Lg0KPiANCj4gVGhvdWdoIHF1ZXN0aW9uIGZvciBIYXJpc2g6IGRvIHdlIHJl
YWxseSBuZWVkIHRoaXM/IFdoYXQgaWYgd2UgcmV0dXJuIA0KPiBkYXRhIGZyb20gYWxsIHRpbGVz
L2d0J3MgaW4gYSBzaW5nbGUgcmVhZCgpIGNhbGw/IFNpbmNlIHdlIGhhdmUgDQo+IGFscmVhZHkg
ZGV0ZXJtaW5lZCBzdWJzbGljZSBudW1iZXIgaXMgbm90IGludGVyZXN0aW5nIHRvIFVNRCdzIGZv
ciBFVSANCj4gU3RhbGwgZGF0YSwgbWF5YmUgZ3RfaWQgaXMgc2ltaWxhcmx5IG5vdCBpbnRlcmVz
dGluZz8NClVzZXIgc3BhY2UgZm9sa3Mgc2FpZCB0aGF0IHRoZXkgYXJlIGludGVyZXN0ZWQgaW4g
dGhlIEVVIHN0YWxsIGRhdGEgYXQgdGhlIEdUIGxldmVsLiBTbyBpZiB3ZSBkZWNpZGUgdG8gcmV0
dXJuIHN0YWxsIGRhdGEgZnJvbSBhbGwgdGhlIEdUcywgd2UgbWF5IGhhdmUgdG8gYXBwZW5kIHRo
ZSBHVCBJRCB0byB0aGUgZGF0YS4gSSB3aWxsIHNlZWsgZmVlZGJhY2sgZnJvbSB0aGUgdXNlciBz
cGFjZSBmb2xrcyByZWdhcmRpbmcgdGhpcy4NCg0KVGhhbmtzDQpIYXJpc2guDQo+IA0KPiA+DQo+
ID4gPiArDQo+ID4gPiArCS8qKg0KPiA+ID4gKwkgKiBARFJNX1hFX0VVX1NUQUxMX1BST1BfT1BF
Tl9ESVNBQkxFRDogQSB2YWx1ZSBvZiAxIHdpbGwgb3Blbg0KPiA+ID4gKwkgKiB0aGUgRVUgc3Rh
bGwgZGF0YSBzdHJlYW0gd2l0aG91dCBlbmFibGluZyBFVSBzdGFsbCBzYW1wbGluZy4NCj4gPiA+
ICsJICovDQo+ID4gPiArCURSTV9YRV9FVV9TVEFMTF9QUk9QX09QRU5fRElTQUJMRUQsDQo+ID4N
Cj4gPiBJcyB0aGVyZSBhIHJlYXNvbiBub3QgdG8gbWFrZSB0aGlzIG9uZSB0aGUgZGVmYXVsdCBi
ZWhhdmlvcj8gIElzIA0KPiA+IHRoZXJlIHJlYWxseSBhIGJlbmVmaXQgdG8gYXV0by1lbmFibGlu
ZyBvbiBvcGVuIHRoYXQgbWFrZXMgaXQgd29ydGggDQo+ID4gdGhlIGV4dHJhIEFQSSBjb21wbGV4
aXR5IHRvIG1ha2UgdGhpcyBjb25maWd1cmFibGU/DQo+IA0KPiBJIGFncmVlLCB0aGlzIHdvdWxk
IGJlIGEgZ29vZCBpZGVhLiBCdXQgdW5mb3J0dW5hdGVseSB0aGlzIGdvdCBpbiBmb3IgDQo+IE9B
IChpZiBJIHdlcmUgZG9pbmcgT0Egbm93IEkgd291bGQgaGF2ZSB0YWtlbiBNYXR0J3Mgc3VnZ2Vz
dGlvbikuIFNvIA0KPiB3ZSBlaXRoZXINCj4gKGEpIGtlZXAgaXQgdGhlIHNhbWUgYXMgT0EgZm9y
IHVuaWZvcm1pdHksIG9yIChiKSBkb2N1bWVudCB0aGF0IEVVIA0KPiBzdGFsbCBzdHJlYW1zIGhh
dmUgdG8gYmUgZXhwbGljaXR5IGVuYWJsZWQgYmVmb3JlIHJlYWQoKSdpbmcgZGF0YS4NCj4gDQo+
ID4NCj4gPiA+ICt9Ow0KPiA+ID4gKw0KPiA+ID4gKy8qKg0KPiA+ID4gKyAqIHN0cnVjdCBkcm1f
eGVfZXVfc3RhbGxfc3RyZWFtX2luZm8gLSBFVSBzdGFsbCBzdHJlYW0gaW5mbyANCj4gPiA+ICty
ZXR1cm5lZCBmcm9tDQo+ID4gPiArICogQERSTV9YRV9PQlNFUlZBVElPTl9JT0NUTF9JTkZPIG9i
c2VydmF0aW9uIHN0cmVhbSBmZCBpb2N0bCAgKi8gDQo+ID4gPiArc3RydWN0IGRybV94ZV9ldV9z
dGFsbF9zdHJlYW1faW5mbyB7DQo+ID4gPiArCS8qKiBAZXh0ZW5zaW9uczogUG9pbnRlciB0byB0
aGUgZmlyc3QgZXh0ZW5zaW9uIHN0cnVjdCwgaWYgYW55ICovDQo+ID4gPiArCV9fdTY0IGV4dGVu
c2lvbnM7DQo+ID4gPiArDQo+ID4gPiArCS8qKiBAcmVjb3JkX3NpemU6IHNpemUgb2YgZWFjaCBF
VSBzdGFsbCBkYXRhIHJlY29yZCAqLw0KPiA+ID4gKwlfX3U2NCByZWNvcmRfc2l6ZTsNCj4gPiA+
ICsNCj4gPiA+ICsJLyoqIEByZXNlcnZlZDogcmVzZXJ2ZWQgZm9yIGZ1dHVyZSB1c2UgKi8NCj4g
PiA+ICsJX191NjQgcmVzZXJ2ZWRbM107DQo+ID4gPiArfTsNCj4gPiA+ICsNCj4gPiA+ICsvKioN
Cj4gPiA+ICsgKiBzdHJ1Y3QgZHJtX3hlX2V1X3N0YWxsX2RhdGFfcHZjIC0gRVUgc3RhbGwgZGF0
YSBmb3JtYXQgZm9yIFBWQw0KPiA+DQo+ID4gSSB0aG91Z2h0IHRoZXJlIHdhcyBhbiBhc2sgZnJv
bSBvbmUgb2YgdGhlIHVzZXJzcGFjZSB0ZWFtcyB0aGF0IHdlIA0KPiA+IG1ha2UgdGhlIGxheW91
dCBkaXNjb3ZlcmFibGU/ICBJLmUuLCBhIHJ1bnRpbWUtcXVlcnlhYmxlIGZvcm1hdCANCj4gPiBk
ZXNjcmlwdGlvbiB0aGF0IGxpc3RzIHRoZSBjb3VudGVyIHR5cGUsIHNpemUsIGFuZCBvZmZzZXQg
aW4gdGhlIA0KPiA+IHJlY29yZCBvZiBlYWNoIGNvdW50ZXIgdGhhdCBoYXMgdXNhYmxlIGRhdGEg
aW4gdGhlIHJlY29yZHM/ICBEaWQgd2UgDQo+ID4gY2hhbmdlIGRpcmVjdGlvbnMgb24gdGhhdD8N
Cj4gDQo+IE15IHN1Z2dlc3Rpb24gaXMgdG8gZWxpbWluYXRlIHRoZXNlIHN0cnVjdCdzIGZyb20g
dGhlIEtNRCB1YXBpIGhlYWRlci4gDQo+IFNlZSBteSBlYXJsaWVyIHJlc3BvbnNlIHRvIEhhcmlz
aCdzIHBhdGNoLg0KPiANCj4gVGhhbmtzLg0KPiAtLQ0KPiBBc2h1dG9zaA0KPiANCj4gDQo+ID4N
Cj4gPiA+ICsgKg0KPiA+ID4gKyAqIEJpdHMJCUZpZWxkDQo+ID4gPiArICogMCAgdG8gMjgJSVAg
KGFkZHIpDQo+ID4gPiArICogMjkgdG8gMzYJYWN0aXZlIGNvdW50DQo+ID4gPiArICogMzcgdG8g
NDQJb3RoZXIgY291bnQNCj4gPiA+ICsgKiA0NSB0byA1Mgljb250cm9sIGNvdW50DQo+ID4gPiAr
ICogNTMgdG8gNjAJcGlwZXN0YWxsIGNvdW50DQo+ID4gPiArICogNjEgdG8gNjgJc2VuZCBjb3Vu
dA0KPiA+ID4gKyAqIDY5IHRvIDc2CWRpc3RfYWNjIGNvdW50DQo+ID4gPiArICogNzcgdG8gODQJ
c2JpZCBjb3VudA0KPiA+ID4gKyAqIDg1IHRvIDkyCXN5bmMgY291bnQNCj4gPiA+ICsgKiA5MyB0
byAxMDAJaW5zdF9mZXRjaCBjb3VudA0KPiA+ID4gKyAqLw0KPiA+ID4gK3N0cnVjdCBkcm1feGVf
ZXVfc3RhbGxfZGF0YV9wdmMgew0KPiA+ID4gKwlfX3U2NCBpcF9hZGRyOjI5Ow0KPiA+ID4gKwlf
X3U2NCBhY3RpdmVfY291bnQ6ODsNCj4gPiA+ICsJX191NjQgb3RoZXJfY291bnQ6ODsNCj4gPiA+
ICsJX191NjQgY29udHJvbF9jb3VudDo4Ow0KPiA+ID4gKwlfX3U2NCBwaXBlc3RhbGxfY291bnQ6
ODsNCj4gPiA+ICsJX191NjQgc2VuZF9jb3VudDo4Ow0KPiA+ID4gKwlfX3U2NCBkaXN0X2FjY19j
b3VudDo4Ow0KPiA+ID4gKwlfX3U2NCBzYmlkX2NvdW50Ojg7DQo+ID4gPiArCV9fdTY0IHN5bmNf
Y291bnQ6ODsNCj4gPiA+ICsJX191NjQgaW5zdF9mZXRjaF9jb3VudDo4Ow0KPiA+ID4gKwlfX3U2
NCB1bnVzZWRfYml0czoyNzsNCj4gPiA+ICsJX191NjQgdW51c2VkWzZdOw0KPiA+ID4gK30gX19h
dHRyaWJ1dGVfXygocGFja2VkKSk7DQo+ID4gPiArDQo+ID4gPiArLyoqDQo+ID4gPiArICogc3Ry
dWN0IGRybV94ZV9ldV9zdGFsbF9kYXRhX3hlMiAtIEVVIHN0YWxsIGRhdGEgZm9ybWF0IGZvciAN
Cj4gPiA+ICtMTkwsIEJNRw0KPiA+ID4gKyAqDQo+ID4gPiArICogQml0cwkJRmllbGQNCj4gPiA+
ICsgKiAwICB0byAyOAlJUCAoYWRkcikNCj4gPiA+ICsgKiAyOSB0byAzNglUZHIgY291bnQNCj4g
PiA+ICsgKiAzNyB0byA0NAlvdGhlciBjb3VudA0KPiA+ID4gKyAqIDQ1IHRvIDUyCWNvbnRyb2wg
Y291bnQNCj4gPiA+ICsgKiA1MyB0byA2MAlwaXBlc3RhbGwgY291bnQNCj4gPiA+ICsgKiA2MSB0
byA2OAlzZW5kIGNvdW50DQo+ID4gPiArICogNjkgdG8gNzYJZGlzdF9hY2MgY291bnQNCj4gPiA+
ICsgKiA3NyB0byA4NAlzYmlkIGNvdW50DQo+ID4gPiArICogODUgdG8gOTIJc3luYyBjb3VudA0K
PiA+ID4gKyAqIDkzIHRvIDEwMAlpbnN0X2ZldGNoIGNvdW50DQo+ID4gPiArICogMTAxIHRvIDEw
OAlBY3RpdmUgY291bnQNCj4gPiA+ICsgKiAxMDkgdG8gMTExCUV4aWQNCj4gPiA+ICsgKiAxMTIJ
CUVuZEZsYWcgKGlzIGFsd2F5cyAxKQ0KPiA+ID4gKyAqLw0KPiA+ID4gK3N0cnVjdCBkcm1feGVf
ZXVfc3RhbGxfZGF0YV94ZTIgew0KPiA+ID4gKwlfX3U2NCBpcF9hZGRyOjI5Ow0KPiA+ID4gKwlf
X3U2NCB0ZHJfY291bnQ6ODsNCj4gPiA+ICsJX191NjQgb3RoZXJfY291bnQ6ODsNCj4gPiA+ICsJ
X191NjQgY29udHJvbF9jb3VudDo4Ow0KPiA+ID4gKwlfX3U2NCBwaXBlc3RhbGxfY291bnQ6ODsN
Cj4gPiA+ICsJX191NjQgc2VuZF9jb3VudDo4Ow0KPiA+ID4gKwlfX3U2NCBkaXN0X2FjY19jb3Vu
dDo4Ow0KPiA+ID4gKwlfX3U2NCBzYmlkX2NvdW50Ojg7DQo+ID4gPiArCV9fdTY0IHN5bmNfY291
bnQ6ODsNCj4gPiA+ICsJX191NjQgaW5zdF9mZXRjaF9jb3VudDo4Ow0KPiA+ID4gKwlfX3U2NCBh
Y3RpdmVfY291bnQ6ODsNCj4gPiA+ICsJX191NjQgZXhfaWQ6MzsNCj4gPiA+ICsJX191NjQgZW5k
X2ZsYWc6MTsNCj4gPiA+ICsJX191NjQgdW51c2VkX2JpdHM6MTU7DQo+ID4gPiArCV9fdTY0IHVu
dXNlZFs2XTsNCj4gPiA+ICt9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpOw0KPiA+ID4gKw0KPiA+
ID4gICNpZiBkZWZpbmVkKF9fY3BsdXNwbHVzKQ0KPiA+ID4gIH0NCj4gPiA+ICAjZW5kaWYNCj4g
PiA+IC0tDQo+ID4gPiAyLjQ1LjENCj4gPiA+DQo+ID4NCj4gPiAtLQ0KPiA+IE1hdHQgUm9wZXIN
Cj4gPiBHcmFwaGljcyBTb2Z0d2FyZSBFbmdpbmVlcg0KPiA+IExpbnV4IEdQVSBQbGF0Zm9ybSBF
bmFibGVtZW50DQo+ID4gSW50ZWwgQ29ycG9yYXRpb24NCg==
