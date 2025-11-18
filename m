Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41CBCEE33A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9945710E4F8;
	Tue, 18 Nov 2025 16:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LuRh4LZn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9717F10E4F7
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484587; x=1795020587;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cwNf7usyIU+EBzp7zXbFdF8f6GNwahwv3Tp3qsS5FtI=;
 b=LuRh4LZno9/z8iA7ICdIossJidLfxCn4iodDC97djatvo2eoDfBULHNi
 2Zx0E29MwHbfRImMIcDANmbBNIOa4C147XJi0HhQ/LiUxi7Q9+frr0BHC
 eTUfPo5vCZuXxFGZTui7q9L15Y0zv1DpbtZfP5lHn/KHvFWfaQ4MF4Aby
 q5llgQlxP7wlQrFH76OZa3mj5eaEDYNwxirb0P1c1k/ruYh8hLFFf1WKN
 j3FnAjPHO55P190H6DXXTadx0wgIv+U7EDMmb2zS/maTvnPAcZlzF5pkk
 ToVJ8BESOHKrMewMg/7x76azfF5bYDVLaWBZVkgquBosWYw9LorlKliAJ g==;
X-CSE-ConnectionGUID: W1VtUFidSWO/O1HQ//13bQ==
X-CSE-MsgGUID: QswCeue7QdSAxwJ4CHceZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65451733"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65451733"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:49:47 -0800
X-CSE-ConnectionGUID: 31PAgFvMRKyPe3DMhAXpwQ==
X-CSE-MsgGUID: BnrMVoGhRVC2scwet/Andg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195259297"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:49:48 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 08:49:46 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 08:49:46 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 08:49:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDGWc0F/e6OFCkEcChpvoyFBBX2iYIrohigq1sUZwisZ41hdHBz7bdGgbb3N6cXTEu4nuobTmv5OYHt/GJvEloi5ca3pu/Ea5gdrhoCjPj7ceQLstniHiB2QOKU1Q7LHY+XtfR7yhOV/qvHPM4UEzM7HfLIjVwAqb53Bvo1ue/WkBokaJaVP9jIK+l0eDehdDyFEbvTG2NPwBIHWX6FPtOJVlfvZn6XBmYImIldfRJxatc+KCItzhSLCyEIkukOcDLm7SkOtJ5FYf1h72E1QOeYuLe8fM2x2bcn/TyGPuXMGKp5mnNCdBxN6pB2twM7iPDJRqwDqa3yoHgXuySn8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwNf7usyIU+EBzp7zXbFdF8f6GNwahwv3Tp3qsS5FtI=;
 b=YijkB/KSMEO4VTFQjLSb6+XZk1ZsnKkh40tXhlpYw9BurtMTMxtVFjI9BXutmjNuLpkh13ks0IjAVyH9Hop1VqtrCjCWuDYGj0r6/mj19B8/uWN1T+2f3dD/ZbyB7CMIFBx4H/kWzVMHBuPIdvY6NLOGTy1FaQ3gQziXnQiymc4aiCskRoQeg+Vx4cpRQJdjAEwSqcZleW5CIAlsz7Fug7DPICDcyeyNdzPX/xX+7jDzLHPZPQG8kxl9i68Jk95yLSoa7iIcR55k6NttRt+ypF6ADoczVupfdA9hfq5MGOo/6mYwugISCtw3H2JCUCsf1nNdyN6iJQQPW5ddRvH5Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4443.namprd11.prod.outlook.com (2603:10b6:5:14d::27)
 by IA1PR11MB6121.namprd11.prod.outlook.com (2603:10b6:208:3ef::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Tue, 18 Nov
 2025 16:49:37 +0000
Received: from DM6PR11MB4443.namprd11.prod.outlook.com
 ([fe80::5c3a:d77c:85e6:b4f6]) by DM6PR11MB4443.namprd11.prod.outlook.com
 ([fe80::5c3a:d77c:85e6:b4f6%5]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 16:49:37 +0000
From: "Zuo, Alex" <alex.zuo@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Winiarski, Michal"
 <michal.winiarski@intel.com>
Subject: RE: [PATCH] drm/xe/xe_sriov_packet: Return int from pf_descriptor_init
Thread-Topic: [PATCH] drm/xe/xe_sriov_packet: Return int from
 pf_descriptor_init
Thread-Index: AQHcV/SueEPAoQ80F0uMhJcuKgVQvbT4ppEg
Date: Tue, 18 Nov 2025 16:49:37 +0000
Message-ID: <DM6PR11MB4443AF85C3644523DC39648291D6A@DM6PR11MB4443.namprd11.prod.outlook.com>
References: <20251117190114.69953-2-jonathan.cavitt@intel.com>
In-Reply-To: <20251117190114.69953-2-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4443:EE_|IA1PR11MB6121:EE_
x-ms-office365-filtering-correlation-id: 4705827c-4b1e-4d71-62c8-08de26c275e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?VGNtdmpjYzRub09SNkxkSGsyUWNhdHdnZ20vbTVMb2J3NFplbExmd1U0Sy9y?=
 =?utf-8?B?aG1PK1N3bnBhWUtORGowUkM5Q1Z1NXVWeVQ3L0NncCswaDAzZmQ3TEF6QU4r?=
 =?utf-8?B?cXhVTjRwZWhhTG9GeTY0bnI5WTFic1hFM1hGTHJRMHpuKzh5b0p4TzB2Z0Jk?=
 =?utf-8?B?NUo1MWRHZ2Q4TmtURWh3Z0NwZG1JTTBIL2NNREZCQ2hISzF3TDB1QXVsMnl6?=
 =?utf-8?B?RnhjQXNrcEZQOFFKNGtSczNudUp0Zk9WOTdxdXRMMW4zRFg5emFDRThLWmdS?=
 =?utf-8?B?RzhqYlNRc3MxMDQ4WVlSSDI1MUtaZG9KTGQ0TXhCMlYxT1A1YllSclZkUWF3?=
 =?utf-8?B?djJteGNIYTgrNVB3WFpFZVp6Vm1ab043cmwxMlZFNDJCaFpBVWdPR1lmRkwz?=
 =?utf-8?B?MThaUmdBMWpHYW9kdUpoL1M4UDUvbTBJYnErNjlUdm9pZjdsUjlsdTdobUla?=
 =?utf-8?B?UENyYisrTk1aeXdwNWhtdGRWS3lTRzZONHdwK1lPOFlyaDRYYmdHclVDMTJT?=
 =?utf-8?B?QlRTb3JzN2ZhazhFaUhFdWhuVnJzMTV3OEJJam1rclBweUd0RFdadFVVSU9r?=
 =?utf-8?B?M21DT2FDN2lQN0d5OHFNMVpMNXRKZTlwWXlPRUdDNjFPV1RBNVE3aTNsdlky?=
 =?utf-8?B?cHEyQTdPbHY2dEtIZ09HbzFuVXJreXFXZHVaenRMNkdGbFU4RE85U3VMN3lJ?=
 =?utf-8?B?Rk9tS09SS3czNWJqY1lwbnRSZ3AvcjFpQU9UTWVTOS9OMVMyWFRzMWFGUmI3?=
 =?utf-8?B?SDZlTkI4NXVIV09HUlRVU2RwRVZIQXlqa3ppRloycWxQT21yaXRVV3RhaTRE?=
 =?utf-8?B?Yk1ZSVVQQjlCbXVsRXlzZU4rMkc2Y0hXbzRMcy9UdzUvakYyMS9uRHZpeGRM?=
 =?utf-8?B?NVc4Z2tVTVkwamtRN05YMTZrQldFcmhZZUFFLzZwaE1tbnlTK0J2ZG44bHRP?=
 =?utf-8?B?eVNKYTVDYldoUzludmZBeHRHQ3dkNHVySGpXRVhreUFFTUNTb1pRLzVjRzlG?=
 =?utf-8?B?UXhKV2pzOWxpOWhQTGdnak90cFhPeVF3ZjY4MCtCT0pZeDlBT1pwdUxuVUI3?=
 =?utf-8?B?c3NsbW1nS1dvOFNLUnh4U2FGeEY1NG9jd2lIRng4LzZLdGJhbDY2MndPcWQz?=
 =?utf-8?B?ZUx5d01OT1ByMTN0SEd6dTRhR25zMmlpaUM2bFU4VDB2SGJReGdGbHRUM2l0?=
 =?utf-8?B?Z2R5b2hOTmhrVDVXZW4xbHVscmFjeXpUVG5nRExIc3NPZWZJaFdmT3VYdERB?=
 =?utf-8?B?MXF4aUhqOG5NbkVrcndiUmorajlNSUF1Q0dVUkd6WTFtalZaTUNYNFUrY1ZT?=
 =?utf-8?B?K2p6UFBwVXMyV3lKMFl1V1JFT0V5MWlSSEZxNEpiQ1huUTByQ0QvSnVyOFB5?=
 =?utf-8?B?RVEyWklsbm40bHZKODQxQkVxWml4OTJBd2dES0ttQTZYazRCUVIwMW10YUxQ?=
 =?utf-8?B?T29lTXVIblBEVVMrT0NBUmQrNmhLNUU0ZUhtaXc4WXRmN2lyekpRQXJGaFZP?=
 =?utf-8?B?Z2dQNkZmdFU1NDVrRmU2YS8yZkpiUUh4Q0Z3c3R3U0p4Q1BaRWxzcmtxTnZP?=
 =?utf-8?B?NmFkWkx6b3hkVHl5ZmYxYmdnV3p5UjV2dDYyS3g1cjgxQlRHTFlmNWpiMXFz?=
 =?utf-8?B?c0lhc0JJYlF0Z1J5cmZQRy9qd2JIZVo3MHN6N0paRG5YTlJQN3J3bW1KbjJV?=
 =?utf-8?B?UndnSHgycXhFaEpjRXdVOVFtaVNTRllKZVQvejJPNmlNcmk3MzdaelBKWkxQ?=
 =?utf-8?B?MGt1WkJ1RWlIcDdESEF6OFN4NDJEWHA4MFNpMDlyRjkrZ2R6N3JKTWxPbk5y?=
 =?utf-8?B?Mi94SUlZalBkNTR1Y05aSVZzOFVteVIzRDhUVTVFVC81QXlpOWJJSHBDMnkr?=
 =?utf-8?B?UDZDdzFVWEVKeExSK2k5NTJQL1BwLzB3UE9qdVpXQ2RHVmIvVVdYelFaOVhG?=
 =?utf-8?B?cHd6RUZvTmY0N0hTUWg0SHR3bzZiUzJoTkhGQW9sWVFQaC9jZTZ2dTFlV2N4?=
 =?utf-8?B?NTZ6cGxTKzdMaWxJUnlDWklmRUdRd2VXenZZYnY5ZzBwc0ZvWllHS2lPbW9K?=
 =?utf-8?Q?sqfx8y?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4443.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TitieVVJR2NIQnVNZ1daa0VsYklYUjlPckwxZmh6U3ZuM2QwbkhYd1kyOXY5?=
 =?utf-8?B?eWV5SmdTWmVkaXZ6ZjJtTkUrbE9reThHaVIyOU5rdnBIVERUTTNpS1lUQzFL?=
 =?utf-8?B?SkltYlgwdUF4UFg2blI5Q0JYK2RtZlp4YWZJWWVody9HYWloeU1JNTRsVWNQ?=
 =?utf-8?B?dzZEcm5pL0xGbXBoUEY3ek9SMlF6TlMzYVMzM0YyRWY4c2NOWVdhV3dESVNz?=
 =?utf-8?B?cHJsZzM5Qjc1MnZseDZLWW0xRzRWOFBTZnFsRVdvYnhxSFFpRFl2ZXZ6TEZK?=
 =?utf-8?B?REJlT0VKWEd3a3hUaEZrb2g5SC9pVVlUMWVFelBOTktlWWQvZDV0MS9QRGZt?=
 =?utf-8?B?OUduZHN2bnp3QVpFOWRPTnBDaTdlTjdZMW5qNGVxbGhYNTlOa3drbGk5MVRl?=
 =?utf-8?B?NFI3RjlCVG1BODA1T29kcTR6VlhJYUJLWGdBUjN6UEZEV05yenF3MkNTdW1p?=
 =?utf-8?B?azBXU2xxUiticGZaVkpqRXBzYzhpc0Zqcno3RkRyODBOZ0R4a0prVVJ6Qkdx?=
 =?utf-8?B?UDdHQnhUQ2xBazBqTEgvMVhlMlFOWSt6aHltaStYRzBIcDQyQVo2RVp2My93?=
 =?utf-8?B?M0R3VTdWV1hNQkk5MEJKeE1nTUVjcHo3ZDF4Nis1dkthSURQUy9GR3ZBVUJP?=
 =?utf-8?B?cHpoa0ZhZkNPVW1oTjQyRGl1ZHdHZ2JwWHhFRmdic2lCcDJhU1FWdkhBbWlW?=
 =?utf-8?B?eU9BbUY4dU1SeXluZVNBTkJjdXArakJ3WWFSTTIwN09YVnRZZnNXaFBrYjZm?=
 =?utf-8?B?Mit5WUV6U3pKZU85aHlvd3l5V1JsWENEcTM4cEVKT2lJdTBObEI3eUpralE5?=
 =?utf-8?B?dHQ4d0pwQmRvNFcvMzR3cExTZ3BhNFBxUis0Z3lGNmNTL0VUTE55V2Zyd1ZK?=
 =?utf-8?B?UjU0YmN2WDV4VmtOUVROcmZTZG5PdXRyM3FXaStNMmNvT1VCM1FhQ0RkL05p?=
 =?utf-8?B?OStHTmJLYWFncGRkVUR4Y2xseng0OTBJVWJWbTRWZy8zZDNnQXlnbzd5NE1Q?=
 =?utf-8?B?STdMUlBrMzgybnNvWmprYmlCSE1yTmVCVW5wOW4zbnhpVHFVcHBUTzlzemhS?=
 =?utf-8?B?Q2lnd2tESWFBL2llZnM5d3RuZjVaYVhzbEt4UzRieHYwQXE2SHJzT2ZBdktZ?=
 =?utf-8?B?V2hPUEpvWVR6aTJlOU1xZ1RFSUFXVDh2dUN0aDFFeXZ0VGFkNWMyTlNDM3Ru?=
 =?utf-8?B?VS9qcEpZc0lFbXZuWVRJMHBCdXFPSHl6dnVQUnRMaVcwRjk4OFlYaVllU1FH?=
 =?utf-8?B?ZmdQdk96RXpBdzBUZmJoL2hqb2pwajN0alRQTm1sUzJCeGw5UTBFRzA3bEZ0?=
 =?utf-8?B?NWc2YjV1WWdaam4wd3kvWkV6VVNocDAzbDN4Z1NDaldJeWt1eXhKV1QrT1RL?=
 =?utf-8?B?bmhTSmJ3L3NESnVTR2ZRUWkwYk9QNkgyWGdPMnV5Zy83KzEweW9menVLVUg2?=
 =?utf-8?B?K1Fhck9WWklwYzJXelk3em1xemZraGVncUQ0bmxwNFFFN0lMVzMrQVU4ZzYr?=
 =?utf-8?B?dVkyeWlZOUZkVXJ3S0oyUHNrK3pFWm04SUl2eEc3SHRLcXA4QWdSMGNub21P?=
 =?utf-8?B?VEtNMWM5aDZJQklUaXM5QnZVYjNnaUtFOTh2dXg3dmNlcW1rcEdBVzdweGZm?=
 =?utf-8?B?VGpYbm83RFgzdFJRZVVmSjcyOXhsazk4Ri9WNkxBNW1ReWFkVGpYcEgwa01a?=
 =?utf-8?B?V0EyNVZvYXNwek8zblpPVEhWZW9ndEZpVmNGTkJnV3h4eHBBb0JTSG9OOFhi?=
 =?utf-8?B?U0ZwdjcreGZEc1N2TUJnZGNuQlluSTBOWWRTY0Z4SklpNXBBcXdaRG5BaHZr?=
 =?utf-8?B?L29tSys0ZllhUG5jME1aZFpSSUVWQ1NqWG9DbThtUlNoZk8yTWRuOU55Wkcx?=
 =?utf-8?B?bnU2M0tTVDllM2NMSU0rcFFzSCtEUW9Odk5qR2tSVlhJNlQyRmZTUXM4Wis1?=
 =?utf-8?B?VzIzcHN1V3FjL3RsMUJCNjJlT09LNjMyZTliWE9sWU84TkVLUXdtSUN2RUI2?=
 =?utf-8?B?UzlhaHo4K3BnblcvcFRHMjdRZWtFbzlZSmVCbGpCcnVPMnlQUnNyaWUvOXZ4?=
 =?utf-8?B?anc5cHdLTEtMdVFsQjdya1l5aSswTUtQL3RWNElCalBPTEczeTV0T3VMT1VU?=
 =?utf-8?Q?C4jU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4705827c-4b1e-4d71-62c8-08de26c275e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 16:49:37.6580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8E3GecIvt2OBDOG32xGmwTJQbn6Bd5QyNGSkOzH1gk5ZjTqTmXcWJDfqUfFGWmetMxE3zWWofA3/L8KYLYGKTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6121
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

TEdUTSwNClJldmlld2VkLWJ5OiBBbGV4IFp1byA8YWxleC56dW9AaW50ZWwuY29tPg0KDQoNCg0K
SGF2ZSBhIGdvb2QgZGF5IQ0KLS0tQWxleA0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+IA0KU2VudDog
TW9uZGF5LCBOb3ZlbWJlciAxNywgMjAyNSAxMTowMSBBTQ0KVG86IGludGVsLXhlQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KQ2M6IEd1cHRhLCBzYXVyYWJoZyA8c2F1cmFiaGcuZ3VwdGFAaW50ZWwu
Y29tPjsgWnVvLCBBbGV4IDxhbGV4Lnp1b0BpbnRlbC5jb20+OyBDYXZpdHQsIEpvbmF0aGFuIDxq
b25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsgV2luaWFyc2tpLCBNaWNoYWwgPG1pY2hhbC53aW5p
YXJza2lAaW50ZWwuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0veGUveGVfc3Jpb3ZfcGFja2V0
OiBSZXR1cm4gaW50IGZyb20gcGZfZGVzY3JpcHRvcl9pbml0DQoNCnBmX2Rlc2NyaXB0b3JfaW5p
dCBjdXJyZW50bHkgcmV0dXJucyBhIHNpemVfdCwgd2hpY2ggaXMgYW4gdW5zaWduZWQgaW50ZWdl
ciBkYXRhIHR5cGUuICBUaGlzIGNvbmZsaWN0cyB3aXRoIGl0IHJldHVybmluZyBhIG5lZ2F0aXZl
IGVycm5vIHZhbHVlIG9uIGZhaWx1cmUuDQoNCk1ha2UgaXQgcmV0dXJuIGFuIGludCBpbnN0ZWFk
LiAgVGhpcyBtaXJyb3JzIGhvdyBwZl90cmFpbGVyX2luaXQgaXMgdXNlZCBsYXRlci4NCg0KU2ln
bmVkLW9mZi1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0K
Q2M6IE1pY2hhxYIgV2luaWFyc2tpIDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9zcmlvdl9wYWNrZXQuYyB8IDIgKy0NCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9zcmlvdl9wYWNrZXQuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9z
cmlvdl9wYWNrZXQuYw0KaW5kZXggYmFiOTk0Njk2ODk2Li4yY2VmZWZhZWQ5YmEgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3Jpb3ZfcGFja2V0LmMNCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9zcmlvdl9wYWNrZXQuYw0KQEAgLTM1OCw3ICszNTgsNyBAQCBzc2l6ZV90
IHhlX3NyaW92X3BhY2tldF93cml0ZV9zaW5nbGUoc3RydWN0IHhlX2RldmljZSAqeGUsIHVuc2ln
bmVkIGludCB2ZmlkLA0KIA0KICNkZWZpbmUgTUlHUkFUSU9OX0RFU0NSSVBUT1JfRFdPUkRTCShH
VUNfS0xWX0xFTl9NSU4gKyBNSUdSQVRJT05fS0xWX0RFVklDRV9ERVZJRF9MRU4gKyBcDQogCQkJ
CQkgR1VDX0tMVl9MRU5fTUlOICsgTUlHUkFUSU9OX0tMVl9ERVZJQ0VfUkVWSURfTEVOKSAtc3Rh
dGljIHNpemVfdCBwZl9kZXNjcmlwdG9yX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUsIHVuc2ln
bmVkIGludCB2ZmlkKQ0KK3N0YXRpYyBpbnQgcGZfZGVzY3JpcHRvcl9pbml0KHN0cnVjdCB4ZV9k
ZXZpY2UgKnhlLCB1bnNpZ25lZCBpbnQgdmZpZCkNCiB7DQogCXN0cnVjdCB4ZV9zcmlvdl9wYWNr
ZXQgKipkZXNjID0gcGZfcGlja19kZXNjcmlwdG9yKHhlLCB2ZmlkKTsNCiAJc3RydWN0IHhlX3Ny
aW92X3BhY2tldCAqZGF0YTsNCi0tDQoyLjQzLjANCg0K
