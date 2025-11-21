Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5F0CFC28C
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 16:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D08A10E8EA;
	Fri, 21 Nov 2025 16:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ybqe0gvR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E4010E2BF
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763743659; x=1795279659;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=itirZo6dmd3XekdZyOdh0wOiVV1QYunykX80bpHtsZ8=;
 b=Ybqe0gvRPqeoqeEL4IQQWyBT+gspL1IeVMGwjiXPoz3UCy4Vu3yvQPNu
 wgxpND+reNgbnUspCGsSlxkcSybpx6XCqVxvODJRJi/6QW37wyQNSxjWH
 WkMoNLC/Rpf1e/d3CpgqNMXxMzMX0ggPRdFcM3bBtWq4ot0K7hRxrO5j1
 UUiMDUQXLFB0+uCkESGXcNZtOy/RhkZ/PGfHNrsR7pPZzfUKILIN9NBTE
 1lWsF/3j846nG90mSRx5tU01998lg3esWHI5ZK/0z6mVZG3CxO2/Brs3o
 ZVp+Bs9o08tbFLChWLh0FAVUSwNvHX5zuNGJ5gqg982oipZl20XtOhwWE A==;
X-CSE-ConnectionGUID: Nw1FyYB6RKy02jiiNWtBlw==
X-CSE-MsgGUID: VPgZaJ5RTBKnGwyezbY/nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65881655"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65881655"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:47:38 -0800
X-CSE-ConnectionGUID: Ed4/L3SJQ12eU+dWdUtmyw==
X-CSE-MsgGUID: 4B0TTa5JQsqaFAFGcsW8Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="192506472"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:47:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 08:47:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 08:47:37 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 08:47:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IV3sdhHYU/K1k/TyqTL8AW8OGI20+0zAnktqGij3iadv9HJ8At7yFFAJVhaGjq/Deg5ydoc4uwroqlF9jQY1dJJiQpSajTmb1234Y3oL48exrgkBuVp85flweeJ8Hy5W26PtAIfZttqV16tUIZOJZUI18R45bI0O7ZtRTXg/N56ZT5YSyK3+5yGgzUmeYuB0EgDRZGQjF7DSwZa6CKOkTxAORtsFyV8k3sRZD867Kqtxsi/FPJk9g5Tcmcv7E2RJB8o9RP0VLRWlS4VB/UVJDO9PtyjesHVMgCORijgFlrygi5y2YrnmoxmjIxKWgQ9DqiOP4RPfeT7whrMEvER4Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itirZo6dmd3XekdZyOdh0wOiVV1QYunykX80bpHtsZ8=;
 b=JKmYpyzve/NEdfczPEXjmINj32IwgyQtvjViHmH5ryOV2ced9s7hVuD2vCe3bMgjU+luntU7R5mdVv7Rj0/ZIGxanCt7KY9g96oUlMhRW7qLveJnr7gaVSrP+6YTukroZo/mb/k1z4jPU9RDmahT3pOUaWT/i19TY43JAlEm4lV8UQfSsYenJ1fNowcSrv6HfrDl0g2PjDdqMUYuCSCij0prHXYqRX4l5USgMXsrAuJlgDNQGCZ5H+Yh/iECdPOPTsAdQADiSrjrJdtIdhlLY5T3jgtHtgjfp3vinAx0QhYicwdLmJQScEZWBaIW/iRS/vRNGuykQqEgVhNZsqYiGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 16:47:35 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 16:47:34 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: Jani Partanen <jiipee@sotapeli.fi>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: Few bugs with Arc B570
Thread-Topic: Few bugs with Arc B570
Thread-Index: AQHcWu8pf6v0U/8b/kaw6EqzM3N0VLT9UT8g
Date: Fri, 21 Nov 2025 16:47:34 +0000
Message-ID: <DM4PR11MB5456CD6BBFF05C5DE68D10B6EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <12d4e567-0592-42d1-af84-a8b079b33785@sotapeli.fi>
In-Reply-To: <12d4e567-0592-42d1-af84-a8b079b33785@sotapeli.fi>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS7PR11MB6064:EE_
x-ms-office365-filtering-correlation-id: b6c4fa29-b63d-4da4-3e1b-08de291dabf9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bEpkTDZYOXhyck5veWMrcEdKeEdjTmVBK2dQNWxOalhmR3VFMmlZNDBhUlh3?=
 =?utf-8?B?dVlaM0xaSVVvU1VHT3pmUzM1cVdxMjR0RFFQV1owdkxyU1c4WGVtN1F0Q05B?=
 =?utf-8?B?Vkh3WE5yWUlNREFPQks3ZEE2amlRdWgyQWkvVFJZR2owNUk5KzFTdDU1ZWJz?=
 =?utf-8?B?UVExZTFmNXA1NkZBME9DSGJWbmVtWkJ1S1BmMGRjS0MvZzh5NjNRcWRiRE9a?=
 =?utf-8?B?SWtRV3l6RFltYm9XZkNwOVhVd0ZKbm9qSmlQN3ZScjkwMmhkN2hGUzUyV0NH?=
 =?utf-8?B?Y2Nka0d3SzNGRUtHUi83bCtERlBqM2JQT2htMXFIb1gxeWZVUmJEbzl6N2Jm?=
 =?utf-8?B?cDZtV2ZpSzBmbDBmNmdaNlgwQVFmVmVoMFY2b1RYd0k2ZEl1eFFVdUREbnd2?=
 =?utf-8?B?czB0eXJMMzJySHYwSHR5VDdPN1FFTllFenkvR0dteFFyZEo2b0ZhSEVxQk0y?=
 =?utf-8?B?TktqZHluMVBMS2d5d2YzNE0zQnh6OVJqRVlBL016Wk5SYXRmZU8wM1k3bnhF?=
 =?utf-8?B?Q3N4Qm1nRFFWRnlNZmlyUGF2SGZXSGNTckplMytSTEJKSEdWOEpnWmR2VENC?=
 =?utf-8?B?c25vZCtkSjM5NmdycjNNQ3NwaGM1amUzRG5rSzJHdTgvRGZrbkpuK0tNMy8y?=
 =?utf-8?B?U0pNQWRsSEVJTitOR2dYUXlqTmZBbHRwOEttM1pUTitxMlZDR25uSmNrYW9W?=
 =?utf-8?B?ejFNSkk1TVJKS3FrbUQxTVpJM3JEbndQSm5MMkRRWUEzZWZWMW41UEh2blZ0?=
 =?utf-8?B?cG5LRDhiQXJ4VjMrcVd4aXNJekJUZGEwRjNtK1pGenJ3bkYyRk9XNUdmclJO?=
 =?utf-8?B?OWVYU2hYbFZEL2k5aGtuMVBQNXNpWkhzYXhQWGV3Y2RnK3ZMNnZvb2pzVlpL?=
 =?utf-8?B?MG1tTkVFTGdzaGd2R011QXJYdnIzdHI5bGxuOGRyR1cyUWZWNXd4bHo5M1Yw?=
 =?utf-8?B?aktlc1FFMXNWOSszdjd6c0Z4TXBNRS95TUZubUJITkdrRDlqSlZWeEZjS09O?=
 =?utf-8?B?T25DVmRtbVlZeEIyNVp1K2k5VndiaEFROVZqZ2JXSFJtWjF2UHkwWEpzV0xQ?=
 =?utf-8?B?WmJHNzkxbS9QaWpjY2lzdG5YSExDSmpjbXFNLzNFVkVHUDZ4UFQ4MHNZQXIv?=
 =?utf-8?B?aE5ydWJ4YzRGYWxIYisrSFpaQ1VWYWtVeEdrUFlpb01BWlhSdVJtTlIzRzR3?=
 =?utf-8?B?S04zMjhpalNaUmIvTkRHVXRxS3FRSkNkL0k3d2Jka04xRWozcnVkQzRwN29a?=
 =?utf-8?B?Qyt4WXYzVWpOc25kQjdaVVBVMVp3TFMza1lLWUl6azBYTGhZRzFTV2hUT043?=
 =?utf-8?B?K29OcmxYY1k4YVpES0I4RFZveDk1SStaSHlPNFUvUXpRWld3ZTlEOXV0VGtw?=
 =?utf-8?B?S2NqU3JxUlhGdWo0VEdqcExjRTdIRHMrZzVTSnpVWEJCOVdZWHVEalVJaWVh?=
 =?utf-8?B?dzZMb2g2Nkw4cWNkb2dvc2xjTFpmTHFLSk1lcUR0N01KVS9qTVpyMTRDR2Qz?=
 =?utf-8?B?MXgydnRpckYzcmFkUlYvK3NEV1JYNW5uNFlxNnpRbEc1cnJ2T1VZNDNIY2FQ?=
 =?utf-8?B?K3JEMWZOeVdpSHlLK2VWUUFmcmp0SzVVRzVrRnliRjVGWGVvVm41amFNZnQw?=
 =?utf-8?B?WjJWVERqZ0dCQ2ZNeXJqR0F4bXM0UVo0c2h4Wk9kZ1FXVlRLUHRFQWJPa0dY?=
 =?utf-8?B?TjhyV0c5TlZFNkROV2RSMkhyaHJDTzI4UDQvcWprWFlZbFpuV0tWYkJQcG1Z?=
 =?utf-8?B?WnJseCs1K2N3bVpJY25EekJOeEhuNWpuV2ljcFJSOWtmekFIL3piOXE4NXdE?=
 =?utf-8?B?eG1pUEtHU0l3eGFmMFJMblNsdVNBVWowbDBYRE5mZTZkRVpFY1BpVlkrdUVl?=
 =?utf-8?B?SHhoSWp6TkZhbk1NK0VGM2VPdFBBd0liaHlvV0FxUlF6ZFpZcno2ZWp2UGVz?=
 =?utf-8?B?a2Q4c1Qwdm9ZMm0xaWNGYUF5bk9tdlpadVpJN0dWZmJWdXJ6bndheVU4Yklz?=
 =?utf-8?B?ZGpVTnAxYjVGS2tXZFRNUTQ2WXBMbTBnVlA4VVVRdkpkSm9wYmRzdytpcHFL?=
 =?utf-8?Q?aeYs11?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enhWMmJWcUxZT2tERjE5M0tpK0RRK05mNlhzSGVuY09OcWpmUzBXbzF1SnR4?=
 =?utf-8?B?Nys1ODF4Vk03U3owV05mUzAycEwwYVBqUW5jcVdMWGczS1hqdkpHaHhJZjR0?=
 =?utf-8?B?aFl1UVdNN0lBdW0wNHpqR3Zub0Y5Y3VkcElNNXczcmNydDV0VWdGTlhJVnVm?=
 =?utf-8?B?UTFYNGlvdGNUbHZZandFS3piMzlhbGUyN0xBeUxuN1hsSVhXbTV2Sno1Y1Uy?=
 =?utf-8?B?MWd4VS9lSXBkWStFVVNNVTdtcS80dExRZk1DZi9uWlBjazdjY2FiNlBISi9W?=
 =?utf-8?B?c3VHV2puKzlGTkthVTlWNVE2Y3FKTnUrOElyZkRUVmltcDYzR1YwNlpKU2k5?=
 =?utf-8?B?NTdUUTVYMzhVRjkxdUw1ME1iOHlONTVOeERxVWJoaUlhTlJ3WWwyMjJxL3dG?=
 =?utf-8?B?UjRKQjNXekJkQVVrVlFYL0M0VEVpMC9RUUtnQklRck5UTGt6bFB1TExPM1FI?=
 =?utf-8?B?eUdnbktEaStqMlpTc0liSDcyVERPcXU2WHpWQ1NOdnE1WUcveUp5MGRhWTND?=
 =?utf-8?B?aE16bFprZDN6UmpnSVI3Sm5mblFqdDRGcFF3WFBmbHE2WGQxUnQxT3R0ZFpP?=
 =?utf-8?B?US9ScmtabEZnR0pOUGtheU9KUGpCWHZFTUNnckJWTXlDd1JIaXRzeUdzUnZq?=
 =?utf-8?B?bVhiV25IeCs5UFhwQXZiYUw4dVUwZ1JENUZ3cER5VTFpL1hsRENvcUtmTS9V?=
 =?utf-8?B?OVFpT1NROGJZa2l0YU93L2szRFpicTJ0Z29LNGcvVEpONEJybHhERUZKbGpU?=
 =?utf-8?B?QWl4U2c0MmRhaHpyOXZ6RGRhSGFjKzlxdGVkTFNWdCtPTEJkMFJZTnlKd2tS?=
 =?utf-8?B?a0dHWElUaWJIK2l5ZXlnTXRGT3gzYkhFa2pPR1N5QXY3U2VwSi96b0haVlFo?=
 =?utf-8?B?YkRGQUtuUlMrdHRwZ1ZkczhJRXc3ZytkMmVDemg0NmZZZFZIZVlISG9OYkpT?=
 =?utf-8?B?L0NhcWc4SzU4Zmc4T21zOS9UeUpLV09kaVNMdnAwbTZpL1lDdDNXcXZsR0Vk?=
 =?utf-8?B?ck01dWdMZDlBeHo1ajBIMVBYMGR4cFRqWGszRGloTWQ3aU8yQWZVaWgvMWhZ?=
 =?utf-8?B?eVdXUFlNS0pOUW5ycjZRdVFFR2kwbGhYUnRPbTR2MlB3NEorMlJ6TlRxVFNx?=
 =?utf-8?B?S2NGQisxZ21JOXowUk1uOFc5bUhpVlJVQ1NxVTA4cTBReWRROHRDSGhHeEU3?=
 =?utf-8?B?TEtFbFJOVWJvQno2WW0ybzE2WHErWS9KYXpudDcwdzNHN0J6dGI3M2d1dlh3?=
 =?utf-8?B?U3hSSXlId2hnYnZnT3FvSG1tVVZiZGVXK1pQamJiYi9ZYnUxMCtQc3crNjZj?=
 =?utf-8?B?bzlyMm1Xd25KUkhYb0hmbnRSOE51VWsxQ3ZKd0EzVGRjeDdWWmc1MjlOd0Zn?=
 =?utf-8?B?Z0xLeEVtZDVxNC9kTVZYckZmdmdRZ1NMVWlRd0g1OHJIYmFNVFUvTVg0RFBN?=
 =?utf-8?B?RFo2L0ZraTZkcVlZV0U4bWM1VFF5T0UwakIyL2tDVGIwWHJXc1U0VGIxcTdG?=
 =?utf-8?B?bHBSZU9HeG02eUppeHo5THdnZllYN2RvNkQwMUQ1YjFRam1LU0VRa1lHNGE2?=
 =?utf-8?B?Yzc5U0g4UW82NGdMWnF4dmxpQ2hsUHlrb3NPZGwvdFN2eG9CMHlIZUJuWUpQ?=
 =?utf-8?B?TkZVUlN4S1FQZndReGlOcWtTNU05RDZKV3ljaUNSRjhPb2ROOVR0OXFkQ0ZD?=
 =?utf-8?B?cjljaXIyNkQvVjI0czhjQWhXVmFsb0lZaURYMkpOWDRHVnowaHg2Q2I1NnBj?=
 =?utf-8?B?M2VJOHEzNUpDN0VsTUdWSjcyMXlrWXNkcU1vLzhTdk5NZFgvSVZ3QzBYcEdx?=
 =?utf-8?B?L2NiOG5CMXBSSmRnMk1hZzQ0T2Q0WGR1L2FOZnNCSFZ3cmE2Z0F1WW5VaVpT?=
 =?utf-8?B?ZmNMSkZRaGZMRUpsd2dFT1FQSUJXVll2bnFmUVZGWnFwK1ZCSjdNVktLM1JU?=
 =?utf-8?B?YklSZHhFM00xM3I5WUx4WXIrckdqN29XNFZIeXZiL0RLZ2g1Nm9jM0ZQZXFr?=
 =?utf-8?B?MmNOcVQ5WGU4NnU1TUJMZU42NzJuSERYMUJkQTAycURlMXk2K2lTbytCWitR?=
 =?utf-8?B?TzRnTFpwa0N3TDRULzdDTHlOU2NzdGtHTmxhUXp4MU9pZVAxOEZmdHhFeUhY?=
 =?utf-8?Q?mYYzOUh7EKe0dThJvqU6E0Xxq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c4fa29-b63d-4da4-3e1b-08de291dabf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 16:47:34.9022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4XEDWLLGWQ/Tk2ZvnkugD0Wya9DzFAhjKtMn6s1UkGksZr/gWcaCiat1KKuoD6zupEDmQwyvpBffM5+c60ROog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6064
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

T24gTW9uLCBOb3YgMTcsIDIwMjUgNDoxNiBQTSBKYW5pIFBhcnRhbmVuIHdyb3RlOg0KPiBIZWxs
bywgbXkgQXJjIEI1NzAganVzdCBjYXVzZWQgdGhpcyB0byBzaG93IHVwIGluIGRtZXNnLg0KPiAN
Cj4gS2VybmVsIGlzICJjdXN0b20iIGJ1aWxkIGJ5IG1lIHdpdGggbXRkIHBhdGNoLiBPdGhlciB0
aGFuIHRoYXQgaXRzIHN0b2NrIEZlZG9yYQ0KPiBrZXJuZWwuDQo+IA0KPiANCj4gWzI3NzYwNy41
OTAyOTRdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPiBbMjc3NjA3LjU5
MDI5OV0geGUgMDAwMDowZTowMC4wOiBbZHJtXSBkcm1fV0FSTl9PTl9PTkNFKHJldCA9PSAtMTEw
KQ0KPiBbMjc3NjA3LjU5MDMzNV0gV0FSTklORzogQ1BVOiA2IFBJRDogMzkzODIyIGF0DQo+IGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuYzo2MjggbWNyX2xvY2srMHg5ZS8weGIwIFt4ZV0N
Cj4gWzI3NzYwNy41OTA0NDBdIE1vZHVsZXMgbGlua2VkIGluOiBpYl9jb3JlIHVpbnB1dCBuZnRf
cmVqZWN0X2lwdjQNCj4gYWN0X2NzdW0gY2xzX3UzMiBzY2hfaHRiIHh0X2Nvbm50cmFjayBuZnRf
Y29tcGF0IHJmY29tbSBzbmRfc2VxX2R1bW15DQo+IHNuZF9ocnRpbWVyIHZob3N0X25ldCB0YXAg
dmhvc3RfdnNvY2sgdm13X3Zzb2NrX3ZpcnRpb190cmFuc3BvcnRfY29tbW9uDQo+IHZob3N0IHZo
b3N0X2lvdGxiIHZzb2NrIGJyaWRnZSBzdHAgbGxjIG5mX25hdF90ZnRwIG5mX2Nvbm50cmFja190
ZnRwDQo+IG5mdF9tYXNxIG5mdF9maWJfaW5ldCBuZnRfZmliX2lwdjQgbmZ0X2ZpYl9pcHY2IG5m
dF9maWIgbmZ0X3JlamVjdF9pbmV0DQo+IG5mX3JlamVjdF9pcHY0IG5mX3JlamVjdF9pcHY2IG5m
dF9yZWplY3QgbmZ0X2N0IG5mdF9jaGFpbl9uYXQgbmZfbmF0DQo+IG5mX2Nvbm50cmFjayBuZl9k
ZWZyYWdfaXB2NiBuZl9kZWZyYWdfaXB2NCBuZl90YWJsZXMgb3ZlcmxheSBibmVwDQo+IGJpbmZt
dF9taXNjIGRtX2NhY2hlX3NtcSBkbV9jYWNoZSBkbV9wZXJzaXN0ZW50X2RhdGEgZG1fYmlvX3By
aXNvbg0KPiBpbnRlbF9yYXBsX21zciBlZTEwMDQgbWVpX2dzY19wcm94eSBhc3VzX2VjX3NlbnNv
cnMgYW1kX2F0bA0KPiBpbnRlbF9yYXBsX2NvbW1vbiBzbmRfaGRhX2NvZGVjX2FsYzg4MiBidHVz
YiBzbmRfaGRhX2NvZGVjX3JlYWx0ZWtfbGliDQo+IHNuZF9oZGFfY29kZWNfaW50ZWxoZG1pIGVk
YWNfbWNlX2FtZCBzbmRfaGRhX2NvZGVjX2dlbmVyaWMNCj4gc25kX2hkYV9jb2RlY19oZG1pIGJ0
cnRsIGJ0aW50ZWwga3ZtX2FtZCBidGJjbSBidG10ayBpd2xtdm0NCj4gc25kX2hkYV9pbnRlbCBl
ZWVwY193bWkgdmZhdCBrdm0gYmx1ZXRvb3RoIGFzdXNfd21pIG1hYzgwMjExDQo+IHNwYXJzZV9r
ZXltYXAgc25kX2hkYV9jb2RlYyBpcnFieXBhc3MgZmF0IG14bV93bWkgcGxhdGZvcm1fcHJvZmls
ZSByYXBsDQo+IHNuZF9oZGFfY29yZSB3bWlfYm1vZiBwY3Nwa3Igc25kX2ludGVsX2RzcGNmZyBp
MmNfcGlpeDQgazEwdGVtcA0KPiBzbmRfaW50ZWxfc2R3X2FjcGkgbGliYXJjNCBzbmRfaHdkZXAN
Cj4gWzI3NzYwNy41OTA1NDVdwqAgaTJjX3NtYnVzIHNuZF9zZXEgcmFpZDQ1NiBtZWlfZ3NjIG10
ZF9pbnRlbF9kZw0KPiBzbmRfc2VxX2RldmljZSBtZWlfbWUgYXN5bmNfcmFpZDZfcmVjb3YgbXRk
IHNuZF9wY20gbWVpIHBtdF90ZWxlbWV0cnkNCj4gYXN5bmNfbWVtY3B5IHNuZF90aW1lciBwbXRf
Y3Jhc2hsb2cgcG10X2Rpc2NvdmVyeSBhc3luY19wcSBpd2x3aWZpDQo+IHBtdF9jbGFzcyBzbmQg
YXN5bmNfeG9yIHNvdW5kY29yZSBhc3luY190eCByODE2OSBjZmc4MDIxMSBpZ2IgZGNhDQo+IHJl
YWx0ZWsgcmZraWxsIGpveWRldiB0dW4gbG9vcCBuZm5ldGxpbmsgenJhbSBsejRoY19jb21wcmVz
cw0KPiBsejRfY29tcHJlc3MgZG1fY3J5cHQgeGUgaGlkX2xvZ2l0ZWNoX2hpZHBwIGludGVsX3Zz
ZWMgZHJtX3R0bV9oZWxwZXINCj4gdHRtIGkyY19hbGdvX2JpdCBkcm1fc3ViYWxsb2NfaGVscGVy
IGRybV9idWRkeSByYWlkMSB2aWRlbyBncHVfc2NoZWQNCj4gZHJtX2dwdXZtIGRybV9leGVjIG1w
dDNzYXMgZHJtX2Rpc3BsYXlfaGVscGVyIGhpZF9sb2dpdGVjaA0KPiBwb2x5dmFsX2NsbXVsbmkg
bnZtZSBmZl9tZW1sZXNzIHJhaWRfY2xhc3MgY2VjIGdoYXNoX2NsbXVsbmlfaW50ZWwNCj4gc2Nz
aV90cmFuc3BvcnRfc2FzIG52bWVfY29yZSBzcDUxMDBfdGNvIG52bWVfa2V5cmluZyBudm1lX2F1
dGggd21pDQo+IGhpZF9sb2dpdGVjaF9kaiBuYmQgZnVzZSBpMmNfZGV2IG5jdDY3NzUgbmN0Njc3
NV9jb3JlIGh3bW9uX3ZpZA0KPiBbMjc3NjA3LjU5MDYzNV0gQ1BVOiA2IFVJRDogMCBQSUQ6IDM5
MzgyMiBDb21tOiBrd29ya2VyLzY6MiBOb3QgdGFpbnRlZA0KPiA2LjE3LjctMzAwLnhlLmZjNDMu
eDg2XzY0ICMxIFBSRUVNUFQobGF6eSkNCj4gWzI3NzYwNy41OTA2MzldIEhhcmR3YXJlIG5hbWU6
IEFTVVMgU3lzdGVtIFByb2R1Y3QgTmFtZS9ST0cgQ1JPU1NIQUlSDQo+IFZJSUkgSEVSTyAoV0kt
RkkpLCBCSU9TIDUzMDIgMTAvMDMvMjAyNQ0KPiBbMjc3NjA3LjU5MDY0Ml0gV29ya3F1ZXVlOiBw
bSBwbV9ydW50aW1lX3dvcmsNCj4gWzI3NzYwNy41OTA2NDldIFJJUDogMDAxMDptY3JfbG9jaysw
eDllLzB4YjAgW3hlXQ0KPiBbMjc3NjA3LjU5MDc1MF0gQ29kZTogNDggOGIgNWYgNTAgNDggODUg
ZGIgNzUgMDMgNDggOGIgMWYgZTggY2IgNGIgZDkgZDUNCj4gNDggYzcgYzEgYzAgYjIgZDUgYzAg
NDggODkgZGEgNDggYzcgYzcgZGUgYjIgZDUgYzAgNDggODkgYzYgZTggODIgZDIgMTkNCj4gZDUg
PDBmPiAwYiBlYiA4NiAwZiAxZiAwMCA2NiA2NiAyZSAwZiAxZiA4NCAwMCAwMCAwMCAwMCAwMCA5
MCA5MCA5MCA5MA0KPiBbMjc3NjA3LjU5MDc1M10gUlNQOiAwMDE4OmZmZmZjZjIzYTIyNGJjNTAg
RUZMQUdTOiAwMDAxMDI0Ng0KPiBbMjc3NjA3LjU5MDc1N10gUkFYOiAwMDAwMDAwMDAwMDAwMDAw
IFJCWDogZmZmZjg4YmMwMWQ1ZGQzMCBSQ1g6DQo+IDAwMDAwMDAwMDAwMDAwMjcNCj4gWzI3NzYw
Ny41OTA3NjBdIFJEWDogZmZmZjg4YzZmZWQxY2Y4OCBSU0k6IDAwMDAwMDAwMDAwMDAwMDEgUkRJ
Og0KPiBmZmZmODhjNmZlZDFjZjgwDQo+IFsyNzc2MDcuNTkwNzYzXSBSQlA6IGZmZmY4OGJjMDEx
YmUwMDAgUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOToNCj4gZmZmZmNmMjNhMjI0YmFmOA0KPiBb
Mjc3NjA3LjU5MDc2NV0gUjEwOiBmZmZmZmZmZjk4MTM5YTg4IFIxMTogMDAwMDAwMDBmZmZmZGZm
ZiBSMTI6DQo+IGZmZmY4OGJjMTZiNTAwMjgNCj4gWzI3NzYwNy41OTA3NjhdIFIxMzogMDAwMDAw
MDAwMDAxMDAwMyBSMTQ6IDAwMDAwMDAwMDAwMDAwMDAgUjE1Og0KPiAwMDAwMDAwMDAwMDAwMDA4
DQo+IFsyNzc2MDcuNTkwNzcyXSBGUzrCoCAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY4
OGM3NjVkNDQwMDAoMDAwMCkNCj4ga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPiBbMjc3NjA3LjU5
MDc3NV0gQ1M6wqAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMN
Cj4gWzI3NzYwNy41OTA3NzddIENSMjogMDAwMDdlZmM0MTUwMjQ4NCBDUjM6IDAwMDAwMDAxMTUw
OWMwMDAgQ1I0Og0KPiAwMDAwMDAwMDAwMzUwZWYwDQo+IFsyNzc2MDcuNTkwNzgwXSBDYWxsIFRy
YWNlOg0KPiBbMjc3NjA3LjU5MDc4NF3CoCA8VEFTSz4NCj4gWzI3NzYwNy41OTA3OTBdwqAgeGVf
Z3RfbWNyX3VuaWNhc3RfcmVhZF9hbnkrMHg0Ni8weGUwIFt4ZV0NCj4gWzI3NzYwNy41OTA5MDFd
wqAgeGVfZ3RfZGlzYWJsZV9ob3N0X2wyX3ZyYW0rMHg0YS8weDkwIFt4ZV0NCj4gWzI3NzYwNy41
OTEwMjNdwqAgeGVfZ3Rfc3VzcGVuZCsweDdlLzB4ZjAgW3hlXQ0KPiBbMjc3NjA3LjU5MTE0NF3C
oCB4ZV9wbV9ydW50aW1lX3N1c3BlbmQrMHgxNTkvMHgyZjAgW3hlXQ0KPiBbMjc3NjA3LjU5MTI4
Nl3CoCA/IHVwZGF0ZV9sb2FkX2F2ZysweDg1LzB4NDAwDQo+IFsyNzc2MDcuNTkxMjkyXcKgID8g
X19wZnhfcGNpX3BtX3J1bnRpbWVfc3VzcGVuZCsweDEwLzB4MTANCj4gWzI3NzYwNy41OTEyOTdd
wqAgeGVfcGNpX3J1bnRpbWVfc3VzcGVuZCsweDFlLzB4ZTAgW3hlXQ0KPiBbMjc3NjA3LjU5MTQz
NF3CoCA/IF9fcGZ4X3BjaV9wbV9ydW50aW1lX3N1c3BlbmQrMHgxMC8weDEwDQo+IFsyNzc2MDcu
NTkxNDM4XcKgIHBjaV9wbV9ydW50aW1lX3N1c3BlbmQrMHg2YS8weDFhMA0KPiBbMjc3NjA3LjU5
MTQ0M13CoCA/IF9fcGZ4X3BjaV9wbV9ydW50aW1lX3N1c3BlbmQrMHgxMC8weDEwDQo+IFsyNzc2
MDcuNTkxNDQ3XcKgIF9fcnBtX2NhbGxiYWNrKzB4NDgvMHgxZjANCj4gWzI3NzYwNy41OTE0NTFd
wqAgPyBzcnNvX3JldHVybl90aHVuaysweDUvMHg1Zg0KPiBbMjc3NjA3LjU5MTQ1N13CoCA/IHNy
c29fcmV0dXJuX3RodW5rKzB4NS8weDVmDQo+IFsyNzc2MDcuNTkxNDYxXcKgID8gX19wZnhfcGNp
X3BtX3J1bnRpbWVfc3VzcGVuZCsweDEwLzB4MTANCj4gWzI3NzYwNy41OTE0NjZdwqAgcnBtX2Nh
bGxiYWNrKzB4NmQvMHg4MA0KPiBbMjc3NjA3LjU5MTQ3MF3CoCBycG1fc3VzcGVuZCsweGU1LzB4
NWUwDQo+IFsyNzc2MDcuNTkxNDczXcKgID8gZmluaXNoX3Rhc2tfc3dpdGNoLmlzcmEuMCsweDk5
LzB4MmMwDQo+IFsyNzc2MDcuNTkxNDgwXcKgIHBtX3J1bnRpbWVfd29yaysweDk4LzB4YjANCj4g
WzI3NzYwNy41OTE0ODVdwqAgcHJvY2Vzc19vbmVfd29yaysweDE5Mi8weDM1MA0KPiBbMjc3NjA3
LjU5MTQ5MV3CoCB3b3JrZXJfdGhyZWFkKzB4MjVhLzB4M2EwDQo+IFsyNzc2MDcuNTkxNDk3XcKg
ID8gX19wZnhfd29ya2VyX3RocmVhZCsweDEwLzB4MTANCj4gWzI3NzYwNy41OTE1MDFdwqAga3Ro
cmVhZCsweGZjLzB4MjQwDQo+IFsyNzc2MDcuNTkxNTA1XcKgID8gX19wZnhfa3RocmVhZCsweDEw
LzB4MTANCj4gWzI3NzYwNy41OTE1MTBdwqAgPyBfX3BmeF9rdGhyZWFkKzB4MTAvMHgxMA0KPiBb
Mjc3NjA3LjU5MTUxNV3CoCByZXRfZnJvbV9mb3JrKzB4ZjQvMHgxMTANCj4gWzI3NzYwNy41OTE1
MjBdwqAgPyBfX3BmeF9rdGhyZWFkKzB4MTAvMHgxMA0KPiBbMjc3NjA3LjU5MTUyNF3CoCByZXRf
ZnJvbV9mb3JrX2FzbSsweDFhLzB4MzANCj4gWzI3NzYwNy41OTE1MzZdwqAgPC9UQVNLPg0KPiBb
Mjc3NjA3LjU5MTUzOF0gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQoNClRo
aXMgaXMgZHVlIHRvIHRpbWVvdXQuDQpBcyB5b3UgYnVpbGQga2VybmVsIGJ5IHlvdXJzZWxmLCBj
b3VsZCB5b3UgaGVscCBoYXZlIGEgdHJ5IHRvIGVubGFyZ2UgdGhlIHRpbWVvdXQgdmFsdWUgZnJv
bSAxMCB0byAxMDAgdG8gc2VlIGlmIGl0IGNvdWxkIGZpeCB0aGUgaXNzdWU/DQpUaGFua3MuDQoN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuYw0KQEAgLTY4OCw3ICs2ODgsNyBA
QCBzdGF0aWMgdm9pZCBtY3JfbG9jayhzdHJ1Y3QgeGVfZ3QgKmd0KSBfX2FjcXVpcmVzKCZndC0+
bWNyX2xvY2spDQogICAgICAgICAqIHdoZW4gYSByZWFkIHRvIHRoZSByZWxldmFudCByZWdpc3Rl
ciByZXR1cm5zIDEuDQogICAgICAgICAqLw0KICAgICAgICBpZiAoR1JBUEhJQ1NfVkVSeDEwMCh4
ZSkgPj0gMTI3MCkNCi0gICAgICAgICAgICAgICByZXQgPSB4ZV9tbWlvX3dhaXQzMigmZ3QtPm1t
aW8sIFNURUVSX1NFTUFQSE9SRSwgMHgxLCAweDEsIDEwLCBOVUxMLA0KKyAgICAgICAgICAgICAg
IHJldCA9IHhlX21taW9fd2FpdDMyKCZndC0+bW1pbywgU1RFRVJfU0VNQVBIT1JFLCAweDEsIDB4
MSwgMTAwLCBOVUxMLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUp
Ow0KIA0KICAgICAgICBkcm1fV0FSTl9PTl9PTkNFKCZ4ZS0+ZHJtLCByZXQgPT0gLUVUSU1FRE9V
VCk7DQoNCj4gDQo+IA0KPiBJIGFtIGFsc28gc2VlaW5nIHRoaXMsIGJ1dCBzYWRseSB0aGlzIGFs
d2F5cyBoYXBwZW5zIGF0IHRpbWUgd2hlbiBJIGFtDQo+IG5vdCBmcm9udCBvZiBjb21wdXRlciBz
byBkdW1wIGdldHMgdHJhc2hlZC4gSSBoYXZlIG5vdCBmaWd1cmVkIG91dCBob3cgSQ0KPiBjb3Vs
ZCBjaGFuZ2UgdGltZW91dCBmcm9tIDFoIHRvIHNvbWV0aGluZyBlbHNlLiBJIGhhdmUgc2VlbiB0
aGlzIG9uDQo+IHN0b2NrIGtlcm5lbCBhbHNvLg0KPiANCj4gDQo+IFsyMTMzNzcuMzUxMjk5XSB4
ZSAwMDAwOjBlOjAwLjA6IFtkcm1dIEdUMDogRW5naW5lIHJlc2V0Og0KPiBlbmdpbmVfY2xhc3M9
cmNzLCBsb2dpY2FsX21hc2s6IDB4MSwgZ3VjX2lkPTEwOQ0KPiBbMjEzMzc3LjM1MTM2MV0geGUg
MDAwMDowZTowMC4wOiBbZHJtXSBHVDA6IFRpbWVkb3V0IGpvYjogc2Vxbm89NzU3OSwNCj4gbHJj
X3NlcW5vPTc1NzksIGd1Y19pZD0xMDksIGZsYWdzPTB4MCBpbiB6ZW5pdHkgWzMwNjE1NV0NCj4g
WzIxMzM3Ny40MDMxNDBdIHhlIDAwMDA6MGU6MDAuMDogW2RybV0gWGUgZGV2aWNlIGNvcmVkdW1w
IGhhcyBiZWVuIGNyZWF0ZWQNCj4gWzIxMzM3Ny40MDMxNDVdIHhlIDAwMDA6MGU6MDAuMDogW2Ry
bV0gQ2hlY2sgeW91cg0KPiAvc3lzL2NsYXNzL2RybS9jYXJkMS9kZXZpY2UvZGV2Y29yZWR1bXAv
ZGF0YQ0KPiBbMjE3MDkwLjg1NTU0N10geGUgMDAwMDowZTowMC4wOiBbZHJtXSBYZSBkZXZpY2Ug
Y29yZWR1bXAgaGFzIGJlZW4gZGVsZXRlZC4NCj4gDQoNCkl0IHNlZW1zIGxpa2UgZW5naW5lIGhh
bmcgYW5kIGxlYWQgdG8gZW5naW5lIHJlc2V0LiBBbmQgdGhlIGRhdGEgZmlsZSBjb3VsZCBoZWxw
IHByb3ZpZGUgbW9yZSBpbmZvIHdoZW4gaXNzdWUgb2NjdXJzLg0KDQpUaGUgMWggdGltZW91dCBp
cyBkZWZpbmVkIGFzIGJlbG93IGluIHRoZSBjb2RlLg0KLyogMSBob3VyIHRpbWVvdXQgKi8NCiNk
ZWZpbmUgWEVfQ09SRURVTVBfVElNRU9VVF9KSUZGSUVTICg2MCAqIDYwICogSFopDQoNCj4gDQo+
IEl0IGFsc28gZ2l2ZSBtZSB0aGlzIGF0IGJvb3QgdGltZSwgc2hvdWxkIEkgcmVwb3J0IHRoaXMg
c29tZXdoZXJlIGVsc2U/DQo+IFRoaXMgaGFzIGhhcHBlbiBldmVyeSBib290IGFmdGVyIEkgaW5z
dGFsbGVkIGNhcmQuDQoNCllvdSBjb3VsZCByZXBvcnQgaXNzdWUgaGVyZToNCmh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzDQoNClNodWljaGVuZw0K
DQo+IA0KPiANCj4gW8KgIMKgNDAuNTA3MzYxXSBzbmRfaGRhX2ludGVsIDAwMDA6MGY6MDAuMDog
VW5rbm93biBjYXBhYmlsaXR5IDANCj4gDQo+IA0KPiBJIGJlbGlldmUgaXQncyBzb21ldGhpbmcg
dG8gZG8gd2l0aCBjYXJkIEhETUkgYXVkaW8uDQo+IA0KPiANCj4gLy8gSmFuaQ0KPiANCg0K
