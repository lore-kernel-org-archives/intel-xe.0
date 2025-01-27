Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7FFC02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 17:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16ADB10E213;
	Mon, 27 Jan 2025 17:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMa2wVbr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A27510E213
 for <Intel-Xe@lists.freedesktop.org>; Mon, 27 Jan 2025 17:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737997982; x=1769533982;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=BvWUaAwMxtCI0vBTeW5M3fevu4SavX3t8iqKz8Pjr98=;
 b=PMa2wVbrLyZkYsCupCMFX5yH+Lp+mD/JsNkmx+RennDHV6CMnk5cXlHr
 rU0OsIwWawKdWzlDP85xuHpJExqs0uTUCiF1d67l3BytLm4tBbWK84JeO
 9zSfVSDL3r0X16jR8aR53bwnITv7Fv047jjpQ/QWH0CSiLi7YMzXRn8gV
 iNfScuXfLRAyAidegI7if0NhoKLBxA+rC8K9XUNjoDHVJsTfydSYfXQ1i
 R6pb/lHiUaCevVfwb6fI/vWyCa8O1sk/xGWSyum16l3ILLqZQetspWuuD
 wLx5+gdhc74jxH1t/2s0RbBntWX9k3tA+bHJxwqk4BJnFLzfDbNZucJE5 Q==;
X-CSE-ConnectionGUID: hF9b7793QQOmi3i71hPIMA==
X-CSE-MsgGUID: izmgFRoFS4+liYXp1Yyv6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49455538"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="49455538"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 09:12:48 -0800
X-CSE-ConnectionGUID: tkLjadFIQza5vFdFXZ0giw==
X-CSE-MsgGUID: XMvFrVgBQ7un+usrrij3Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="131785406"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 09:12:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 09:12:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 09:12:39 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 09:12:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5Sj1OdJyMb8BKArAnc57AgJIvw9TysaHHv9EnT6OTBDeiGs6lTej0SGzlehv343bz8Y/UGY/knNra8U47WMdTmNQ/4y7AcRDcjEhjnZrtyYT5sKWw2eTUQ1EsvLf64TFaoeRZjGcrmnPqZLjBOinB8CIuGIxFKJOuIrYnnDMQz7MlmcJe5SyKa74rH5kTG0A+cQemGVw62gBn/gmqOnqYi1UO8w7A0a9c3ozeMjcP+RNMq/+lKqzU+Z7iUU4o2qMx9vp6qUXg6VvrICJjDPTQygTFVoSB9FPTYX8yFf1y1FNMTLW8jjAeSy7XCUfYONt/ZMz5EO3wHZ+hyvnBNAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvWUaAwMxtCI0vBTeW5M3fevu4SavX3t8iqKz8Pjr98=;
 b=pstssq0Q0FCN+GGsSaFRMllWIE/qfAwWjGhx23yt5Ppjpn5hTFsbYvYa7FOkgw0MvsQD02Q25ydJq1KoQGGF+znG+U7vWVNn/suJvgkTD2V0p1NoR/HkToy4lRufhvJjzsiieANkicXIKjdQhTv4xyJzM6vElvS+fF0dnTh+7YGDcZLSsQZpqP5tzsNAZjBjgi/6iGo5O9py53VFuLYNS7tJOHyfQLgaaBPfYNtnt1CI13k0Q17zncfKJMhQMuHgtKF71drHGB3YozvPGrs82p1MsVuWzv8At+AgJrvn38jkaAMr0WhPt+QbNZmx8SDeHI7pEMNu3hHxkEmdE++J7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CY5PR11MB6485.namprd11.prod.outlook.com (2603:10b6:930:33::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.20; Mon, 27 Jan 2025 17:12:36 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 17:12:36 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>,
 "Harrison, John C" <john.c.harrison@intel.com>
Subject: Re: [PATCH] drm/xe: Upgrade complaint about missing slice info
Thread-Topic: [PATCH] drm/xe: Upgrade complaint about missing slice info
Thread-Index: AQHbaUOAThFW33IpiUCUbCwuj2+QhrMhhRgAgAAYnwCACU0TgA==
Date: Mon, 27 Jan 2025 17:12:36 +0000
Message-ID: <ec58ec6d9a01d0d993ab7d70c43198f56c3bdc31.camel@intel.com>
References: <20250118005403.2960807-1-John.C.Harrison@Intel.com>
 <02d1075214e3ba35645686c1cb479dd5c74b5571.camel@intel.com>
 <24263415-c44d-47d5-bb92-d3fbc0aa356e@intel.com>
In-Reply-To: <24263415-c44d-47d5-bb92-d3fbc0aa356e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CY5PR11MB6485:EE_
x-ms-office365-filtering-correlation-id: 96e95f04-1bf6-4675-470e-08dd3ef5cbe9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bStNQ2RlbFJ1b2NWbXFCQnhtV2FBdktGMTNJdnF6c0lEY3JocXBDb3VBQmha?=
 =?utf-8?B?K1lic05BOE41bmhhU1FLdEtYNHV4U1hCekYrdTVUa1dhZFFCV052OHB3c2tO?=
 =?utf-8?B?cndoTzJObG5weTBMTDJoMDdLY2s0UWNQc2dtK3FBdU1TMEJkbXVFZ3BiYkJ4?=
 =?utf-8?B?alhHQnErVFpvZVZRMDN2bzBXVXVOdEplc1BvblVjeEJ3OWowSmpENGRod3F4?=
 =?utf-8?B?V1BCeEdWbGJzcjZNYy9pWWdhbzVuMjFHYmpXbUNnK3pPMG1MK1VjbHIwSEFr?=
 =?utf-8?B?ZUxrSThqS2tTdzBEb2phTmhJeXBXTjIySjFXeFRsREhNZDNWbGxYMThpWVVw?=
 =?utf-8?B?RzhVWTBpK1NpY3ozL3VKTHNtOWlTcmJSTXFBYWpPTWN3Yzl6WmpIazNISzhq?=
 =?utf-8?B?aU4rWDhxNzkzMVFZTFFKUFM4ZVlYRHZxUE5LMTEzNFg3QjVRQnYvQzN3ZlJ6?=
 =?utf-8?B?WEhkencwSG5VejJNcnhXaXpqb2hJRWc5RlBCdW4xVDdhcHZobkhPQnlWalhD?=
 =?utf-8?B?YWRFOXMxK1RJMEhtM3JSZnJSSmZEaGd2dktxZ1NjUGJSUzZvbDY3Q3Zybm9r?=
 =?utf-8?B?SXYzbjBZSzFjN0ZXbHR5UG1NMXBNRUt2azY3eFFWcm1KQ2dqVDR5MXVmYkxZ?=
 =?utf-8?B?a1JQKzZtRUxiNG51T2o5blBURW5PNXM2R1o5bUthRnlCckIrR1NSMS93OU1E?=
 =?utf-8?B?c21Ic2RKaE5wNW9iL0RZTSt0YmpJT3Nxb3lLVTkySEFIaW9tWVgvTTRxTzFE?=
 =?utf-8?B?TVh0cHFEeUxEM1FNUGUzdnVkOTFwaXIycW9Zc2kyNGNvZjNKcHQvcjI4TGpo?=
 =?utf-8?B?eXN4NU5VZFB1RGdjOVZ2bEZVMFRBQXBjLzNJZVl4cWEvVXBXWnZxNFdBc0tC?=
 =?utf-8?B?SUZ2TWJqZ2g5ZVhhNlpIVWtyRXBPbUpMZmRWdXZVbmVYeDRYQVdFQXFsMVF0?=
 =?utf-8?B?c1dvUkswQU4yV09hd3Z0bkZDNGw3a1dEZGVhQkgwOWk0cWovUzVIM2xkYmo1?=
 =?utf-8?B?THkxMXVoOGlTbFJMOG84T3ZGN0hqRlNyTUpkdkJpdDZkS0dCbjFvZlgwR0Qx?=
 =?utf-8?B?MGtRNGNiSGZXb0syL0Q3cGFCeHQyZG9jcGZ5bk1GM2tJVEc4Mzk0OHU2VzAw?=
 =?utf-8?B?V0taZkNKTnBJbnc2a2FYSDJYckx4WVBJaXpWTUovN2dBY1VwTCtuVGFTL2FF?=
 =?utf-8?B?eUcxdTBoVS9hY05HU2p5SmkwWHhRRmdpZ2hLb1h0YndjVXdLSll2V2tpSE0z?=
 =?utf-8?B?cEhZOHhqL0JlZVZwK3EwZlU3anlYWjBGbzBsYjZicnJwQTZzSjBoaUkyVHlz?=
 =?utf-8?B?azZ2eEpXQk45TGdOK0k5V2dZSEo0VzVPbXhWUUZJQ0ZkMGRjQ2pnSHMyUWFk?=
 =?utf-8?B?M1BPTGJTSGw1WHRQSmNNUnA1cExFdEZ4ajM5OS95ZG9ORzBFcVVPVzRaWFRJ?=
 =?utf-8?B?dCtNODZJYlpjOVpuY0p2aWFpa2krMjdTdzZ5WkREc1VTVy8zcGIxUC9VRktv?=
 =?utf-8?B?VjYzM3RXc2ZVSDJOVHBncUZLM0dxUFdDdzRxTmNYS01KNHNTTmNPSmVmTU15?=
 =?utf-8?B?bzZjdk53NXhRUE5qRWNqNUFac0tOV3NzRmFIRGZBL1NPWXpVK1BXbkJocnE2?=
 =?utf-8?B?RTZPaWw4Mkd5MHlmcEdQVmIvTFg2Y3RKdEZUU3h1WEdXcFNoSWErUkVURWx1?=
 =?utf-8?B?VWVPQ1RpcHlhZ3FtR0hPNW5SK25IdjM5K2ZSUk0yNWl3c3pUMjRGaElYbTYv?=
 =?utf-8?B?biticjdEQWtrUXVpdXdJck5aSms3T2V5ZVlpMS8yVUxaNk1TeklOTzNSdjgz?=
 =?utf-8?B?c1llWFZNSkZ2c1JRMnFXbnpqRXZNY0Z0dkd5VEpmWDd0WG1sVEFjWEdnNWhQ?=
 =?utf-8?B?Wm5mRFJIQjQ2bndrRXh5aE4zRmNRdFZ4L1o1NXM1SHcrS0R5TUI1c0VwVGV3?=
 =?utf-8?Q?csjCI/Y4LsJHehGwGkx/yoxg73pPy28L?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rm1TOFhXYllzZitPampZbTNKb3N1c0xHeVhSUjNTTlJrd1ZndDNCQW9lWDRH?=
 =?utf-8?B?UE1RSHlSR3BQeEdCSVdNZVhUNElsZjBrQWxITFBvWnZUU1ZqU2dwMTBqR0Nv?=
 =?utf-8?B?RTJyYmEvMmR1NFNZYW1OTlZnSEUyOUpsQ1dzanpxWDFRRWVpMk5qZVZSNS9X?=
 =?utf-8?B?THc5K2JrYUgweXRmc29sU3JNaW4xMzA2TGRXQXh1MkFnUDIyUmxGVXNseGJi?=
 =?utf-8?B?cEpRc2xFNm0vQ3F5dyswaDI3Wjk1d1E1djkvY3ZERmtiaVBLcHhyNzBwVEJ6?=
 =?utf-8?B?a2ZYS2pwaWlaTW1JajR4REhJbHhWYWxIRExCeWhMMit4Mmd0c0kveHNJalhl?=
 =?utf-8?B?S1hFVFdlVFBWY0xFNXNTRDhNL3IwM0dTZU91NElHOUl0TzhTc1czRnMrZDFB?=
 =?utf-8?B?Wkw3SVNVTmU4Z1lyRTFINHVhNFlTL0JGYzJCNWhhdFFnbVZ6KzJ0elB6T0No?=
 =?utf-8?B?YjgybHpIV0szRm5nV3hNZXpCU0xaeEVCa09tbmFqbE51MDlmQ01ycWhHck9a?=
 =?utf-8?B?blhkdXE1S3Jmbks5M1ZobGJsajU3eXo3eWRqU1hIa2trQWk3QlRrTUhQS1Nz?=
 =?utf-8?B?NkdxKzRPZTExT3dPTmFpTFNZK0Z5M1QwaXpmNmthS3UyRmUxUXJDYjRDOUFw?=
 =?utf-8?B?dmtMN0xpei9JMURtcXlBbm8xNVB3R0hZMHRSVEhBU2NIaHcydEtrV2JqVTRi?=
 =?utf-8?B?djgvZVlSeHlHQlYzb0crM05XL0E0cUp2UDYzZWYwaXZ0QVRVMERIbDNtYlVo?=
 =?utf-8?B?b0JuM3F6T3hEK0lMUFEzT3dNdFVWWDNUMnNhR0lQMVk4R3dmQVlxZGhyeUNJ?=
 =?utf-8?B?M0wrL2ltQlRwYlZTN200MGJXRC9sYk5mQlJuOGdUeFVTbGM2UlFmRXAwNXZJ?=
 =?utf-8?B?RFlUREpITzc0aEtETXQ0dVBKL2FpVXNDS2NLTVNWNnpGRXM2SUpYYmJ0M3Z0?=
 =?utf-8?B?SzBFZUk1TVExclBwbHpWQy95ckI3OW9Yb29oUEJEM3VWL25BMllFSzliTndB?=
 =?utf-8?B?ejZiUkNvMDlyWFRTV21Dbi9SSDlNUGFRNEFBNkpnbmJBemppcUMwTitDZHlt?=
 =?utf-8?B?QkNvSVRTRVV3OW90ZmRSOHZpeFdVTHczY203cDdoMnZkd3drL2pNZVR5dkc5?=
 =?utf-8?B?VFdVUVpwZUFEU0pJcjBodFpEeE5saURXL1BEcDlCYTFIdlkwcmExc0FzdEtK?=
 =?utf-8?B?cVQ0cnZIN05ZWWN5M0lKL3AvSjRCZXRTQVhkRGdaV2N0YUlHeU01aXFwZnpK?=
 =?utf-8?B?UGNLZUJUMlBPRlJnWUZZUlhXT0NlYVJ3VHRJQUlSNmtUc096WWVRdXYzYWg0?=
 =?utf-8?B?YUlaUDRzVDFrL1lwbml4VjBFNlFnVDFnUUhPN1RIRG4rdlA1VkZnVndMWWlp?=
 =?utf-8?B?UW5vWDJzalZGVWQ2clVlWTFGYk5icnpXbmFxd2VVcmR0aEVSWDk1amc4SGJm?=
 =?utf-8?B?M2ppR1Y0VHEvTnMzeDVLM2ZHVi9KWlltdXhoVjBKNlR6aVBBVkNmNWc4SDh0?=
 =?utf-8?B?L2NWeW1UY2lneUFaSWU4NWFBSnkrblgrVzdqQzdYcm1UNHFjeWNibGovMTJQ?=
 =?utf-8?B?V0Vnc1IzUWZyWE5ic0lac2pXU1RLVkd5QWRQaFhXRVU5YUpHSWxTNGpZNmpm?=
 =?utf-8?B?bHRlTzdyZVNZTm5UWEVOSFlEV1NRbkQwTHdwTm5kVGFEQWhOeHV2NzJ4eWFZ?=
 =?utf-8?B?SFRsWlI5M2FnSkVwbitkM2lJL01iSG9OZEMwMEtDT1BWMXpzd25JS3Qra1Bj?=
 =?utf-8?B?WStjeVJmOEQxZDNJMkwzWGVlSzJucURDcFBHV0JXUysyNWhLcjBkNTlmQVF2?=
 =?utf-8?B?V0RidW05NHRHczFQeFlQUmhSeS9Ub1JIRkFaeGQrUVF0YlNwVXA5aldUdFVj?=
 =?utf-8?B?aytnVGdxS0ZuSkRidGo5MWp2dGwycHZCSWloak5vTnVKSUZqbGlJM3Uzdi9R?=
 =?utf-8?B?UEErN2F2R3ZWL0ZZLy9Za01sazR0SVRXTlFpUTF2WjBPVzVyNkRtbC83RGdT?=
 =?utf-8?B?RlpvdEZwSXl0M21qMlFxcXVHSUZRRHRTM2xBUGhsc2x0aGIya09ZZVdINFBO?=
 =?utf-8?B?S2lVMUJiT014a1dwRk85VjlwV1BEY2N4bWJVdWRGcm9QZngzSHpaRlYrbU9a?=
 =?utf-8?B?NWlFR093RDRHdW5FOGpUQnY5WHcyUkJ5UXp6WjJaczdqZXd5czhLS2VWYkI3?=
 =?utf-8?B?alE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CF95A4159B18246BC6CD3E8F1EAC859@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e95f04-1bf6-4675-470e-08dd3ef5cbe9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 17:12:36.4928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rvm2zTsZtYBUKMm1jYVomO9V5iwNkzyFbfBRJUGzntUNwYNzj5vtfPnel5yzF1szNr+sHaWccIQJSeeUZ0BqP3fq3hy1N5Yc5mioTFzZdK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6485
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

T24gVHVlLCAyMDI1LTAxLTIxIGF0IDExOjEwIC0wODAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiAxLzIxLzIwMjUgMDk6NDIsIFN1bW1lcnMsIFN0dWFydCB3cm90ZToNCj4gPiBPbiBGcmks
IDIwMjUtMDEtMTcgYXQgMTY6NTQgLTA4MDAsIEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb23CoHdy
b3RlOg0KPiA+ID4gRnJvbTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNv
bT4NCj4gPiA+IA0KPiA+ID4gVGhlIHN0ZWVyaW5nIGNvZGUgbmVlZHMgdG8ga25vdyBzbGljZS9z
dWJzbGljZSBjb3VudHMgYW5kIHRoaXMNCj4gPiA+IGluZm9ybWF0aW9uIHNob3VsZCBiZSByZXRy
aWV2ZWQgZnJvbSB0aGUgaHdjb25maWcgdGFibGUuIEhvd2V2ZXIsDQo+ID4gPiBlYXJsaWVyIHBs
YXRmb3JtcyBkb24ndCBoYXZlIGl0LCBoZW5jZSB0aGUgS01EIGhhcyBhIGZhbGxiYWNrDQo+ID4g
PiBwYXRoLg0KPiA+ID4gTmV3ZXIgcGxhdGZvcm1zIHJlYWxseSBzaG91bGQgaGF2ZSB0aGUgZW50
cmllcyBhbmQgaWYgdGhleSBhcmUNCj4gPiA+IG1pc3NpbmcNCj4gPiA+IHRoYXQgaXMgYSBidWcg
dGhhdCBuZWVkcyB0byBiZSBmaXhlZCBpbiB0aGUgdGFibGUuDQo+ID4gPiANCj4gPiA+IFNvIHVw
ZGF0ZSB0aGUgY29tcGxhaW50IHRvIGJlIGFuIGVycm9yIG9uIG5ld2VyIHBsYXRmb3JtcyBhbmQN
Cj4gPiA+IHJlbW92ZQ0KPiA+ID4gaXQgY29tcGxldGVseSBmb3Igb2xkZXIgb25lcyB0aGF0IHdl
IGtub3cgYXJlIGJhZCAoYnV0IGFyZSBub3QNCj4gPiA+IFBPUg0KPiA+ID4gZm9yDQo+ID4gPiB0
aGUgWGUgZHJpdmVyIGFueXdheSkuIEFsc28sIHJlLXdvcmQgdGhlIG1lc3NhZ2UgYSBsaXR0bGUg
dG8gbWFrZQ0KPiA+ID4gaXQNCj4gPiA+IGNsZWFyZXIgd2hhdCB0aGUgaXNzdWUgaXMuDQo+ID4g
PiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJ
bnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rf
bWNyLmMgfCA4ICsrKysrKystDQo+ID4gPiDCoMKgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d0X21jci5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9t
Y3IuYw0KPiA+ID4gaW5kZXggYTE2NzZiNzg3ZmRjLi42MDVhYWQzNTU0ZTcgMTAwNjQ0DQo+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfbWNyLmMNCj4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuYw0KPiA+ID4gQEAgLTM0MSw3ICszNDEsMTMgQEAgc3Rh
dGljIHVuc2lnbmVkIGludCBkc3NfcGVyX2dyb3VwKHN0cnVjdA0KPiA+ID4geGVfZ3QNCj4gPiA+
ICpndCkNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBESVZfUk9VTkRfVVAobWF4X3N1
YnNsaWNlcywgbWF4X3NsaWNlcyk7DQo+ID4gPiDCoCANCj4gPiA+IMKgwqBmYWxsYmFjazoNCj4g
PiA+IC3CoMKgwqDCoMKgwqDCoHhlX2d0X2RiZyhndCwgIkd1QyBod2NvbmZpZyBjYW5ub3QgcHJv
dmlkZSBkc3Mvc2xpY2U7DQo+ID4gPiB1c2luZw0KPiA+ID4gdHlwaWNhbCBmYWxsYmFjayB2YWx1
ZXNcbiIpOw0KPiA+IEFncmVlIHdpdGggUm9kcmlnbyB0aGF0IHRoaXMgaXMgc3RpbGwgaW50ZXJl
c3RpbmcgZm9yIG9sZGVyDQo+ID4gcGxhdGZvcm1zDQo+ID4gdG8gc2hvdyB0aGUgZXhwZWN0YXRp
b24uDQo+IEJ1dCBpdCBkb2VzIG5vdCBwcm92aWRlIGFueSB1c2VmdWwgaW5mb3JtYXRpb24uIFlv
dSBtaWdodCBhcyB3ZWxsDQo+IGp1c3QgDQo+IGhhdmUgYSBsb29wIG9uIGluaXRpYWwgZHJpdmVy
IGxvYWQgdGhhdCBwcmludHMgdGhlIHdhcm5pbmcgb3V0IHRlbg0KPiB0aW1lcyANCj4gZm9yIGFu
eSBwbGF0Zm9ybSBwcmlvciB0byBMTkwuIFRoZSBjb21tZW50IGJlbG93IGhhcyBhbGwgdGhlDQo+
IGluZm9ybWF0aW9uIA0KPiB0aGF0IHRoZSBhYm92ZSBtZXNzYWdlIHRlbGxzIHlvdSAoYW5kIG1v
cmUsIGJlY2F1c2UgaXQgYWN0dWFsbHkgdGVsbHMNCj4geW91IHRoaXMgaXMgZXhwZWN0ZWQgcmF0
aGVyIHRoYW4gdW5leHBlY3RlZCkuIFRoZXJlIGlzIHplcm8gdXNlIGluIA0KPiBzcGFtbWluZyB0
aGUgdXNlciB3aXRoIGRlYnVnIG1lc3NhZ2VzIHRvIHNheSBzb21ldGhpbmcgdGhhdCBpcyBhbiAN
Cj4gYWJzb2x1dGUgZ3VhcmFudGVlIG9uIGEgZ2l2ZW4gcGxhdGZvcm0uDQo+IA0KPiA+IA0KPiA+
ID4gK8KgwqDCoMKgwqDCoMKgLyoNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoCAqIFNvbWUgb2xkZXIg
cGxhdGZvcm1zIGRvbid0IGhhdmUgdGFibGVzIG9yIGRvbid0IGhhdmUNCj4gPiA+IGNvbXBsZXRl
IHRhYmxlcy4NCj4gPiA+ICvCoMKgwqDCoMKgwqDCoCAqIE5ld2VyIHBsYXRmb3JtcyBzaG91bGQg
YWx3YXlzIGhhdmUgdGhlIHJlcXVpcmVkIGluZm8uDQo+ID4gPiArwqDCoMKgwqDCoMKgwqAgKi8N
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChHUkFQSElDU19WRVJ4MTAwKGd0X3RvX3hlKGd0KSkg
Pj0gMjAwMCkNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF9lcnIo
Z3QsICJTbGljZS9TdWJzbGljZSBjb3VudHMgbWlzc2luZyBmcm9tDQo+ID4gPiBod2NvbmZpZyB0
YWJsZTsgdXNpbmcgdHlwaWNhbCBmYWxsYmFjayB2YWx1ZXNcbiIpOw0KPiA+IEkgdW5kZXJzdGFu
ZCB0aGUgaW50ZW50IGhlcmUsIGJ1dCBJTU8gaXQgd291bGQgYmUgYmV0dGVyIGZvciB0aGlzDQo+
ID4gdG8gYmUNCj4gPiBhIHdhcm5pbmcuDQo+IFdoZXJlYXMsIGlmIHRoaXMgaXMgYSBwbGF0Zm9y
bSB3aGljaCBpcyBzdXBwb3NlZCB0byBoYXZlIHRoaXMgDQo+IGluZm9ybWF0aW9uIHRoZW4gaXQg
aXMgYWJzb2x1dGVseSBhbiBlcnJvciBpZiB0aGF0IGluZm9ybWF0aW9uIGlzIA0KPiBtaXNzaW5n
LiBTb21ldGhpbmcsIHNvbWV3aGVyZSBpcyBicm9rZW4gYW5kIHZlcnkgZGVmaW5pdGVseSBuZWVk
cyB0bw0KPiBiZSANCj4gZml4ZWQuIEFsc28sIHdoaWxlIHRoZSBmYWxsYmFjayBzaG91bGQgYmUg
YWNjdXJhdGUgZm9yIHRoZSBwbGF0Zm9ybXMgDQo+IGJlbG93LCB0aGF0IGlzIG5vdCBndWFyYW50
ZWVkIHRvIGJlIHRoZSBjYXNlIGluIGZ1dHVyZS4gSW4gd2hpY2gNCj4gY2FzZSwgDQo+IHVzaW5n
IGEgZmFsbGJhY2sgbWF5IGxlYWQgdG8gaW5jb3JyZWN0IHJlZ2lzdGVyIGFjY2Vzc2VzLiBXaGlj
aCwNCj4gYWdhaW4gDQo+IGlzIHZlcnkgZGVmaW5pdGVseSBhbiBlcnJvci4NCj4gDQo+IEVpdGhl
ciBpdCBpcyBhIG5ldyBwbGF0Zm9ybSBhbmQgc29tZW9uZSBmb3Jnb3QgdG8gYWRkIHRoYXQNCj4g
aW5mb3JtYXRpb24gDQo+IHRvIHRoZSB0YWJsZS4gT3IgaXQgaXMgYSBuZXcgcGxhdGZvcm0gdGhh
dCBkb2VzIG5vdCBjb25mb3JtIHRvIHRoaXMNCj4gd2F5IA0KPiBvZiBhY2Nlc3NpbmcgcmVnaXN0
ZXJzIGFuZCB0aHVzIG5lZWRzIGEgS01EIHVwZGF0ZSB0byBzdXBwb3J0IGl0LiBPcg0KPiBpdCAN
Cj4gaXMgYW4gZXhpc3RpbmcgcGxhdGZvcm0gdGhhdCBnb3QgYnJva2VuIGJlY2F1c2Ugb2Ygc29t
ZSByZWdyZXNzaW9uDQo+IGJ1Zy4gDQo+IEVpdGhlciB3YXksIGl0IGlzIHNvbWV0aGluZyB0aGF0
IHdlIG5lZWQgdG8gY2F0Y2ggaW4gQ0kgYmVmb3JlIHRoZQ0KPiBjYXVzZSANCj4gb2YgdGhlIGlz
c3VlIG1ha2VzIGl0IG91dCBvZiB0aGUgZG9vciBhbmQgb24gdG8gZW5kIHVzZXIgc3lzdGVtcy4N
Cg0KWWVhaCBtYWtlcyBzZW5zZSB0byBtZSB0aGFua3MuIFRoZSBlcnJvciBoZXJlIGFsc28gY2Fs
bHMgb3V0IENJIHdoaWNoDQppcyBuaWNlIGJ1dCBkb2Vzbid0IHNwZWNpZmljYWxseSBsaW1pdCBl
eGVjdXRpb24gb3RoZXJ3aXNlLg0KDQpBbmQgaWYgd2UgZG8gcnVuIGludG8gYSBwcm9ibGVtIGxp
a2UgdGhpcyB3ZSBjYW4gYWRkcmVzcyBhdCB0aGF0IHRpbWUuDQoNClJldmlld2VkLWJ5OiBTdHVh
cnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KDQo+IA0KPiBKb2huLg0KPiAN
Cj4gPiANCj4gPiBUaGFua3MsDQo+ID4gU3R1YXJ0DQo+ID4gDQo+ID4gPiArDQo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAoZ3RfdG9feGUoZ3QpLT5pbmZvLnBsYXRmb3JtID09IFhFX1BWQykN
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gODsNCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoGVsc2UgaWYgKEdSQVBISUNTX1ZFUngxMDAoZ3RfdG9feGUoZ3Qp
KSA+PSAxMjUwKQ0KPiANCg0K
