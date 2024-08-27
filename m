Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1926C5473F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 23:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA1A10E11A;
	Tue, 27 Aug 2024 23:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlS7zVOK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B070010E11A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 23:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724800539; x=1756336539;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=vXmCr8aiAFwtQURwh1r50k+qhEgLS/vlmRvWJhgm52U=;
 b=TlS7zVOKgatBUWPcfoShZfTZSeYWKeecQUDX4LUe6Bk7H7Xsa1wHo1Tf
 NDCBsWd/fxE/3dzkO/Y+owlHjjPfiTrTSQqEcfLb7kuH/WpSeEHUO1f+H
 kePIw5JQAxv5bZBh5PFEHiYTfie1h7vRkzCc17z/v5GzRbtMvDUGI/5lo
 VMoeJiVJgl+K2/Zeuh/IhpFHR6nS0Na/1UtuHwGncyFXXevDoTdXHRZ9v
 e8gxtef2hfj+SNSba0BSDrV5bYoYhh6+J2Oo1xlsS/wpKGOL8Ap7UnPyy
 DIEy/cKg1WC/7UJFWZhL0jE9jvWYoIk38AYqMCGnZUhWcKvlC7I1/yiJ5 w==;
X-CSE-ConnectionGUID: vYnUnNeNSOecI8JtF57DIA==
X-CSE-MsgGUID: pLVMsVmIQhaFM70WAZuomQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23111950"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="23111950"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 16:15:39 -0700
X-CSE-ConnectionGUID: pWolbWhLRk6bgOztpIiO4w==
X-CSE-MsgGUID: 3nY+qH5oS8a1/sKgh6/vRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="63070634"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 16:15:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 16:15:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 16:15:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 16:15:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=II0fjyvbI1iF9V5pGLjPAl1e4almbosHRFxF26z5n8vsCMtjuTdzy20tTRwL4ibOwgafaeMM4RqNNiCQjpCjhk5u3Z3ouX/Imo6qjcCTfICW4uUbCi+jdv40ApUUVjL+V489ijEBsXtl5X9nO7iTfG+LIm5PN6AOkOr0h+ouaw0pMYBE/pyfDz2VfHzYUglSMmBtN61SDFF5dTR2dbPQOUWC/fIewGBoXm+/jPdrQ+ghoOxeaN6LClseXx/XBm1GBbk5FinhSvk5z/YUfnjjWUxhFV8UQjkBDldS1a2uQMKYFUleturOgzew1e/cdATVXFhzVJxRCB/0chhLb5Tu6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXmCr8aiAFwtQURwh1r50k+qhEgLS/vlmRvWJhgm52U=;
 b=co4zfl6fZAYIPbUwEUTw4ZJni/oopcJDO0Ti9goquHbeJkhGC7383OesAyYOEJtd/NLyzjeZF0T6xjw3Y99vkxCXZSVUn1jWVOs1eiL+qa768Fm8/oeEIOBpzbvJu24/uqfLP0/+0fRVufN3hKEk7FUkyaA3TAyKyQpNC84cWfyOr483JaQN9Fr13Cy87YQHxQE+ddLgFV/cUG4PCOJZdXbHpdTt4/y4BLKvgGE9hNG3nJoQSx//ZmBOd7P5CsSD6+wVzvqr4UUxc/hgV0a+uy2HkqbDMMZLeShnepzK6J1U8gRhT0FbggQriGlQ6/QpfAw2osTri6v67saeOtEcsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 23:15:34 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%4]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 23:15:34 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v17 6/7] drm/xe/guc: Add dss conversion from
 group/instance ID
Thread-Topic: [PATCH v17 6/7] drm/xe/guc: Add dss conversion from
 group/instance ID
Thread-Index: AQHa+MrAheIZYiYNmU2g7mxeKI1fWbI7vHKA
Date: Tue, 27 Aug 2024 23:15:34 +0000
Message-ID: <8cfc5d2bd355b715d08a68b2e3ffb309ee98ee35.camel@intel.com>
References: <20240827214726.1183935-1-zhanjun.dong@intel.com>
 <20240827214726.1183935-7-zhanjun.dong@intel.com>
In-Reply-To: <20240827214726.1183935-7-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH8PR11MB6706:EE_
x-ms-office365-filtering-correlation-id: ee80519e-edea-46da-d43b-08dcc6ee2784
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aEVBM3FKSytUTUNNMVIveE5OYjBzZkJTV0xPMFlJWGNVQzhNc0JrdDMwZnpa?=
 =?utf-8?B?YVd0bTBRd25GazNHYjk5bHN4RERueWtHWnBKcEkzRTd2SXFyTVJZRkxTZkk5?=
 =?utf-8?B?dmJ1VEozdmFJUW9hQTVyR2dZcElEb0pITXh4TVo4SUdiTmxLS0phM1lFK0xq?=
 =?utf-8?B?U3NOVlpERTlzQWdVSFNPdFNzWCs3RkxRNE5QT0N6OGlucmZvM0hKLzlEMGNM?=
 =?utf-8?B?cVAvSEpva3EvYmQrM0lHczAvQ0hBdzlrbHFmWVREc1oyU01SMExReWtjSlY2?=
 =?utf-8?B?NlpBSTloQmpMSGxsbjhzaG9ORzBmUjFXM3VRMVBjKy95R3VqNlk5bHlzNXhU?=
 =?utf-8?B?VUI5MkZhV2NDK0szYUNORlZQN2Z0QnhzZ2s5ZlJEVDlpbS9OTnhBMm5rUDho?=
 =?utf-8?B?d00xcTExampQVkZmVzRwVE84c2RBSWJMOU9EMzNUbkVIUlVTWHdHNlZ4RDBr?=
 =?utf-8?B?UzI3M29Hc1J2cTdGN3JTcDYrMEFMTVVQSkFvVC9pbVFQa0ZQUTR3YXZhRHBm?=
 =?utf-8?B?M1lNajVZeG52VldNQ2tEV0lSeThRK3p4aTBOZHhVM3BZblBweitybFg0ZUhE?=
 =?utf-8?B?Vm4xalcwME1vcmQvRGdkM1hGVzZyN3lneXdiLzlxSlIwRnJCUzl2YUVwZ0py?=
 =?utf-8?B?QUQrSW82THpxUUN5V2E3bVFtRXZNMTF1UWZoM2ZqN1dlSUFBNmVITnY4TjVV?=
 =?utf-8?B?OG0zZU0zRklCU21qV3A3VE1tdHR3YlN4OERPMHRTbGJwM0U2alNzYldOZWQ0?=
 =?utf-8?B?UjhETnF4bnBEcUk1dGNiSG1HaEsyZkx2QVd2bTFjTStlTHowZTJVS1VTMTJR?=
 =?utf-8?B?cHNvbGxVVXYvM2JnWkZmc1pBdGRTVXJZQVJ5ak9ieUtZR3JRU2tqbzJUTU9a?=
 =?utf-8?B?SnFJblZhV1BKNytneTZqbzhPRC9yR0FWSEtLOW9HVExWaEdJQ3R2YWEzMHV4?=
 =?utf-8?B?dkVlWTRzei9iQTRWZm54WnJ4bEc5WEJLWENtN2ZEeHh0ZkJrek8reWxDaVB0?=
 =?utf-8?B?d2J6aXN0dklzK1dtemFaeWpvT2puWFVIM2h4WDd3ZjVpR2FVNUtoRXVMaktF?=
 =?utf-8?B?RUJQSGxhRHRnejRQSXZOZ0hHOUkxT1hpWXZtZ3V4S3R1T0RNTWIzUlVaUy9L?=
 =?utf-8?B?Rmc2R2dKeXZHczJlSlBVL1pZTWs4T3hMMlNVZXpFZ0lIam9LNUh4cmFZN25q?=
 =?utf-8?B?UURXa201UzBNL3ExdzFPSHJiK05UL1o0WkhvVGZRcVdCaEIyTHd5MnBqQjM3?=
 =?utf-8?B?eHNKdzVDOGEyRmhJcGdja1lUQU4vWHRRSEs2N0l4L2RENUZTcXBrRjJIZ0xU?=
 =?utf-8?B?b2ZVZXppVzFmNW9KNG5sTWoxc0tiaFB4eTVkRFNET2VNNlhUNXd4ay9HUlB2?=
 =?utf-8?B?S0tZMVZITEZhVTJwWGhMaU1tVE1PcTNvMkVrbXZ3a0dYSXBDa2g3b0lES3ND?=
 =?utf-8?B?bXFpZldCKzVuZ2p3cjdTcWNycjFKMjhjZlRnT1FUa2pSK0kxK215OWdOYlhJ?=
 =?utf-8?B?UENhenlPSkpNb0lFNUkxcDFqbHQzblRmVmo2Z244RllQSDA3WU14SjlOUmI2?=
 =?utf-8?B?cTc4RGlsdkNFK1NvdVNVYUlsWUorODEzdTZvbWIrV3BYcEUxcDBSdE5QaFhF?=
 =?utf-8?B?T0tISjFXMEpXN3ZmcmgxME1wWUZBVDBmenpGanFUU0QvdDFHdjZBNGpFNGFU?=
 =?utf-8?B?dFJyM3hUVEQ2clFCd25UblVrSnFpS3VEUnUxcjU5NFJYWDRXUU42dXJtVUw3?=
 =?utf-8?B?L2djWGJ5TmpPUlBoYzZ4U2wzd0tERXJ3dnNqWWRpM3NXQTI1SjhlRjhjcUpW?=
 =?utf-8?B?YVBNQnhXM1M5R1NCSUorazd4RXNTWFFVT3pNZGZrNGJKbmZmeFFQc1NxV0lx?=
 =?utf-8?B?aE1NOUg3ZDU5ZVJMMVhlVElvajQvQ3pCVFlvL0dzdmNWa1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVpFdlhGWTBqanM2WFNOQS8vVTY5U3BFOHB1ZDA0VFY5b004bWtjYUxCbENm?=
 =?utf-8?B?YW9SS21tZnU3TVNqalRoeUNiUjRsTGZMR05GbnpZT2dmM3NOVUQzN0F2Mlo4?=
 =?utf-8?B?cXU5bEtHWnlFVlBtenJFc3VFdjNJb3ZBeDJhQ3NpcXE3dEJscituTVUzV0Fh?=
 =?utf-8?B?SkNRUHhuRVhsM0xmY1U3WVNndEpzaittNHUrMWdiRi96R2loS1RDVWF4Vk9p?=
 =?utf-8?B?ZTRnV0N1dWlmUjJ3Q0RBb3ZQb1Y4bnVYaXphU2lCbWFyOS9Ha3l1QmhjbVpE?=
 =?utf-8?B?UEZtaDEveGpoYVk4b0FTbnU5LzVoV3V0bkJQVmU2UnlhaGNMWlVRbDltTDFR?=
 =?utf-8?B?eWNBVUNlbmVkZnNhNWV2WUtjVWt0Zi9Id1RXRXRxZzVYa2hKY01TdTJ3ZHhF?=
 =?utf-8?B?M1lJZWZmTHlNRW9MOXJxUVBrN2xiZkN0dU9qNWdnaHNTTEo0OVdLenQzQmpw?=
 =?utf-8?B?bDZ4Y3d2YWtOaWZ6cm0rZTNlQWNzS3JYa3EyVmJmSlhUdkdEY1cvWnZYZm5y?=
 =?utf-8?B?UTAyYlBZQW5JSEI5NnpQMnlNdVZTYWpnWC9JRDZvYXVTcVBINlVWbDRIZGU3?=
 =?utf-8?B?cmMvb1FKR1BHWEdwS2hDTTg0T2hwSWNqY3RDdEhmeUFWaEJTdzRxZ0wzd2t5?=
 =?utf-8?B?RkpGc2FtSWpJT0xwRmtaN3JBaC94WU1aVm5zUHhBdXl2NFVaWVNPMTEzbzhY?=
 =?utf-8?B?cGJGZ2dldkZta2orQUgyTmdtV01naFRuSkcrWGVEWWFPQWZUa2pSVFhUZzBr?=
 =?utf-8?B?MGhDUjhKTGU5dkhjMGlmRDdaSDMvY29zVDhBSlI5V3IyMTU3dkhvY0EwMEtM?=
 =?utf-8?B?SXBMbU5zS0NuaG43aTZVbnNJQ3pOWVR6NzlYZExFUEk4dWRHYm1Ia0tqUjlQ?=
 =?utf-8?B?NXZiQW9BSnhTUjhSdjJ1dDlsd0MyM2dGd2hwb1A5U2MzM1NYa2lEWWFZc2ZH?=
 =?utf-8?B?T0NEZ1kvSG5WWGxZOStUY1pyK2UwcWREazJZaHBxYlZJdVpxWDNJY0svbGpB?=
 =?utf-8?B?bmZpb2trMXZka2hRMlcveE5Ub1diODBwU0xGcHlweS9TTGhEa0xCQ1VDclp3?=
 =?utf-8?B?THpVNE9GVHBFVGpiVHRWanpmd3UycE8waERTRnVVTEtUOEt3VzdDWE1iWDhQ?=
 =?utf-8?B?a1hERnBLRHJvaS94NGhmWnRidXp4eHRvZ0k2LzJiRU1xSmxyWHhoR3dBVzIv?=
 =?utf-8?B?dG1RNFBGak14S1ZFM1MrRmtXZFVCdmdZZ2tCQVNSTmdydlJ3Qk85OW9xUFl3?=
 =?utf-8?B?UjQwRXFCMkFqdzhHbHUzRDZuZE1PUXlMdXhRWCtDNTdtY2V3R1RGRFBlUE1T?=
 =?utf-8?B?MEtSSlorZ3JudkVvN2dlRVBOdVVIMUI5VVorVjB4OVpDYkh3dFA1NXUvTFda?=
 =?utf-8?B?OFl2Z3dYTnhSY2NDVktXZlp5ellkb09LWTcyUFJyWFpnUGhreUlLS1kwSlZt?=
 =?utf-8?B?aHNpZVB0dlEwNVF0UzZTTldpZDJTcFVWTGJEdHRuTlM0SnNkS1lsZHU4cTR2?=
 =?utf-8?B?VEl4NEdDUitBOVZlMGJjcFRIbldRbW0xUVBlRjg2SVYxSTBFRHFSNFlqTlpH?=
 =?utf-8?B?MWl1NkF6RGtLWjM0RFQxSlJFYnFLdUJZNUlEUm1BamF6a2tPL0s2NmdrMXJ0?=
 =?utf-8?B?K0p6eEpwNTFLL1o4UnRydkRhUU94b3JMdWtoQVpyUTVMdUZpZVlsQWpGQTI3?=
 =?utf-8?B?SGtYTnp2S3N3YWJVT0dDeU1kM3JLQmZKRW51amdQT3pGc0NIbVNUMkNNYUtH?=
 =?utf-8?B?TlNlWmNubVptYXlEaFpLN0FhMjlIeTBpcEhhK1daUmdyQWhwTHYwMFhlc1BZ?=
 =?utf-8?B?TWQ4QVQ0RTNiY1Z6bmlDWTI4dXg0QXJhV051bUk5UzZ2Q0NtRlZNZFpqK2Iw?=
 =?utf-8?B?WW1Ld3dQOFBqTHFVeUxVMHFTUWZWaW4xMUxuMW10Nm4rNk5nWE9CZWllS3Fk?=
 =?utf-8?B?cUVYbGV5ZFYrMmNZTElZb3ZoNjVBbnB1b3lBSGlpT05QbThyT250a2NqekVX?=
 =?utf-8?B?THduMVloY1Q0WmpicjRhOHFtcm84dkRSbEdKVnVIYTlsb05RckZ3S21HdEt2?=
 =?utf-8?B?bnRYS3lkMVFFNzkvYlUwZW1nVGpwYnVBQmRFRlZLV3hZQWtGTVRLaENBNEhM?=
 =?utf-8?B?WUkzVmtVdmJEYjhlWnBSbWE2QlZPbE4vRmNEK2ltLzE0U0tWT2UvVGxrNTZB?=
 =?utf-8?Q?qs9+WQLm15j6sPaFmCHtjwE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48E1836B246DC04DADA5C6FAEC3682EF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee80519e-edea-46da-d43b-08dcc6ee2784
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 23:15:34.6843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d0vXF9pvnb6mYddyo1vyh3qntSg25xNb2StMVJb56e1L5ZgNl+Cx2MU+xKe5XYBtKhBl9MWu43l0u5L8dhjXiK7o6IoqJx7swZwXIdZ7oC0UgFl2qvCcNrAVBgkiW7Zt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
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

TG9va3MgZ29vZCB0byBtZSAtIGFsdGhvdWdoLCBhbmQgSSdsbCBjYWxsIHRoaXMgYSBuaXQ6DQpq
dXN0IGxpa2UgdGhlIHBhdGNoICM1LCB0aGlzIHBhdGNoIGFsc28gYXBwZWFycyBhcyBhbiBvcnBo
YW4NCndpdGggbm8gY2FsbGVyL3VzZXIuIFNvIHBlcmhhcHMgd2UgY2FuIGVpdGhlciBzcXVhc2gg
dGhpcyBpbnRvDQpwYXRjaC03IGFzIHBhcnQgb2YgYSByZXYxOCwgaWYgd2UgbmVlZCBhIHJldjE4
Li4uIE9SIC4uLg0Kd2hlbiBpdHMgdGltZSB0byBtZXJnZSwgd2UgY2FuIGFzayB0aGUgY29tbWl0
dGVyIHRvIGhlbHANCnNxdWFzaCBwYXRjaCA1LCA2IGFuZCA3IHRvZ2V0aGVyOg0KDQpSZXZpZXdl
ZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQoN
Ck9uIFR1ZSwgMjAyNC0wOC0yNyBhdCAxNDo0NyAtMDcwMCwgWmhhbmp1biBEb25nIHdyb3RlOg0K
PiBBZGQgZHNzIGNvbnZlcnNpb24gZnJvbSBncm91cC9pbnN0YW5jZSBJRC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFpoYW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4gUmV2aWV3
ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0K
PiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfbWNyLmMgfCAxMyArKysrKysrKysr
KysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5oIHzCoCAxICsNCj4gwqAyIGZp
bGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3RfbWNyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfbWNy
LmMNCj4gaW5kZXggN2Q3YmQwYmU2MjMzLi41ZGVlZjdlZTc5MjUgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3RfbWNyLmMNCj4gQEAgLTM1Miw2ICszNTIsMTkgQEAgdm9pZCB4ZV9ndF9tY3JfZ2V0X2Rz
c19zdGVlcmluZyhzdHJ1Y3QgeGVfZ3QNCj4gKmd0LCB1bnNpZ25lZCBpbnQgZHNzLCB1MTYgKmdy
b3VwLA0KPiDCoMKgwqDCoMKgwqDCoMKgKmluc3RhbmNlID0gZHNzICUgZ3QtPnN0ZWVyaW5nX2Rz
c19wZXJfZ3JwOw0KPiDCoH0NCj4gwqANCj4gKy8qKg0KPiArICogeGVfZ3RfbWNyX3N0ZWVyaW5n
X2luZm9fdG9fZHNzX2lkIC0gR2V0IERTUyBJRCBmcm9tDQo+IGdyb3VwL2luc3RhbmNlIHN0ZWVy
aW5nDQo+ICsgKiBAZ3Q6IEdUIHN0cnVjdHVyZQ0KPiArICogQGdyb3VwOiBzdGVlcmluZyBncm91
cCBJRA0KPiArICogQGluc3RhbmNlOiBzdGVlcmluZyBpbnN0YW5jZSBJRA0KPiArICoNCj4gKyAq
IFJldHVybjogdGhlIGNvdmVydGVkIERTUyBpZC4NCj4gKyAqLw0KPiArdTMyIHhlX2d0X21jcl9z
dGVlcmluZ19pbmZvX3RvX2Rzc19pZChzdHJ1Y3QgeGVfZ3QgKmd0LCB1MTYgZ3JvdXAsDQo+IHUx
NiBpbnN0YW5jZSkNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIGdyb3VwICogZHNzX3Bl
cl9ncm91cChndCkgKyBpbnN0YW5jZTsNCj4gK30NCj4gKw0KPiDCoHN0YXRpYyB2b2lkIGluaXRf
c3RlZXJpbmdfZHNzKHN0cnVjdCB4ZV9ndCAqZ3QpDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDCoMKg
Z3QtPnN0ZWVyaW5nX2Rzc19wZXJfZ3JwID0gZHNzX3Blcl9ncm91cChndCk7DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfbWNyLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3RfbWNyLmgNCj4gaW5kZXggOGQxMTlhMGQ1NDkzLi5jMGNkMzYwMjFjMjQgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuaA0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3RfbWNyLmgNCj4gQEAgLTI4LDYgKzI4LDcgQEAgdm9pZCB4ZV9ndF9t
Y3JfbXVsdGljYXN0X3dyaXRlKHN0cnVjdCB4ZV9ndCAqZ3QsDQo+IHN0cnVjdCB4ZV9yZWdfbWNy
IG1jcl9yZWcsDQo+IMKgDQo+IMKgdm9pZCB4ZV9ndF9tY3Jfc3RlZXJpbmdfZHVtcChzdHJ1Y3Qg
eGVfZ3QgKmd0LCBzdHJ1Y3QgZHJtX3ByaW50ZXINCj4gKnApOw0KPiDCoHZvaWQgeGVfZ3RfbWNy
X2dldF9kc3Nfc3RlZXJpbmcoc3RydWN0IHhlX2d0ICpndCwgdW5zaWduZWQgaW50IGRzcywNCj4g
dTE2ICpncm91cCwgdTE2ICppbnN0YW5jZSk7DQo+ICt1MzIgeGVfZ3RfbWNyX3N0ZWVyaW5nX2lu
Zm9fdG9fZHNzX2lkKHN0cnVjdCB4ZV9ndCAqZ3QsIHUxNiBncm91cCwNCj4gdTE2IGluc3RhbmNl
KTsNCj4gwqANCj4gwqAvKg0KPiDCoCAqIExvb3Agb3ZlciBlYWNoIERTUyBhbmQgZGV0ZXJtaW5l
IHRoZSBncm91cCBhbmQgaW5zdGFuY2UgSURzIHRoYXQNCg0K
