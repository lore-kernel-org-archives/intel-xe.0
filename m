Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A99BD3B7E5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Dec 2025 14:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA71E10E4DE;
	Mon, 29 Dec 2025 14:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVE5pRYp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C1E10E4DE
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Dec 2025 14:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767020136; x=1798556136;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=KdPY+v1b5WfXKM8VBDfXF4tjlusEa0iXOHPy4hK17/E=;
 b=IVE5pRYp6G388IlxaYcv0P/FJBtib5CLET7YLyA5AsSOP4obn00GxqOd
 CDFJS3H4K/KwOeElrXSmoeGLXDINm4WecoqALtCpFmtW8hkJSiWvuTCQQ
 PE946qFqh4NHAs6MrhFBscUaWZ5Pk8gDQDPmrXRbp97OP00i3WNHc5bvp
 yLIwaHXPJU+ubHCDnFAo3uGm+f6zqWK0iykeAhmeaOX7Bxrv9uo0KGhly
 HuK6AloaqVyFEMVxJuIuSfFaDoI+rFQPLOUVxADmJSHWEp1b33kZKJ3ZT
 KGEiJcq+JhKk2t0UrFLnBRU7Be+RjM3vwgKVUsgfDBgIW/Iv/LqyuBg+8 w==;
X-CSE-ConnectionGUID: XxRRG3IXRpuBb6fgmcwLFw==
X-CSE-MsgGUID: +4zk+8WnRXOtJUPy5cRNiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68517888"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; d="scan'208";a="68517888"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 06:55:36 -0800
X-CSE-ConnectionGUID: 6eY/5ZW9SSeC0fgx8N3V7A==
X-CSE-MsgGUID: LGaA46uYQV6YWvsxhwWHTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; d="scan'208";a="224423465"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 06:55:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 06:55:35 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 29 Dec 2025 06:55:35 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 06:55:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5rr7bHIlzf3LJjxK7AE74eqrVaTNvaGBGAlN4k2MbV/aP9ShOUVQGzkvb5MIw7ju+xMcbeqI3cWubkic+PN0TFTyagYw8UwHFl1lhNauNMVUiHKYID8sFiOoV1m94nLhAYq+EnyfYuuhZaaMCVYqsJu984psb6NJ07TaZRiLSmalmVDvsedPGCUhI80eYHz9p+SV8eW3rlAhtO2MTyZvJkzkkv042dhVj19y5hwju9Oi2ekoJZMcQIG0Zmrk/Ad3u9/lIYf9TZE/TduW8jC6yXJXUd1f/RM/PgqS9Dd9kPbPrl8pbOOjt8pyxilrmWwErobrbYnWFLe16o5QOyd1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DayUtoDpE6JDcZovFm2Rdr7MLC5cpVtfYqK1wHYf/4=;
 b=qZwZpcdlmw1it0ZLCQBCFPZuz9axg1LGEMx2uY/d2nThj5evDpQCusBLY2umEQxIP0VnqZprwbDiRoK0NNReFb64xBpDlZA2ytroiY4dgvuPvDLxe211BMKOXvYdd3bpOKaxm+4FUXghkZjkyV2v7qS8YHKTqYoRGGGgBQkJixS/PgXW3IV4LTcNKJGg4wakWmQxQSIRa9niLAfkR+u92NV9Cu8ZMf56wRJefbaha/p2zqy2ANSc08sEjH0W9lpnMEPFgkaF6XFXtMRpFM9g9HMELaNplJwToZWcGuAzp+Rn9h4N6ej88tUK2JloX1oP9SVYo+1cBRxOJulW10BOSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA4PR11MB9250.namprd11.prod.outlook.com (2603:10b6:208:56e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:55:33 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%3]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 14:55:33 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <175742407469.1838.8196804884213124088@intel.com>
References: <20250905162236.578117-2-lucas.demarchi@intel.com>
 <175710134539.5916.1325336923027423466@intel.com>
 <y2dhkx3yplrpesqlx63d46y7w5zjv7w2cj5h262p3jq5vjgp2f@dz2bjsfce3qp>
 <175734053228.1838.4745774366865518571@intel.com>
 <trmhqavvrqo5ujkot2apdmtmiylbkhpnbinfocnotyvh3fo2v2@so2ll7po7bzn>
 <175742407469.1838.8196804884213124088@intel.com>
Subject: Re: [PATCH] drm/xe/configfs: Use config_group_put()
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <demarchi@kernel.org>
Date: Mon, 29 Dec 2025 11:55:29 -0300
Message-ID: <176702012902.3428.16231273689807073336@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA4PR11MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: 61be0e78-cacf-4f9a-2adf-08de46ea5106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1djanZyMVZ2dUl4MlVPenRsdm1iTmNXTzIvQWJXUWtCSjk4UVpYaGRqdXo4?=
 =?utf-8?B?cnpqUlRCUmxaNGt5ZERnbjJOenR6WEdUYy9lNjNBb0puUUg4VmV5ZWdlVVRj?=
 =?utf-8?B?S1RGdk9zZnFRbmQzQlBDeGpHWjVDSUxmbVNlUWhzODIxOStVeUY3V2luQzdF?=
 =?utf-8?B?Y0JvQmFmeFkxUXRIcVA3R2MrOCtObHpyMGJLQWZpUmlQRnBlRHVvY2lZVE45?=
 =?utf-8?B?SHFjSXhSWjFnUDVyb2VpWFpxVHhTVTYrSnZSRjZPcFFGUldoVXZPV0ppQlNm?=
 =?utf-8?B?WjRjTGlLazhBd2daTFJrODZFUHpUNmtsMCtTMXRXZkxmaUh5NEhPclAyeHR0?=
 =?utf-8?B?dGZueU5DU21QeCtQdVI2cU9YS00yMHF5QVlzS3ZMblEwUjBjRkRVbTFjdUJX?=
 =?utf-8?B?RllBZGNWYzV4elpBcUZSOWJzdkVUcEhkejh2L1JYcXNnSU9IOVV2cVFkWktF?=
 =?utf-8?B?WDVJaW10SXN2dUZTTlo4eHhyMmlwUWc2TVFuVWU4VDVIcmZOVC9NaklIR2gx?=
 =?utf-8?B?aFNDWTk0eWNnelhIMUNmczdFSlVmV0x2emk0SkpHcmxsK2Y0QlBVVU9YWVpK?=
 =?utf-8?B?Yk9mWXJ2aC8vQk5haHBPRnBEazE3MFJzOGFOeEFDOE9zOFB4R09pNDJ2Z3FY?=
 =?utf-8?B?NjNuWUE1cnJiMTRkQU5OMUx4UWd2ZnoyUk9RYXFSajhPT2xrOUZ2MFVsenQz?=
 =?utf-8?B?SC9IOVM4bjJZQ1p5Tzh1RUhnM3JRQkFOM0JGRjNremhwd09rcDFBZ0JUM0pL?=
 =?utf-8?B?VkZ5THdnWGtGUjQ5amFVM0ZHMGU2SkU4YzZSak13ZWNPZTV5amthSE5QWmcv?=
 =?utf-8?B?LzFFcndIamJiNUwwVVZlS3Iycko4NGtDT1J1SWVvb2ovZnRMTFJ2LzZPN2o4?=
 =?utf-8?B?K1N5WkVtV0pITUxJWm52dURrUDZPVnJsMjhEaGQxbjBSSFZyRWsxeUtpNXJh?=
 =?utf-8?B?SHZVQnFFMGQyU1ZGdlpSQTljVXF4c05vbGl1TkpXelpYQ1ZwbmxYMy9pK29I?=
 =?utf-8?B?SkNER3N2YjA2SlNUeUlBUnVLNXB6cmZnL3lPK21TUFpVMTdCdlkydWJXVUd0?=
 =?utf-8?B?d1ZuL2xQSS9CQndzQ0IyZERlVEs3VWxPYmVBejRYOXZ3UGNzM2ZZL2c4eHhT?=
 =?utf-8?B?ZTNLcmdGWENRWHpGWU1ab3p6c2diN1JwSmZUR0Eza0o3NFdYWGtMdHZwNGFq?=
 =?utf-8?B?SWdsajF5NHZ1MlFMZFBZQWc2MHRkaURYN1Rid09iekIweWpIY1V1U1kyYVRB?=
 =?utf-8?B?dDRFOS9mNmtwY05Pb2RhdUhNTk9rTVRHZHlkV3NjeVBkaDFMb1hCRnNIQ2VS?=
 =?utf-8?B?U1I3ZmowQjB4Tm84QzhDdEVJTU1mbjVLN0QxSm9wK05vYkJQV0pBNk9YQ2tm?=
 =?utf-8?B?UzZlRlliWExoQnZLMmdrR3V5dVg0YUJxN01UeXBSSVMzek05YUE5MFpMaGNU?=
 =?utf-8?B?NnNySnU4M2JKQVd5aDhLTjVGNEE3KzlFSGx3dGljc0dmeGdqVzJCcDVtV3hR?=
 =?utf-8?B?VDFtNHZ2NEpFNkxJUGp0MnUwMkVoS3BJM2RSWHlSeWFGQkpOcVY1d3FKOVpw?=
 =?utf-8?B?aWE4WStFRzh0dHo5ME55cWkrT0VHbSt4RjZpN0tQcTBnUkNPcWJwb3psRVlu?=
 =?utf-8?B?SnhrOG04K1l4WDBPZkF5YTJqMzIvVG5KNVRSbWlWVlU1Wm5pUURWYXdJWU5x?=
 =?utf-8?B?T0x6Y2EwTjBBUE94VG9PVHo5MlFqMnVoOURxVnJQMUdWTk9jOVo4c2tqb1Qr?=
 =?utf-8?B?NjFkV3lDb0xvVkhrc3lpR1h2bzhqUHZ0V1RRVjk2VGpBZ01UTks1Z1hxTXM2?=
 =?utf-8?B?dGFndngyVXFUeTRvOTFIck40aHJRR1UxRXI2TmUvUzZSVlU3ejRFMHZYY2FZ?=
 =?utf-8?B?UFZDcGRWaFVRQW95WDQzeGpEc1VoUGNIYW1YY0FFU1ZyQ0liZmlJc3VNb0V1?=
 =?utf-8?Q?jgsxLvjFJQEN/86U4IT0aWuLMS2+iaRK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1BlZzBnODNwZmRtcWRJSFVSdzFTcUQyd1hzT0dmN3U1YzduNnFsa1JWenJ0?=
 =?utf-8?B?UnlqMHhhYlRENVBZQ091N1VCeFJ0eE1naENrdndXdElkeG80WDY3UEtwa0Uy?=
 =?utf-8?B?NGlDZjNGSzlOWlBQM1c3WXZicXF0dHIxcmc5dUpRQXJ6NUZzQmJoc3pZcFgx?=
 =?utf-8?B?NGtkdXI1aHkyUWU3SlBzbGRYRitLc2R1cjV2QlZqcDk2bC9WOVpNbUcxNkx4?=
 =?utf-8?B?Zi9uRHdkTDdROWZGb25mZWxJeXprbC8zSXU1cy9YUVVWZ1NpcW5LSmxNZDFy?=
 =?utf-8?B?SjM1SVQramczYWRjdk53alZqbVR4ODdZSFFxR2ZNUHEwZlEwVk9VYW9LZVp5?=
 =?utf-8?B?MFpFWEEydTVvTjd5ZkgxWEJJZUZseGlQNkMyTXh4aE9rVVJNVk1aQitaSnNY?=
 =?utf-8?B?NlR0blhDRnJjQ1hRMWdOQVZIeXEvZjVhd0JDMzNNOUZOMVdwY1kwanBnSVNE?=
 =?utf-8?B?eXR0dlVGbElpMUpLQWJCWDBTTWdKNGZuMEExRmZlalFUSjE4WVQ3V0pzMlRr?=
 =?utf-8?B?WVpDeTBnYklod0xiaHZ2d25idVMyeWRVcnd6SStkOUNBQUtueTAxMW5Fcnln?=
 =?utf-8?B?WnBjQ3B3SlN2cjlkUjFVa1daK2YwNEhuMmZNR25IbkJxOVJIN3l2SVFQQ2hF?=
 =?utf-8?B?dFE2bW9PUnQyU2VhRGNOQllGL0t6ZnB6NHZPZnRBdXVzY1dZYngzL1pHNmxv?=
 =?utf-8?B?bUxIYnVQNUJTVjRjZGJKV2d3REh5R09OeVhub0l4NTRTWnRrQmRxN1JJdDl6?=
 =?utf-8?B?cXU0c2ZobzFwS2FlVHdMSGtzOXUvN0xHQy93bUhuZXkxdUhNQi91QkJTaDFJ?=
 =?utf-8?B?dmhZS2l6b0x0OVBWVksrRlJkQzZwVGMyR3pnbXF1d0RDYXdVUEhKN0FwbUxJ?=
 =?utf-8?B?L0xBT0ZsSytDVkU2NEphbytJa3JBODVNUXk5K3ZjM0F6QVVjWnVFbllRSmVv?=
 =?utf-8?B?b3M4YXFNNnVtbUo3S2xZQWs1bDVrRERzTlpJYTg2SHh1MUhkazQ2M2tBaDln?=
 =?utf-8?B?Y1ZRbzJyaWRlcmZFcEdrdFlSdk9MSnV6ZWErZkk0SEx4ZVA2VnhLVEl6TXdR?=
 =?utf-8?B?SVpUN0NTa3Y1Yi8zYmdjcE1LR0w3RGxGclhPaXhyK1Zxd2dwaGhOcTRkam5j?=
 =?utf-8?B?K1ZQcm5SaHVXMTJBekYvY2Z2cE93c20rejNybUt2K242Q1FldGdoZTNYblJH?=
 =?utf-8?B?aXo0R1lZVzc3b2srRG4xWnFiUkdoY1UvanRXZVlmanQxQlNFUkwwQ0h2KzhW?=
 =?utf-8?B?ckZPUzhVQllESEYycVV0aVNvWTVFZTVRNGI0Nks1Y3Zna3QzQzB3N0htZFVZ?=
 =?utf-8?B?RDhoaGp6QkFiK0lOOHRyK0ZYaTk0S3hMWk5XVksvY0tSZ28xUC8zNFcwN2dU?=
 =?utf-8?B?ZWlTZW8xODRvK09qOFE4Tk9wYWNFd1VQakkwQ2crTHdtbW1KSlpnUDMveWx1?=
 =?utf-8?B?M0F2TUF2bWtUQityYnRnalBUUkY1UXl3WGFhMzBxeVFYYzhJbXhscGxPKzB4?=
 =?utf-8?B?bys3UnFheHJiamFSc05USzFOb3FEcmNrOEVOTHM4ZVN1akpkQlU4cXd6d2tF?=
 =?utf-8?B?MzRGdXoreGN0UFl5dFVNc0ZyT3ZKd0NvdktLeGpUUTRSNVhGQjZzMFhJd083?=
 =?utf-8?B?bng4SVVndGx2em1aQ2gzSGI5eVY3QTFIZjJEdm91RFhWQ25tS3YxK093WjFx?=
 =?utf-8?B?ZjUwdXdldmdLSVN6a3NMSk9WbDVXZXVoK0FlamVYZ0ZvQmd1YTJpZHdEb2NR?=
 =?utf-8?B?eGRvUkl1ZXVaUHFubGN6UkF3RWxIdkhMdnpSbzJpcThMdXdrNk9SWHh0TklU?=
 =?utf-8?B?WHAzbUI3d0U5RUhNdkgyRTdKVE0rWVRuU2F3WEZSWktid3FDVWJuM2FTc3dM?=
 =?utf-8?B?eWw5akxTVHVYUHZTVmIxWWYvVzdPeHdiOTQrVzRGZGQ5MzVrR3VJVCtHRFJx?=
 =?utf-8?B?MTRYTWxPaUgvYS9OUmh1Zk5KZVh5UGcvTEo0NmZCMkFtWFJodnhhWGZDTkVp?=
 =?utf-8?B?WTdXVEswN2dKSGFIbWl6bzg2TXNqZVhEWEFjUkUrZHVZQWZUOEdxNU50ZW1j?=
 =?utf-8?B?YURidWFnRmhRNVVRV3RuZUY1Z0VPOUczT2xZMGtrVlZWWk1McytDdmx1SnU3?=
 =?utf-8?B?WDltNnFzcytOckRmOE5PRGVpV1BRVTA1ZDVWcitkdWowcUtSamNSaFRBSEx4?=
 =?utf-8?B?OUk3KzNiT3R3ejBEN3J6TU5pa3hhclkxNGJ1NDkrTWt2Zk1rN3NlemJoZjE5?=
 =?utf-8?B?eU1WMVZ5M3RFVGVtMWxHRm4yNDJlazR2a2M4RTFLVlRTRThUWUZjcGFmTVFq?=
 =?utf-8?B?eng3VVhXWmJCUTgvQ1lRYldjMTRRcEphMVdDYUoyb0huSEhmamZWZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61be0e78-cacf-4f9a-2adf-08de46ea5106
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:55:33.1399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgjvW8zQJ915bbsWCGWJQ5RodRAO4ud88GJL69U/+3sGBqoz64+1sLbmrxvCq4m08Terp1yj71eDWpVSfxyLcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9250
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

Quoting Gustavo Sousa (2025-09-09 10:21:14-03:00)
>Quoting Lucas De Marchi (2025-09-09 10:01:52-03:00)
>>On Mon, Sep 08, 2025 at 11:08:52AM -0300, Gustavo Sousa wrote:
>>>Quoting Lucas De Marchi (2025-09-05 18:38:28-03:00)
>>>>On Fri, Sep 05, 2025 at 04:42:25PM -0300, Gustavo Sousa wrote:
>>>>>Quoting Lucas De Marchi (2025-09-05 13:22:37-03:00)
>>>>>>configfs has a config_group_put() helper that was adopted by
>>>>>>commit 88df7939d728 ("drm/xe/configfs: Rename struct xe_config_device=
").
>>>>>>Another pending work to add psmi later landed in commit
>>>>>>afe902848b41 ("drm/xe/configfs: Allow to enable PSMI") and didn't use
>>>>>>the helper.
>>>>>>
>>>>>>Use config_group_put() consistently to hide the inner workings of
>>>>>>configfs. No change in behavior since it does exactly the same thing
>>>>>>as currently being done.
>>>>>>
>>>>>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>
>>>>>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>>>
>>>>>By the way, after taking a look at how we are using configfs, I wonder
>>>>>why we are defining each "device" as a config group instead of a confi=
g
>>>>>item. Shouldn't defining them as config items suffice?
>>>>
>>>>The xe_device maps 1:1 to a group, i.e. the <configfs>/xe/<bdf>
>>>>directory. When setting/getting a file (aka item, create from the
>>>>attributes), we find the group they belong to and use that single
>>>>lock to synchronize:
>>>>
>>>>                  1:1                                1:n
>>>>        xe_device ---> configfs_group (xe/bdf) <---> configfs_item
>>>>                                `->lock
>>>
>>>Unless I missed something in the documentation for configfs, the
>>>attributes themselves are not config_items, but they are rather part of
>>>a config_item.
>>>
>>>I believe our current hierarchy is as follows:
>>>
>>>    xe (the root config_group for the "xe" subsystem)
>>
>>which corresponds to static struct configfs_subsystem xe_configfs,
>>that has xe_configfs_type as .su_group.cg_item.
>>
>>This is responsible for creating new device groups with the device bdf.
>>
>>>    |
>>>    |-> <device0> (the config_group for the "device")
>>
>>
>>>    |    |
>>>    |    |-> enable_psmi (attribute)
>>>    |    |-> engines_allowed (attribute)
>>>    |    |-> survivability_mode (attribute)
>>>    |
>>>    |-> <device1> (the config_group for the "device")
>>>    |    |
>>>    |    |-> enable_psmi (attribute)
>>>    |    |-> engines_allowed (attribute)
>>>    |    |-> survivability_mode (attribute)
>>>    |
>>>    |-> (...) (and so on)
>>>
>>>The way I see it, we are defining each "device" as a config_group, but
>>
>>why would device0 (which in our case is actually defined by the bdf)
>>not be a config_group? the rough mapping is basically: each directory is
>>a config_group. In sysfs it's possible to create a group without it
>>being a dir, but it doesn't seem that is the case in configfs.
>
>By what I read in the documentation, both config_group and config_item
>are directories in configfs:
>
>  - a config_item is supposed to represent an object that contains
>    attributes, and each attribute would be a file inside the
>    config_item's directory;
>
>  - a config_group is supposed to contain multiple config_item
>    instances.
>
>>
>>xe/0000:03:00.0 is a config group created by
>>xe_config_make_device_group(), that is called when userspace calls mkdir(=
).
>>
>>And then we have the plain config_items inside it:
>>     |-> enable_psmi (attribute)
>>     |-> engines_allowed (attribute)
>>     |-> survivability_mode (attribute)
>
>By what I read in the documentation of configfs, those are *NOT*
>config_item instances, but rather attributes that belong to
>the config_item facet of xe/0000:03:00.0.
>
>>
>>Maybe the confusion is because there isn't a .make_item defined?
>>
>>>we are not using it to create child config_items; and we are using the
>>>group itself only as a config_item.
>>>
>>>I don't see much need for us to use config_group to represent the
>>>device, at least not today, since we don't create child config_items for
>>>it.
>>
>>not following. Maybe it's easier if you write a patch to refactor it as
>>you are saying would be  correct. From the docs:
>
>Yep... I could try something.

I was going to take a stab at this today, however I see that, with
commit c09a9933af08 ("drm/xe/pf: Add max_vfs configfs attribute to
control PF mode"), we are already adding yet another config sub-group
called "sriov".

I believe we are misusing the configfs API.  Here is the way I
understand configfs API from its documentation:

(A) A config item is a *directory*, which contains one or more
    attributes, which are represented as files in that directory.
(B) A config group is a special kind of directory that is meant to contain
    multiple config items of the same type (our "xe" subsystem is a
    valid example).
(C) It appears a config item was not designed to have a hierarchy of
    attributes.

So, I see two issues with our current implementation in Xe:

(1) We are defining <bdf> as a config group, but we don't
    implement child config items.  We are basically creating a config
    group, but only using it as a config item (i.e. adding attributes
    like enable_psmi, engines_allowed etc).

    Similarly, we are defining "sriov" as a subgroup, but then only to
    behave as a config item.

(2) Because of (1), (A) and (C), I think defining "sriov" as a subgroup
    is also some sort of misuse of the API.  I agree it would be nice to
    group attributes by topics, like we tried with "sriov", but,
    unfortunately, I don't think that's something really supported by
    configfs API today.

--
Gustavo Sousa

>
>By the way, I'm not saying that our implementation is really incorrect;
>it works.  I just think that we are defining devices as config_group
>without really using its features and that the config_item abstraction
>for them would suffice.
>
>--
>Gustavo Sousa
>
>>
>>        If the subsystem wants the child to be a group itself, the subsys=
tem
>>        provides ct_group_ops->make_group().  Everything else behaves the=
 same,
>>        using the group _init() functions on the group.
>>
>>That's what we are providing: a make_group that creates the bdf group
>>and has the items inside. Compare that to e.g. one that has the items in
>>their subsystem's root: kernel/crash_dump_dm_crypt.c. In that case we
>>have a make_item() defined and this is what we see in configfs:
>>
>>        # tree /sys/kernel/config/crash_dm_crypt_keys/
>>        /sys/kernel/config/crash_dm_crypt_keys/
>>        =E2=94=9C=E2=94=80=E2=94=80 count
>>        =E2=94=94=E2=94=80=E2=94=80 reuse
>>
>>Lucas De Marchi
>>
>>
>>>
>>>So, I believe defining the device as a config_item (which would contain
>>>the attributes) would be enough, no?
>>>
>>>--
>>>Gustavo Sousa
