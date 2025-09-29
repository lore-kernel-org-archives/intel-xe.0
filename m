Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BD5CAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 10:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F4910E3EC;
	Mon, 29 Sep 2025 10:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2/K8Kjv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAF310E3EC
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 10:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759141528; x=1790677528;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MSkOMlBQbPELsH9pLHBRZvq4eMvwpebyS+xzXtji7sw=;
 b=L2/K8KjvRQa2BnLc3lgUiF0KBdWcgk0vgsBu3e5DS8Qou4WLGjfSwgGx
 Ptkwx3MH0B35HvX30X831wDsu8B6KAwWIc+QQ4hSK2+NmUl2iGCV/MYs1
 OZ7WKNOE59RVLsbYHA7CLvk1du5sjaDz/mAtVRGH3bqHOh+9XZfXWAMFI
 qa9zQw8lwU4/TJBkiHG3QlaopY1mO8oP1ro2M7NEO1syrPUO74hX4rTMn
 O/7pfhoieFc/+8NjSiN6dPVn2ZIWNa/fnK0BN41DY9nyEF9zbpANGOAqm
 jbJ9ocIkUIa6DdK2DJIHyrWTuzRCoi1mW3fEKbugr24p3ZBT3CiG6yEkh A==;
X-CSE-ConnectionGUID: hIk/vbyLRJKME9fYeuYy6Q==
X-CSE-MsgGUID: zXF1BgTIR+Wr3rsEDECHsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="72809190"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="72809190"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:25:28 -0700
X-CSE-ConnectionGUID: mn0NWHYBT8qNZT224A4log==
X-CSE-MsgGUID: E7/6LdeBRQWwe44C3DmSxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="177454696"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:25:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 03:25:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 03:25:26 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 03:25:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMeB0vJ7cw0atEMPa2qESwKFfeQV7fhjmzfc2A+lg+fug9/cbwTBg7NcSgiELNU9O7XyGkCUMTx79mZLzmstfZTk39LWQbP72KAnIaMGDmOQ6YR2RzjeYZ3ETlDfZ3N/8Ox4Yd9sRmk4Sid9yvIcXRMr5tD6wV/eb7jaxYA5/EwyyOgsLM8UMEmHUCxZLvwmLSUCTKt1Y29fJz7tSHYAqfT5tWxNu7sYGxSkCxQTI7akErgkpKCeovtdr4+JRKP4THkIx3ZNw5X/USTNEev3U8O5laZUjl7e7nATwAGQIdskUPILOJSVbjxZqEZVFjJGndWlKfvKo2qViQmZ6uBoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+buxv6BdbZYUi5T228/wEfRehfADP943+iRQxwGLd8=;
 b=Zlo+FXsPy6VgNdKZ4TD63SiINqpaSsrY6ZR55HvzUMpriiyzECU0uVK4bc57rcU139mgMkPiKtHZAFBtwQcfV9es6rzKIb38dLgY0OqkzJyEZhwIUGZ4DQyEnrDm8UXZu/7KU8UG6cJPsLZzEoMxfqhyD/1LO7U9f9g2nAj9TvPqtlXScaGf+U4uzDJWjEclmPYno4UTp4yryAl2zwnYcp3vBWzw6uKPWCOdJcHiHqDky9q/g3D7wD6Ddi6g93pldDwD9g/DZ2h3yuw/iThvACRGTSCadfU5Sd1Mbqlz3IAPs8SZjC8lesosxDonRgYo9dUtVNc4/24GjTiFVRUGJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH3PPFF2B8F6C64.namprd11.prod.outlook.com (2603:10b6:518:1::d60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Mon, 29 Sep
 2025 10:25:23 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 10:25:23 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 3/5] drm/xe: Don't call xe_device_get_gt twice in
 xe_hw_engine_lookup
Thread-Topic: [PATCH v2 3/5] drm/xe: Don't call xe_device_get_gt twice in
 xe_hw_engine_lookup
Thread-Index: AQHcLyF/gCxbbO0F10C9GZtuyRhJybSp+FKg
Date: Mon, 29 Sep 2025 10:25:23 +0000
Message-ID: <SJ1PR11MB620473C2EF50AC48D0C89B91811BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250926200917.164618-7-jonathan.cavitt@intel.com>
 <20250926200917.164618-10-jonathan.cavitt@intel.com>
In-Reply-To: <20250926200917.164618-10-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH3PPFF2B8F6C64:EE_
x-ms-office365-filtering-correlation-id: d9e88a06-f46d-4826-7e33-08ddff427fff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?fLuZPnqmXCJZY2n3x7nTc4oFwubb0M6Wushx9AF2f89c1cWDmCG+uyHNkk7I?=
 =?us-ascii?Q?aJGqmqPB2UgmY4vwm8+GjgiqnQK4dS9XJGjdfl1tFsWSH9FQugeJUpz6xhZ5?=
 =?us-ascii?Q?GY1ApC29hIkhvylRu58QikawMPvxws6/a7UqWE5EDAFStPskdGeFRWUoDN54?=
 =?us-ascii?Q?bFIAVkkDb+VSYp/wMD+gn1yt+LCmC87QqE6mNzV3dkfakV82W1IVd4gmGavr?=
 =?us-ascii?Q?g8NNsTWZ+6NtUYAcvVm7SDziW++Vo2PCnQ9FF1yJthDpsDgBKQqvji1FnSSh?=
 =?us-ascii?Q?7l50DB8LCpm8rtpsNfSKP/VyFpsF0I2NS5gVzkcai/qWYpuGR3Tk255I9rOI?=
 =?us-ascii?Q?zSW+tp0J39xgHI9YmfbkH9FMAhkdiFYvyH5dTQhTDaQqiz3vAW2deDmOxUTR?=
 =?us-ascii?Q?eTm792803EQad2JRpPkEdeIcEyGZptpoEP/5Q0vL5+T1HICprGU8fvC5xCke?=
 =?us-ascii?Q?HwcTAIGYEv3nRE3g17plQuGAdxV1fwPMap7jJ34goXne1pKIkG25rIhD7wq3?=
 =?us-ascii?Q?9vT9cFwrL98cyrAYJqFyZ7oCObypCqyCihPbTIow2nBVWmQYQtUimUqRmCKo?=
 =?us-ascii?Q?AayI2qMk6XabciAigk7SBpEBB24MwRXkYkqj7kfIL7U1TbEUdspkn+ELv9d9?=
 =?us-ascii?Q?OfbNHwU62pAvEmPxTceeiryJQlA6EUMaemG5WwqoTKUY+lYjQmQK3so6z4UJ?=
 =?us-ascii?Q?Ta1zsBiFGW0WpIwAGSoJ95h8/Ab+ir0Gel8YbquOuuW2awS78eiUn/kQhMAH?=
 =?us-ascii?Q?r2mvQMEDQIkn57vAjaEO85KSmGyZXbKdulvg23cFXYojLMpaaKGyOhloc4dU?=
 =?us-ascii?Q?UBv+nXOcRFinY35P9PPefuYdqzHpDGU3NqPvbn8mHg+EIEYc4Cdrw2mK3JOv?=
 =?us-ascii?Q?NncgUN3opJOcP42KfapcN9l8QwQJMQgFKlnd61Q9Ikpc94QGIZ2HdO4Wb2+n?=
 =?us-ascii?Q?eUcm7O3d1NjEpBxB3qlZL+qz9C/7i3/O13fhDEIoqzVWKafVRNzUmWTvjhMV?=
 =?us-ascii?Q?rp9Rmm8HsUTiPWG+jdRalOCycVN5QM6m7TVek59n4UwhLvgr3W5BNCRfpkZF?=
 =?us-ascii?Q?B2MYeGvM3umHX8j8CBD4Tdp0tzBflIMScm8Hh+AqWaCf3dcvyal82AaOzYT+?=
 =?us-ascii?Q?srKQvLelxgWqF4UamWaImgSfLNEzslaiZVbpMZFISjbGoPqBxKAqr8emCxOP?=
 =?us-ascii?Q?f+IF4k50Z2eNpkad4MI7IeekXp2EseGUC5pC313fJDsx2aZEfVsC/ldb/ZZz?=
 =?us-ascii?Q?W5XvsIx7ZeijJqJV7h5srq+98aqPlZq8u2D2FSRAXMnxPJOShTTDuJUG483J?=
 =?us-ascii?Q?z8yxnSVvHNKJz6h3v2i0Atm1DoOi0VwevzO+g8XcedNUoNlQXmxvMwvDb1I2?=
 =?us-ascii?Q?/wWZfZDyouzBxvrSV0j+IalEucxpNgkyZS5XeXn2Hpd3TjT8lgie04q/qX6S?=
 =?us-ascii?Q?PVZ4iize8/16rD9NTgKzlz4Kw/mjRTjb1m24HNCB9Ky9r2PHQChVjetySNjV?=
 =?us-ascii?Q?m7okd6oh33AEDPmYOOwufusR8GiJHPpRKmHj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RbWoPvN33aKKtNcPnob8tQoGbpSuu2uuhuz3+fVEU16DnRtJ7FfajsN+PCzy?=
 =?us-ascii?Q?oyMs3MD/itNkRNOEnVLtCwlGx/sSQR04vBe+K35FcbcG9jRQVIRHg4jaFpdH?=
 =?us-ascii?Q?qs59bGuGkn5xxkLpAD+RPH7U/Kc+b/rlO9BI57Ge7EG2ZpqqC3TwVabAsmTi?=
 =?us-ascii?Q?bvTqpeN05cEaW8VvFn7viqEFZomm0fQwoEEyYpC4ck0zvo4zocqQcky14Ka/?=
 =?us-ascii?Q?RP/TQGuGxct4RGuK3F3F0hmJW1n2UEzPMNORi8t3dR6RGj6e+nNOvbz4ueHK?=
 =?us-ascii?Q?IDq9up/NVqbfsQyA0g72BoJIaj9KEegvuX6BEycl5YC139vAnQN5KzLN6c+y?=
 =?us-ascii?Q?S8ytstOOfSEhlRB04K7yrfEIK5WaGB2peZj2Da9QxXGI/F5+FDpXjt/j3cQs?=
 =?us-ascii?Q?221O1fzk2HX0X2cAmcFv87Z0vvepSbt/BxE/mYCZQNH7qaSX1G6sh580GdBR?=
 =?us-ascii?Q?+O+YDr3qjwHK9kucOGKha89nZKXpYakfdYtlfpK8iUmfXB2drpk4asrKNfxR?=
 =?us-ascii?Q?wLYZrPT2S/NB/K4qB+YuosCf8iUh8QBvKAnodfStkW0PXvGkMAwEYqARMXqm?=
 =?us-ascii?Q?V6Wnuf5JuyN7TsdxFOwI/F/k+wOJXj6yapPxYGC+SiD0M5IBOAmjQ9Pb/D40?=
 =?us-ascii?Q?bfmzXxKf1Vj52LOF7Z8zdWf+cFGthDjy7at9xtvVNsVgLNyYwi4H4r4LZP9V?=
 =?us-ascii?Q?vw8BsUNa8nZd7CBIS55vind/RcW3YMKpauumCco+5MMCn/IJyMd8hppvXFjW?=
 =?us-ascii?Q?CG+EWF/EZWsdel2lIApbsf2u/XZhH8kci2+/cw+unTcfpNMlEHTYgFP2Ph3V?=
 =?us-ascii?Q?2AaRoiTVDIzKMDtd2XDfSf1AySTQFB68QeccqKCE1SMLBhM+UamztJCki/We?=
 =?us-ascii?Q?wtR/W60uaR4tWapBaGRqJV8Jo6nVqPj6PSoxirLGFMfuYioVpbcYaJtoBFPB?=
 =?us-ascii?Q?H3Mnos0PQ4LZzIG63j1GWqkL7Yv6TsqwSlCdlcGY+yrW5g8WmCNT+G7VlTxc?=
 =?us-ascii?Q?xSEdu96ZQ5HzY49Zzg55xCX0k+YozVpRW+hQhck/48dd4pygaE2RgpypIvrY?=
 =?us-ascii?Q?UfFZVHdKJ0mTorEO54xoEkdhCgRlbaNXMLiegR9VT2Rxm4GavWFDxs7PEAv4?=
 =?us-ascii?Q?7y0y/jv6Vi9sjLvRP7JXvsiQK8+ZliFijepDPCA68kZKHwCUXpDwqDTJCDHb?=
 =?us-ascii?Q?uVrHXiU0Uz9+/bBreBg/OyNiflWVjJx2LBv4RZDfJ2C+inkhRsD51TO4JDJ5?=
 =?us-ascii?Q?EcclpUqzRJXkTtTWsBW/td5HLzparz3Kfc28O4YV5pfrr5dE+1ZyjHYndIcF?=
 =?us-ascii?Q?R53+lBTKlh+FbeWHj4uCg1PpRxmzG1HJsK5KajcKOympTWbmYoI/jqm5F69l?=
 =?us-ascii?Q?6vTmPZs6u6y8qQbOMjclKt1rtf/Ym+sClOO6CRl5CGwCDw2T1UbOg2jEL0zP?=
 =?us-ascii?Q?PUMdszHfmsCXIcCeyJ8B1tLlwyQeb3llm3shYwf819nbvjWJeQWkyW0YQuca?=
 =?us-ascii?Q?Nq2y4Epr+wh63WWnLlU9MBbRA1mg07gDDr806TFTxfXN0Y21AQihco0JLa6i?=
 =?us-ascii?Q?8G6/goJM4bvdPJo7axVi45sWXM7WAkPwXqbpm3WP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e88a06-f46d-4826-7e33-08ddff427fff
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 10:25:23.6725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UVoAdb+nJWlCdTgBbxkwKbH4MxZqfTUhU45UWGlMEJ0qM8MonI2MkiNpZdGFdEwsxHfs+SsaSjJSp1JmLTkt9ROYZ4Vy3NKcmd5XFjMmLeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF2B8F6C64
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Jonathan Cavitt
> Sent: 27 September 2025 01:39
> To: intel-xe@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg
> <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Wajdeczko,
> Michal <Michal.Wajdeczko@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH v2 3/5] drm/xe: Don't call xe_device_get_gt twice in
> xe_hw_engine_lookup
>=20
> We already initialize a
> struct xe_gt *gt =3D xe_device_get_gt(xe, eci.gt_id) in xe_hw_engine_look=
up to
> ensure the given gt_id is valid.
> We don't need to call xe_device_get_gt again to pass the same gt to
> xe_gt_hw_engine in xe_hw_engine_lookup.
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 1cf623b4a5bc..f4b9857d6195 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1071,7 +1071,6 @@ xe_hw_engine_lookup(struct xe_device *xe,
>  	idx =3D array_index_nospec(eci.engine_class,
>  				 ARRAY_SIZE(user_to_xe_engine_class));
>=20
> -	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
> -			       user_to_xe_engine_class[idx],
> +	return xe_gt_hw_engine(gt, user_to_xe_engine_class[idx],
>  			       eci.engine_instance, true);

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  }
> --
> 2.43.0

