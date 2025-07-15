Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA601C83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 21:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC0510E69D;
	Tue, 15 Jul 2025 21:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVZ4VhEL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A39010E69D
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 21:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752615081; x=1784151081;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=teKdfcWfUvhLKKGngz1xggxTFCOSDZ4MyzR8WHntyts=;
 b=gVZ4VhEL7stQYuEG2eug0srgpJW4vomrm1k1xKWIwiah2SK0MnDZ4cHS
 Lm0WIs0oGDA/5fTjJEaPs2duYpFkVJjjbV1RYxC/KfnIS3YXoAPaQaUsh
 w1BKabX9iC425d3AIZxoYn3zZerwL+7z/6viFJwVJoYd1cuQtsPTlrqiR
 afjbRfaf4ypZilabxjmgDGJ4NfjjSlqSDD6+Vc40vbnkZEFG4YkijLBjw
 VZ4iid16Z8Ucd0O/8sTd407/f716gBPf5ELGnP0USM2s6w5pl/EaOMIWn
 UBvcoprod3blXViss5rvjakpGNOZgnAsml/+31VsSK8vC2zaoRC0bdwkP Q==;
X-CSE-ConnectionGUID: ch9uJcHTSLqT6AiXBDN/Mw==
X-CSE-MsgGUID: aKi45YO9ST6/bn1bB3M32Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54786239"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="54786239"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:26:27 -0700
X-CSE-ConnectionGUID: GqBm4PORTm29P5UYKv8m4A==
X-CSE-MsgGUID: bLOE3VLuTqmcyaHsTZ7y/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="157831363"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:26:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:26:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 14:26:20 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:26:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8cGovY3uh9etyblvYe3kpjHu7f90adfoqO7FEyU+jrzay/gzoXDx3hV6TPw30CWPM3Fmw8YC5rlJSHCYYyW/cZpMQ7zyn9c0lBp+YQ5VNozbWJiHOn+RG1R4O+bFPOtUGcwbd70JMo2ipgaMwf6AJky7TScLHr9GJDl67hTx/Cnj6FcIMZ5alCl6Qq+EFG5A6OTc2lp5XA62yYw6EmNi0Pg2TVpklNgRNm4JrFH4lGsxCGoAzz7vcQ9feJMgc6KTZi0gzgd/NmVWtldjmhPm38Xxdju/YMEE5xVK8k4SaUCWQ/fFmlUhH8ITJYg6x+T3OulAKQsc2twGL6I56A1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teKdfcWfUvhLKKGngz1xggxTFCOSDZ4MyzR8WHntyts=;
 b=fnvLmJggAYkDQd8OM4vhrOLm6ueb9GlUDy5AbYMIAIaedCGVvcCEOi2Go9hSp5OBvCix+jcUn5CbC6EvEwF99cq0gvSIx9G3/Z2WxeM9O8cSllKjNMtxCcwffM9WzF21Ia/of5hxfBJQVeh39ZMFOtSORukwJDqhkiuTgjexHwQxTtxe8Cx43CQ3bJ+He4IvgNIlPnAWj9xdFxQerhlh/0L95g65W5RJxyXkQQi15wDHHtQzjum7FY6p/3iqMtrq0gkpxbWu9Ll5nUWeb5zS9+xMUz7iehWyFds/u6+XDmDYuGkagzg5jbvOwpOlb1kX2ZFTEpnpH6zRqcfMWyGtog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB6407.namprd11.prod.outlook.com (2603:10b6:8:b4::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.25; Tue, 15 Jul 2025 21:26:14 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 21:26:14 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH 0/4] Basic TLB inval refactor
Thread-Topic: [PATCH 0/4] Basic TLB inval refactor
Thread-Index: AQHb9c52LCUURWAlH0eY6IJEYp4uDLQzso8A
Date: Tue, 15 Jul 2025 21:26:14 +0000
Message-ID: <d3c2f099b5d133ece90958535ee370237bc3fac3.camel@intel.com>
References: <20250715212125.337195-1-stuart.summers@intel.com>
In-Reply-To: <20250715212125.337195-1-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB6407:EE_
x-ms-office365-filtering-correlation-id: 7a02159c-9848-479c-fb97-08ddc3e63a19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dEpHTnlqLzM0djk3QTloUG9CUVdJWEZGa3ViTlRhNWlEN25pN1pxbE54eThq?=
 =?utf-8?B?MkE5bkZxVTRZc0JKMjVkT2grTGhDbWhGaWxVQnRuZ0laZTlwTVBtL3lWR3Jt?=
 =?utf-8?B?WmNSYU5pKzdSMnd1ak1rV1RkaER5ZUxuN3REdktmZlkrZDB2RXYrYWJHb1FV?=
 =?utf-8?B?VG9sNFNCOHZ1SVJDelBqUlAwWEpKZ2djL3VsZkdJZDQ1TmdzMjZTL3JhNzB4?=
 =?utf-8?B?UktKZm5CbHNoS0JHNno4TVdWZWp2S3NUUjZrc25XOWF0cTIwbU5Qckh6OTZp?=
 =?utf-8?B?YjBDM2lxUklRaTlJWUpIZU4wa1BPcXJ5TzBDU1NwaEFJRzZQUThBbk5ZZ1Np?=
 =?utf-8?B?KzMzUHRmazJSVlNXanphUE9MNkRyMmZ3OUI2RmZjMklacmMyKzlMY3lxTzJ0?=
 =?utf-8?B?UlZoT00wM0djMXNxTnpvSGpGcUQvT2JIRWlxNDQ0S1puOEJuclRmTERnWGc2?=
 =?utf-8?B?QlRsL3hoZjl0cE0xc2hKbHROWkpBOSswN3JxSmE1ZWNqREpNenczQ2h5QU1W?=
 =?utf-8?B?WHZOTnpOZzc1K28xakI3MTZ1UURqSjhZWG1JYjZqdjBZWVZOSW05b0ovUHRK?=
 =?utf-8?B?TjhCRlZLc2d6dTViOUd6ZDhKQ0ovTGxMeGw4QkUyRkRqTi9XR1BtOVdSeWND?=
 =?utf-8?B?dFNVTVVaeEFqN0hyeDhKeHBBWVhWOUVDd0dET2RPQW85bDB3OVVHZzVrbk9n?=
 =?utf-8?B?T1lUQ04yTllsRWVPUzlDYzRvaHYzUUQ5NG5IdHZuaDN5cnJhanI4OCs2cGRx?=
 =?utf-8?B?dVJXYmxBbVZ6K2EzcU9XdjBzZTJLUEttRDgwVEp5WVV0QU9HeE1ZSmwvY3lQ?=
 =?utf-8?B?QVNzdTZYd3dMNG5mTkdXR3JyWVFaSmR1bTVRUTJuQmdDV0JDZXZuWmwrazdn?=
 =?utf-8?B?dnVSdkFpeWh5Y0NmbEJSVVRmK08rbGRSMWZjQVl6a0xTR0xjZEd1azQ5QjNL?=
 =?utf-8?B?NDd3Q3M1aHRtb2hDSGJpUlNwMUt0eHpXdXNsOHBrVVlpNFVhRVpHeW5zaUZU?=
 =?utf-8?B?NEcyT0UxSENHc2xqbVlPakkwRWp4cXFHTVlDWUN6a3dZbHp5M0N4SVlrcVA3?=
 =?utf-8?B?WnRyTktHSDBvZExISDBobjRkdE1iTzhnK3ZrdVBsK25RWVRkb05tZWZwRFgy?=
 =?utf-8?B?L291L2hBRVVSMXIzMlBuRDA3a05yajZQdmVzUVN3RnpiSCswQU9FZno3TnBz?=
 =?utf-8?B?VTJaM05jS1hLbEVCN0Rnd1llVVZxTUEvb1JmblV1Q0JqNENlZDBhR3lqd0Nq?=
 =?utf-8?B?Y1EySDBqTDFmdXh4VUtvS2xrU0RjSXhaWjdrN3llM0l1Z0Y3bmNzUUdQUmxQ?=
 =?utf-8?B?ZksyeHVwV0NWbTBQRmJzaFFubGMzSEJ0Mjl4cVlWSC82aXFkSk1nb1lBZnVT?=
 =?utf-8?B?RW1aWFh6S3RodGlWT3VrSVlTWGFUVlZ1alAxR3Nrd2cxZS9RSHNrN3B6YzJV?=
 =?utf-8?B?bzlVZWNzWEIwVW1LZlhiV1lkRjBhenY1b2FwUTN2dTM5Ukk3aW5pLzV6dlZa?=
 =?utf-8?B?OFQrK2o2S2Ftd3IvV09ZZ2liWHd5WU52VnlqRkFROERlUU9tN0pTSnlCMEo0?=
 =?utf-8?B?SkJIR3VicFdTVmV1OEdlSkk3ZXU4aDlzWC9FM1J5WUJjMEl3QTlGYmdCVVJF?=
 =?utf-8?B?eXdYR0ZOWEQ0Q2xMUUN4R0RQMTFPdWV3Z1Vob2ppdC9pckM5bFJ5UHhQMUEy?=
 =?utf-8?B?Y3ZpR2tTb01mNzVGa2s3MmtBMWxEQjBDbVF6WGJkeWMxeTA3V1E3VWNXalBi?=
 =?utf-8?B?OUZuOUNoV3d6YkFUTDBKTEFhZU1HUzB1SHlWMENJNmFjY3JqUGhaelFqNHpp?=
 =?utf-8?B?NW1wcElFZHpRc1ZxcGlFd3QrbktHY28yay9XK2NjNHprZWNpQXhxL0VtcFBw?=
 =?utf-8?B?dG1jZ2J4UXo5a0pOMHFsMExzSWVmc1FmQUo3Y0FtWElFNG8wYWIvbXA0Mk9L?=
 =?utf-8?B?UDA3OTZ1dTRpUnpJZTVuZFhjWnNtOGZ5WlZLbTdRdjZqNEd5dXhZQWJkM2Jv?=
 =?utf-8?B?eDF3Y0JOYzJnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzhJbTZlbjN1cXNTczl3bWppNE01NmdKRVYvazgrZ2NpTG1BUi9hNjIzZElp?=
 =?utf-8?B?QURQK2ZERWtOZytxSWg4LzBDNklSMlUxeW1VM1dvYlI4cFlhYXRBYlpnWGNj?=
 =?utf-8?B?MVVibW1WWFpVdkJISjBmVm5hSkhiOE52SEhRejRkRTloWVlhRlhGbjBaNUx5?=
 =?utf-8?B?YXZwTktzMGEyUHRDMXpTNkJxeFYyRHFBb2paUVBXOUY4aEZpTUkvY1JjZjlW?=
 =?utf-8?B?UDAvWE80cTNEdWRtVmp3MUp5SC9WdHVmYXJ4VzFvdHN1dmpIL3pzblZtRk5U?=
 =?utf-8?B?MmNQdlVqc2dtemZFRXhxRkIyYjlPRGFMdTMxNmNIbzA2Q1g1THAzRnl1N01D?=
 =?utf-8?B?YWNubGp2Vi9zckNYUitXYlVodXl3bEtPWWlOZXllbzBCTmdiaGxJbUpNOU5k?=
 =?utf-8?B?cGNEaE1NUjdCZlpMZVRoM2pVVjRySDdxV3N3UDBEL1V1WXBmOXFmTmx5ZHBM?=
 =?utf-8?B?b2FReHJkMnB0Zm00YVRrelJnTWZ2Tk56Ulc0WmVzTWlyOFFaUGhnMkQxVTNR?=
 =?utf-8?B?YkxlQU9nMVZ2Yk1KblpMVXdUSGxlSEs3SlJiUndQTndMMTJXQUoxZk5LSk5V?=
 =?utf-8?B?NlFLZzNxbnMwZU5WVE9JQ2tndit1ZmN3T0FrZkFacmdhK1o5V3pLRmpOaklF?=
 =?utf-8?B?dXdad0RLN1pRWSt2MHhDSDZ5MU8xeEs0SWRoTEZSMFc0eDhMZU51dUpERkRu?=
 =?utf-8?B?VS9uN1hGakNudmlKSHArRWhwUkN5MnBuSW51OWlUZEp5WWxBR1o2NFcxZUJ6?=
 =?utf-8?B?d0VwamlrOSswa3oxOUpVSnNzbkhCcFBwWFNmVW90enhndUhDekFjMC9Oa2o2?=
 =?utf-8?B?M3o5bFRETDhsRTFjRUY4OC84UjgxV2hQQnMzK2MzeUx6eE8ydDAxelp2YlBo?=
 =?utf-8?B?NmNGQU4vaW9sMkFXMWV2ak84YXdTM1NyVm9FMzFXVWNSelB1L3I0OWU0UU1a?=
 =?utf-8?B?YmhWa250Z1FFbjUydHg5Z2FIRURJMERDZHVJUWwzNGFoQTFGcUtOQTVRSnZS?=
 =?utf-8?B?NGJaVkE4clAxN2NkWlVmcXd1aXF2bjBWYjdNMCtOSUpLbnF6a2FxcTM0Q0U0?=
 =?utf-8?B?VEU5NHRiSXZ0SW1zZEdnYkxNYWhORDltQUNLUFNhclg5NHdPUG1YRFE0V2h2?=
 =?utf-8?B?aFQ0Ujh1SWV3YVJuTmQwZVJCdUd6cGQxdGxRaWJRd3hBQWxOZEZCckp2R2xq?=
 =?utf-8?B?eURRYWZkZkNTV0h3TS83SENsTmlpR2x5emdoVisyNEF2c244TU9iTElqZnRZ?=
 =?utf-8?B?WmVSZXJjOUVaRGRzN3NER0FsOGxkV2t3YkViY3VTTWVsUy92UjZicDNwVnV5?=
 =?utf-8?B?M0I1UE91STVTMnBkY3VxTkRZdDRQa0ZHZUYwWUFtYjVFUUlZUTNIQ01QMGo0?=
 =?utf-8?B?dkd3UWlqRFdhU3hMTFg4NGxrMkllaEdRSzZjWlF2dmZHSktxSzVoUHhWNTNS?=
 =?utf-8?B?emRaMUlzSzIyYnJpYWx0dVQvUkRsaG5LTjZicWRnRndpNXN1WEdqSlN4Wjl3?=
 =?utf-8?B?UXUzN3Z6NEpVeVc5bDA4S1hUemhBT0w1ejlNKzhtR1VDc28yNlM2MWxWZUxi?=
 =?utf-8?B?djdtZjhIVmlJNmVialQ5Y3JneVQ2VEdvNEFLQzFtNGR0L0YrNVhuZFpuWGEw?=
 =?utf-8?B?Z05FS2l0UzdwYmRzY3p1ZDEwSG4ycjJtaDF1S1FUSnpyN1JCMEo2UHF2S2wv?=
 =?utf-8?B?dWs4dU5CWjRTdld1TXJIcFhwN3BWMCtYRkhoQWRyU0ZkRnVYeTk1YS9URnVo?=
 =?utf-8?B?M20rZGxUTTNQd3pXNXg5Q1c3ZTczWHkwd0JMbzIxOEhoVWo0RFY0ZHFwRlFC?=
 =?utf-8?B?U0U4dnVYcUdoY25laUIxUGswNUVhKzArSFg1Sy8vWnF5QmpmL1g2V242cjYr?=
 =?utf-8?B?TStFUFZvWFcyTDh4MHdaY2oxSGVVZVBxOG1tVHpoRGtFMEd0S2RzMC8wNlR6?=
 =?utf-8?B?QklSZllhSitFQjZ3b3U1dTZzdzNhaWd6U1dJS1cvVHhua25BaUZOTTFyYVRp?=
 =?utf-8?B?aDgxSkVNT3JmZzhZVWxlTGVYMWJaWm9mdGtqa3I3REFEaWxpbVVOSlphK0Nn?=
 =?utf-8?B?a01oSC9qeHZtUHhDeGJUQVNpS2hpaWpIK3dNUjNLMG5xclJHYUYxU1RlaHR5?=
 =?utf-8?B?NjJVdUlnYzdnMTlUSlRMNlZiT2VrZmFDSkl4SU9TWXlXUUFXMjVHRWZWVFV6?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D7F23B6C9D99947A5CD5B89ABB76211@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a02159c-9848-479c-fb97-08ddc3e63a19
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 21:26:14.0722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hBIw2EfjvcE3KUo92B854xRNu0YCs7CKgEA03MLd1k2aDxiKo/WcVyupa78TeRbq/lNOdoRt/1mZb5J65dHXWy2Qlv8C9eIW6ZQC6XGi6lQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6407
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

T24gVHVlLCAyMDI1LTA3LTE1IGF0IDIxOjIxICswMDAwLCBzdHVhcnRzdW1tZXJzIHdyb3RlOgo+
IEp1c3QgYSBmZXcgcmVmYWN0b3JzIGZvciB0aGUgVExCIGludmFsaWRhdGlvbiByZWxhdGVkCj4g
ZmlsZXMgd3JpdHRlbiBieSBNYXR0LiBDb3VwbGUgb2YgdGhlc2UgaGF2ZSBhbHJlYWR5IGJlZW4K
PiByZXZpZXdlZCBhbmQgSSBkaWQgc29tZSBzbWFsbCByZWJhc2luZyBvbiB0aGUgbGF0ZXN0Lgo+
IAo+IFdvcmtpbmcgb24gYnVpbGRpbmcgc29tZSBvZiBoaXMgb3RoZXIgcmVjZW50IGNoYW5nZXMK
PiBwbHVzIGEgZmV3IG90aGVycyB0aGF0IGhhdmUgYmVlbiBmbG9hdGluZyBhcm91bmQgb24KPiB0
b3Agb2YgdGhpcy4gRG9pbmcgdGhpcyBzZXJpZXMgZXhwbGljaXRseSBmaXJzdCBzaW5jZQo+IHRo
aXMgaXMgYSByZWR1Y2VkIG92ZXJhbGwgc2NvcGUuCgpJJ2xsIGxlYXZlIHRoZSBzZXJpZXMgdXAg
aGVyZSBhIGJpdCBmb3Igb3RoZXJzIHRvIHJldmlldy4gSSBqdXN0IHdhbnRlZAp0byBnZXQgdGhl
IGJhbGwgcm9sbGxpbmcgYSBiaXQgcXVpY2tlciBoZXJlLiBUaGFua3MgZm9yIHRoZSBjaGFuZ2Vz
Ck1hdHQhCgo+IAo+IE1hdHRoZXcgQnJvc3QgKDQpOgo+IMKgIGRybS94ZTogRXhwbGljaXRseSBt
YXJrIG1pZ3JhdGlvbiBxdWV1ZXMgd2l0aCBmbGFnCj4gwqAgZHJtL3hlOiBSZW1vdmUgdW51c2Vk
IEdUIFRMQiBpbnZhbGlkYXRpb24gdHJhY2UgcG9pbnRzCj4gwqAgZHJtL3hlOiBzL3RsYl9pbnZh
bGlkYXRpb24vdGxiX2ludmFsCj4gwqAgZHJtL3hlOiBBZGQgeGVfdGxiX2ludmFsIHN0cnVjdHVy
ZQo+IAo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2VfdHlwZXMuaMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstCj4gwqBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZXhlY19xdWV1ZV90eXBlcy5owqDCoMKgwqDCoCB8wqDCoCAyICsKPiDCoGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9nZ3R0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgIDYgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgOCArLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d0X3BhZ2VmYXVsdC5jwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgLQo+IMKgLi4udF90
bGJfaW52YWxpZGF0aW9uLmMgPT4geGVfZ3RfdGxiX2ludmFsLmN9IHwgMjM5ICsrKysrKysrKy0t
LS0tLS0KPiAtLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbC5owqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCA0MCArKysKPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJf
aW52YWxfdHlwZXMuaMKgwqDCoCB8wqAgNjIgKysrKysKPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF90bGJfaW52YWxpZGF0aW9uLmjCoMKgIHzCoCA0MCAtLS0KPiDCoC4uLi9ncHUvZHJtL3hl
L3hlX2d0X3RsYl9pbnZhbGlkYXRpb25fdHlwZXMuaCB8wqAgMzIgLS0tCj4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3RfdHlwZXMuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzMSAr
LS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqDCoCA4ICstCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbG10dC5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTIgKy0KPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9taWdyYXRlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDYg
Ky0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCA2ICstCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpX3R5
cGVzLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQo+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3B0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
NjEgKystLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdm0uY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
dHJhY2UuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0MCArLS0KPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDY0ICsrKy0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPiDCoDIyIGZpbGVzIGNo
YW5nZWQsIDMyNSBpbnNlcnRpb25zKCspLCAzNDkgZGVsZXRpb25zKC0pCj4gwqByZW5hbWUgZHJp
dmVycy9ncHUvZHJtL3hlL3t4ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMgPT4KPiB4ZV9ndF90bGJf
aW52YWwuY30gKDYyJSkKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3RfdGxiX2ludmFsLmgKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3RfdGxiX2ludmFsX3R5cGVzLmgKPiDCoGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5oCj4gwqBkZWxldGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb25fdHlwZXMuaAo+IAoK
