Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270D5C982FE
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 20:44:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF0B10E937;
	Fri, 16 Jan 2026 20:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/zkCA4H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5A410E937
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 20:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768596292; x=1800132292;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dOWkGNeKRyS6ISfGsd+KSDfHiLlXCHN3btSYKGmWZWg=;
 b=K/zkCA4HDNc1TrTkczBT+HrmmgHJEBeacWaEU4dDKcPISZNb01Xv0V+K
 sFJm9T8D11AdzFa/z1pjogVYlTA5hspFCp/i5rEebNlx4eul+PhK1Idnc
 Rf1o6x8Q2hmJqfGB/7FV7gxNDQfSOqqLGowdSY8psz3xW1k/OXwaNQwKg
 QC34xlkdOk3yDuz1IFRzBO6lZJg1DjF02GXXt573wuifAt5KjKykWWGRc
 N0NAOUdjEJwdJFOMzmTIIJMqUGa7pQbB6E2VqxuJt4O8lCq2GF2sfBKcu
 NFMz8icvsZp63WRaKzLc5YVvAnRtoBiVSl7957PBDeC/1SRANVJKQJRjY A==;
X-CSE-ConnectionGUID: s9wK7/jBQFeQoWsJhW2+3g==
X-CSE-MsgGUID: u4KPnfwVSH2TbEzSm2//rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73762429"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="73762429"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 12:44:51 -0800
X-CSE-ConnectionGUID: IngYVAu0S5G0Ae28NuLYuw==
X-CSE-MsgGUID: NUcJvfNiQv+ej92Fp2sxVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="228340581"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 12:44:50 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 12:44:49 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 12:44:49 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 12:44:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pdi9U9Zbwz4Mv5lh0CTiokvuP3N+jsxC1S/IFJo9xeyO28zkvHUOTdACeSsGB9iY4v5A5i3ssIEc02k+IOKWVDZHKQady1PPZ0s95tCKydZicz0HXKtUPasxTumTg1V3aKlJ0JBIybB8Y7r5hVPcFESqQoCZfeTcQe121CWz1dcR01AQ8ypEcPhk+C+YovGMSP7b7JnK9YSXdViTyp+YeuZ7u2wTtZUTn8wz+q/svvq6secxML9LhAIBGhABtNO626W+2+i2oGrELpqFIn5Y+GN6aqeG0CMt4f6V/6cmxOKbDDQxbCmqMD24eg/1TsxUF4dv1z4DT9FXxURiiVFcKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsPYDwi0VNJK6I5EgVaula22Ro7EENfzrdeGRuLPMII=;
 b=vgApXzwyLW1oWHhCFEjpRB8Ck65rhxDeC8TxZON2QaJEcem7Ea2JK7oIZtkxn8A74BOuo8Ee8VL6fCViL3PiLL6n87lahbc2RzyzUMlzHwXIh6diJ2Uv1LMtHWIheuntIEvrWwknrIHVSRxT3H1ZMZokDGY4vrZu16+yeOxAuuIaL8FD5jI5nnjxCSwnS3ZY8jhWQ9wxOK01nb7XyHtsqYpiAxMP7v8AMgcvBQ8jq5lGRjH124+R6cbxpOWWVv54wE543qrQP612tRHRjaKCHuYJQ8/tUezc/S61feGIBowEYSKTWu8r4KaMMt60qGbWX6aeflIROOJF6/9kEE+Slg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5203.namprd11.prod.outlook.com (2603:10b6:303:98::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 20:44:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 16 Jan 2026
 20:44:45 +0000
Date: Fri, 16 Jan 2026 12:44:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Ceraolo Spurio, 
 Daniele" <daniele.ceraolospurio@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Santa, Carlos" <carlos.santa@intel.com>
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Message-ID: <aWqjOp2yaIIxI287@lstrano-desk.jf.intel.com>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWoPKWxu7zIqZPog@fdugast-desk>
 <c0d127d4-4219-4d92-8398-e971a815822f@intel.com>
 <7379f92d177312e90ff27df2a088897a1da920cc.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7379f92d177312e90ff27df2a088897a1da920cc.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0239.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5203:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d0cd80-123c-4517-9e63-08de554014e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXRCTnQ0Y3hPUmw3cnNsUHdGOVM3M2l2QjFkM29qZ0dpeEhpWGNvSk1DUjVw?=
 =?utf-8?B?Nlp1Z0puc1FNTHlvOExyZXNnSG5iT3RjSjVtYU92TEpzekRoVW1NdXhlZWlN?=
 =?utf-8?B?RkFEcDVIMUwxaVBhMFpOUklIcmJlV3ZZVGF2Y3BTZVZwRTNBaTFVM3V0bUdZ?=
 =?utf-8?B?MTd6Y01WYUhPNnI4SWt6OS9WM3RGRUpHdHZ0YWJudTcyOElxSjFMdHJ0ZlFQ?=
 =?utf-8?B?cm4xV1lXZFRlOVNpSU5VTHhLRnZGMHJJaXloYWxpdGlSK0JseWFDeUtUK09u?=
 =?utf-8?B?d3J1OWE2ZmI1eDFhRGNYeVpzN2UwWTg2Y0Z1T21Uc3IzYkpkeE1XVlUyOU90?=
 =?utf-8?B?aHUyNEFqaGM3amdnNmduVnlLL0R2U3RKbFBtUUtBeEdkU0h5bXdHMk5BRWp5?=
 =?utf-8?B?Q2VWWEJPNkM2ckRBSkorYU95Yk5mOGJ0eDhLK045Y1d3eG0zNGNIWTFxZkRp?=
 =?utf-8?B?QUtIT0haRWF1SEhlWUtUc205WDR6Q2R5ZlhFM3plUUw0YmRYSmxFQmJ2ZzNX?=
 =?utf-8?B?U2lTTG1CTm5yM0xrSjFjcUovSjRNZXg4ck9WOE9PYlNDYmdSa20vQ1UrSVF0?=
 =?utf-8?B?V3hyWTVWK1JqSE9OblpodUkyb0crV01OQVZXQUhPV2lSRXJteGRmZWJURWlB?=
 =?utf-8?B?bVY1ZTVUMnJBeUYvendwc0pvQlNtaDVyeHIzSEI4MDJUblJqVHM3UnRJWjlY?=
 =?utf-8?B?dklMZ3ZUVkRFN283TStSRitXb2UyR2x3aHRoM3JlVUlCZ3hiK09wajVxM2Fy?=
 =?utf-8?B?SGV0U3phc3NGNlpKejhJOXFOem5yc1RUUnBPVzNkTzRrK1pJanhJQ2I2U1Jh?=
 =?utf-8?B?djlVUWRNRWdkUllaQ0E2Q2kvUktET015YlVNbUMvWEV2b0ptY25Wd1QyU3ZV?=
 =?utf-8?B?WWZIdkxzMmxNQUhHc1BMLzZ3RmsrNjhxOEU3YzVnaXVCZENjZE9pQi9ZWU45?=
 =?utf-8?B?V3N6Tzk5U1FJMm9lQWJtajFZOE0rMmJxR1owV3MwcG02WFJRdXdpZmNlRWJB?=
 =?utf-8?B?bWQ0ajQrWExZemVxeDlvdDhUWkcwYlRJQU51VVNBWXBxWlBpU0VjUG9FWUNw?=
 =?utf-8?B?eTNkTENOZXNhT09zcDRBY0tTdEduVExZNklwdVdkUXUxMHh6YUJXOUw1UWlY?=
 =?utf-8?B?Zk0wOWtoMUNlcnBmVUlGT0plWTVtQnAxZDl4WTNlS1BmNHNDd2pNNkhRV0gz?=
 =?utf-8?B?QjFxdld4WllSL2svRmorSThGMm9lMGZVaVZMQVJKS0ZtNG9mZGY1RDlUTnBX?=
 =?utf-8?B?ZVp2T1A1UXY2M2JZK3J2RWRKQ0VFalZRQlFueFJCS3RZQ2tsMENnVFBqQlBK?=
 =?utf-8?B?VXZtdkNQd0dGYktPQklxcXhWdHYwcUhGajJTSGdwTHdqTG80OE5FSStSM0lz?=
 =?utf-8?B?bFNtak1XeFgrbDNoT1hKa0gySVN1OVBLQXorVlVkR0hneXU5bm5NZWVpSmFY?=
 =?utf-8?B?bnVoNk8ybEFVVmNVQTdVc1RGNG5SSlB6bng1cSszY0F1S3V0RWI0OWdMaEJ6?=
 =?utf-8?B?WG5vaXp6eDlqQitDUUxldWNXVzRwaVNXYTcxWS9YZUtpNXZKeG5tOTR5NlE2?=
 =?utf-8?B?ZldmLzdjTFo5cFUwL1pBazBvRzY5S252MlJCTmZ5RC9VempUeVYzZkpHVmdk?=
 =?utf-8?B?MEhxQVNBN2dNZVg1bzkzalQvWVNjcUlseUNndjkzOWU0ZGRXNUVDUktyOTh1?=
 =?utf-8?B?RkpobG4zRHFIeEI4dU53MEN2dWFBMzhnR0JYRElvZFFZZTQ0MU9udlljMitK?=
 =?utf-8?B?dWlRQWFWcFJEMzM3YU4zZjEvV0psK2h4ZnZWbFA2dHgraGwwMEFnT0FjeUEv?=
 =?utf-8?B?UDJtL0ZsUHcvbEZiendNQVFwU2xMMlAzWXNIT25Cai9GYi9zTWZHRXkveDhG?=
 =?utf-8?B?NXNGZm91cUhWU3loMU1Bb3RWSmVCL0I5Ukh1aE5SK1VmcHpHdkxuU0RsUzFY?=
 =?utf-8?B?NTkzbEFYZGZGWjZOMDU2TDdpUU9uT0pzMjk4VFFCWS9NVDRDRE4xREsvRjFU?=
 =?utf-8?B?SGFKcURleHVhcjBsaWwyemZFNVNjZFBBVmgzQjBlZDYzLyt1RDZkTTBSRkRE?=
 =?utf-8?B?WTFWdFFIbDQxcHMwYWJSSUg2MFRha2d5RnZMeXZ4aUpkT1pScTFueURBTTFv?=
 =?utf-8?Q?8+fM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ykd0amY3N0RNMnFvdlByZ3RGa0oySHVwU2kyRXlCUjg0L0ZYbFlvcnBZOWJv?=
 =?utf-8?B?bGl3aWI1bmxGcURRczE3TGM5aVdwZVdWcWcwb3hQcXJtYTd4dE9ESWlxaEhC?=
 =?utf-8?B?aEFCRTlEeGVyYzFoODR2Tjl5Zk05amllS2FCZGF1MFUvMWxTUzRZY2M5cXcx?=
 =?utf-8?B?bGtwOWlTclcvTEJQQzJvWkc5MXRza2xOMEVLdkFBRVRNT0d1MHgxejh5TC9h?=
 =?utf-8?B?Nm5abWdweWcrd1RXQ2p5WWtORUlMZkVmN2RzeHY2dzFUc2VoNlY3TGVDZkZK?=
 =?utf-8?B?aFFTM04rWGdYeGtGVjFKbGVrMzhLMW9vcTBKejBOdEJOdEhMNHdibjVMM0xR?=
 =?utf-8?B?cG1NQUZ4TkM4TGRDY2M4Z3ZYMzZYWXRZZkl3NGJQYkRKNWVkbktvMlFjYjBr?=
 =?utf-8?B?d3BxZVdZT1V6OHRJNEh0SEEzc2JtL2FiQzVJTVB0TnBlMy9ldVUxQXExejNG?=
 =?utf-8?B?WHMvNDVzT2FhZUdlamkzMit6RXMyaDlhaTA4cyszMnd2NTVGTHVTRTdrNy90?=
 =?utf-8?B?ajNCclFQSjBPV3FETVdFKzh5ZzZXNi93QUdnQk5QVWZYa2lRaDBQYWl5dFZB?=
 =?utf-8?B?UDJwT3NDaktJMnpSbW02cFdiTEFKVEhBR29NU1phdXdkNm1yVzI3ODJFZUtR?=
 =?utf-8?B?UFBkYkRGUXJLb3lMUjdJL3FpSllMbGdTL3psVXZoMnZTMGlTRzRSZTJaQ2lD?=
 =?utf-8?B?blN0V3RiTEc2RVJaaE9lSE5xT3JnOFhWbHZhQ05ucHBlditoaWYyNjlsKzRa?=
 =?utf-8?B?a2FabFF5T1JNVFlYUGVEbkh2K0ZVUU95Q2dDcnp3ZFFVeGMzUW94RzFWUWJh?=
 =?utf-8?B?UWI3N2ZpVGRLa2djZ25yR1dTeDVOWlRxQTdTMGNVKzNVUmx1a3VETEgyY3J4?=
 =?utf-8?B?VnJ2SU1XYk9SVjZMVzZOMk1MUVVEdGdKRDJ5R2N1UXN6a2hTYXJlbmZZZE1j?=
 =?utf-8?B?YVhtZG9zMmJGS3djay9aNUplbGdsVlB5dFRQWVRJelZmdHJNc2x2RHlRMnVt?=
 =?utf-8?B?TU1IU0ZCMW1JcmowbWc4SFQzWXNrVkRvelIvS0RGdlhJdkd4Zk9wLzdRdDRu?=
 =?utf-8?B?eU1Uei8zN1VuK2R1UW5wVVF6TU92NWVwVkNnQ2VFbEQzb2tUYXUycCtiNEc5?=
 =?utf-8?B?V1EzZDZvWHFWeDB6RC9sbG1xNzg4SDBFM256RW41Q0xvT1dVNGRZSEJVdmxx?=
 =?utf-8?B?UkwrVENmQTRaZWNWOTRXQVQzQmMydXExSmVhR2haRVp3cGZwcVBQQVRkbEN0?=
 =?utf-8?B?T2hIaUw1ZThJMDlBMGtmWk9rTjR6TUc5NG8zUGtWNmFWM2JaWEJpZndsVWp6?=
 =?utf-8?B?Zyt0SXhnV3BSaWxURTFoeCtlNFlrY1JYZnEvRzFPaUVVV080UDlMTlNqeURy?=
 =?utf-8?B?WWNBSDB5NlllNzhZSFM5VktFbFVIRkVNa2Z5U2tvS0xSYjRJaEIrYURtK0Fs?=
 =?utf-8?B?SDcxSWFFa2FqUTRtODhZN2JUczlkSGc3SndhQkVMakFtTHpVNW1QeS9QZWJn?=
 =?utf-8?B?L0dRTEhHbUsrWmhSNXNkemIwaFpnWDZHSnEzWmEydndOSzNKWGJKZVdqSith?=
 =?utf-8?B?MitvUlBkak5VUHN0Mis1YWkxaWIvT1F4Q2t6QjFGdXdnbzd3VDRDOXhPZEVr?=
 =?utf-8?B?N1FRWXlQeThlNERRaWFaRXJteVNlNXg4LzdOYTd2RGQzZ2JmenJZMHJ0b1F1?=
 =?utf-8?B?Nmtlc1grNVVrMlBHVGpSQ29uOHlsSzZDT3hmcHh1bWl1NEhVT2xZaktYdnI4?=
 =?utf-8?B?TDVvMllVTlZ6V1k5VFBFUGc5K3l2Z0p2d2xTMk4vM1hFVkNQU1FUcnhyajNG?=
 =?utf-8?B?VDlYNG9tYzRBTTdZUE4wUU1RZ2Y4R2k4cDFlbExSM1R2cndZc0NTT2pGRjFN?=
 =?utf-8?B?WlJaY1lxRXRDVWNzUE15Z3lJTFV2dFdnUzN3enhFMmFkMTZmaXlPeHJzbUNq?=
 =?utf-8?B?c0RtUEovaXgvWVRYWWV3azhzU0xuK2VFQXlnVkF4eVdGak1LUWNGaERJQWh0?=
 =?utf-8?B?MXRjRDlsWHlZem1tRGhwYWgwQVRqMXI1cUNEYWxMYUhPdGxzanpOZjRpcnNu?=
 =?utf-8?B?enlsWDVubWZqZk5IdWlxWUI3RWZCSWJNRFFySnNlUW1oY1JiNTVoeFFxUnpD?=
 =?utf-8?B?M3BITmt2Ni9rcTBHTGhIZFZZcUMzRWdRbTlZaFk0QzMxa0RWS3NhNFFURVNH?=
 =?utf-8?B?a3d1VjdXcWllMy9kRTVBME5LcmFuNm5EbSs4aHdtL2tnYktmNDNtUGZqNXdp?=
 =?utf-8?B?RXVIcnVHMHZtdzFNYmhNajNTWlhqVDRFVTJxNGZHSWdVQlpBdkx1cGVEV0tw?=
 =?utf-8?B?OUNSb0psbmdNM1d3blc1NDkwY0VNWHp1SXhsY2Nzam44czd6QmhzUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d0cd80-123c-4517-9e63-08de554014e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 20:44:45.1496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hmMWBeqFgn98fpfNG7qmJqJP9Ro8p0agfV4Z6tpLHCfpx6zVrVr5+AC9BSIgiOjMQfKYAY9KK0m2b1V7jJlRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5203
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

On Fri, Jan 16, 2026 at 12:51:46PM -0700, Summers, Stuart wrote:
> On Fri, 2026-01-16 at 08:43 -0800, Daniele Ceraolo Spurio wrote:
> > 
> > 
> > On 1/16/2026 2:12 AM, Francois Dugast wrote:
> > > On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński
> > > wrote:
> > > > On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
> > > > > If a batch buffer is complete, it makes little sense to preempt
> > > > > the
> > > > > fence signaling instructions in the ring, as the largest
> > > > > portion of the
> > > > > work (the batch buffer) is already done and fence signaling
> > > > > consists of
> > > > > only a few instructions. If these instructions are preempted,
> > > > > the GuC
> > > > > would need to perform a context switch just to signal the
> > > > > fence, which
> > > > > is costly and delays fence signaling. Avoid this scenario by
> > > > > disabling
> > > > > preemption immediately after the BB start instruction and re-
> > > > > enabling it
> > > > > after executing the fence signaling instructions.
> > > > > 
> > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for
> > > > > Intel GPUs")
> > > > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > > Cc: Carlos Santa <carlos.santa@intel.com>
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >   drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
> > > > >   1 file changed, 9 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > index a1fd99f2d539..cd645ee400b9 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct
> > > > > xe_sched_job *job, struct xe_lrc *lrc
> > > > >   
> > > > >         i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > >   
> > > > > +       /* Don't preempt fence signaling */
> > > > > +       dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > +
> > > > >         if (job->user_fence.used) {
> > > > >                 i = emit_flush_dw(dw, i);
> > > > >                 i = emit_store_imm_ppgtt_posted(job-
> > > > > >user_fence.addr,
> > > > > @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct
> > > > > xe_sched_job *job, struct xe_lrc *lrc,
> > > > >   
> > > > >         i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > >   
> > > > > +       /* Don't preempt fence signaling */
> > > > > +       dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > +
> > > > >         if (job->user_fence.used) {
> > > > >                 i = emit_flush_dw(dw, i);
> > > > >                 i = emit_store_imm_ppgtt_posted(job-
> > > > > >user_fence.addr,
> > > > > @@ -399,6 +405,9 @@ static void
> > > > > __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > > > >   
> > > > >         i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > >   
> > > > > +       /* Don't preempt fence signaling */
> > > > > +       dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > +
> > > > IGT tests which calls compute-walker, then bbe are asynchronous
> > > > (don't
> > > > wait for completion, pipe-control is necessary to wait on
> > > > compute-walker).
> > > > 
> > > > May you try to put arb disable after emit_render_cache_flush?
> > > Thanks Zbigniew, xe_compute_preempt tests do pass with this change:
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > index cd645ee400b9..d8cceab97fa8 100644
> > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > @@ -405,11 +405,11 @@ static void
> > > __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > >   
> > >          i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > >   
> > > +       i = emit_render_cache_flush(job, dw, i);
> > > +

Yes, I also confirmed that emit_render_cache_flush() is the problematic
instruction that hangs when preemption is disabled.

> > 
> > The pipe control in emit_render_cache_flush is preemptable, so having
> > that before the arb off switch invalidates what the patch is trying
> > to 
> > do (i.e., no preemption points after the bb completes until we signal
> > the fence).

Yes, disabling preemption after emit_render_cache_flush() makes the
render/compute engine change in this series useless, as
emit_render_cache_flush() is preemptable and the goal of the series is
to avoid preempting if the BB is done in the fence signaling
instructions.

> > 
> > Why does disabling arbitration cause this specific pipe control to
> > hang?

This is what we need to figure out. I looked at i915, and they have
preemption disabled around sections very similar to
emit_render_cache_flush().

I ’m raising this up the management chain to see if we can find an owner
to debug it, and perhaps even get an SV trace to figure out what is
going on. I believe this series, if working, would make our stack perform
better, so it would be good to get something functional here.

> 
> Are we enabling/disabling preemption from the batch too? It seems like

We are not disabling preemption in the batch, only in the fence
signaling.

> the batch preemption control should be owned by the user and not rely
> on the ring configuration here (which might have other intention as
> seen here).
> 
> Also would be interesting to know if the compute/render UMD compliance
> tests are passing with this change.
> 

Agree.

Matt

> Thanks,
> Stuart
> 
> > 
> > Daniele
> > 
> > >          /* Don't preempt fence signaling */
> > >          dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > >   
> > > -       i = emit_render_cache_flush(job, dw, i);
> > > -
> > >          if (job->user_fence.used)
> > >                  i = emit_store_imm_ppgtt_posted(job-
> > > >user_fence.addr,
> > >                                                  job-
> > > >user_fence.value,
> > > 
> > > 
> > > Francois
> > > 
> > > > --
> > > > Zbigniew
> > > > 
> > > > >         i = emit_render_cache_flush(job, dw, i);
> > > > >   
> > > > >         if (job->user_fence.used)
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > 
> 
