Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B97ACAC582
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 19:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E92F10E7C9;
	Tue,  9 Sep 2025 19:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOR/7lG0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D0C10E7C9
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 19:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757444635; x=1788980635;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WPnWTtXOd3ADcV8BK8o0U4E8U6fvor3cD1VrfG4q3Pg=;
 b=IOR/7lG0FGxeYqGtOETvY6pApTWnhfuv70d6Keu7YoOMy/FIKd9Q4aqZ
 qgm4Af5NGDpg2uvbx0SjqzLDUz2rwvzohqAEBH06THj1hntCsaqZJqSvi
 2+3XU+zufDD9ADniKg/GKdyhPD4keb+becg3JphZYhRxg/VkcntikiW8u
 P8qS240H3hsFbrDFl4MRBstFa0+Jc9drftfZeXD5k1mQW/9puU0oWpm4L
 a/vBqZ8eMsvoXf7ouqn1va2Eb+scKfoECN/d6wmkRaBb5ht9CNb9kq+4v
 UtqtsoOuimo7yOG45kIlvwAPje2STrUIT3D1LyRKG/I739cbdxEWYnHq2 A==;
X-CSE-ConnectionGUID: PM0ktsq+RACTQqZtT6Oq8Q==
X-CSE-MsgGUID: FJIrPrbAR7yYZiePxF6gXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59817062"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="59817062"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 12:03:55 -0700
X-CSE-ConnectionGUID: mfFbyrjFRcmzJAdJ8WH/Zw==
X-CSE-MsgGUID: 1C+6lZvFQtiylGuEp1BWCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="177511790"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 12:03:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 12:03:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 12:03:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.70)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 12:03:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqIOcRfc0GQbfWzT3owHXn60RcBWiNj7YRdzc7IXZlSp6OeHdDrmbjYu0jxdsmkln/5+kEPtS108Qxa4IJI3idpp7WWjy/9Pnq/u1xEh6lpjJRzhlsQ8fBp2eeloAZckYTYuISMBnIwUxGRgnejdeZVmE5gJVdI2ou88LPuammfDo3TW9vsxf+UlkSe/Wi7WdE9JiI6cIJ/qwZ+qqb+JuQMnG6svoZZebAkGUer6MKwFfe6Icyi7H0/GPGoDo2Lc9Z/hk1wnOK8AS6EIz78291LvTZO9aKSQY/eBnN3SlUIGzu8+5yHef/u9c0V3FKcysD8seFBSvw2+x2Tka20J8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPnWTtXOd3ADcV8BK8o0U4E8U6fvor3cD1VrfG4q3Pg=;
 b=VDXyd18N4qtJ/LM5oWM6TtcxgbG66oLLS+YVX9illq+PH5EvFLTb7YZJNrNnLSzZdOgWhhBr79v81+gc/2dYq3F6vPC387NhCcuoQYysW8NJ278HQaGVFr+74hK+8XjQO3dk4+mNsURtTmwa//Bbv1Px038ENuaHxyrtgQ12CTztDzctbmMTs0cpxAuSniVjnGgdI+kTKCHzSsko60vGkqs3P1QtM2iyDV+73QWFikZFvyt3H9fr0fZ1XFwat+AKh+bbA7Gw/qnYhRtz3i1iXWW5LuLLkOh4nEGzvvvh45A0dpyRDuFzYpONQJ26oh/BEa4efz/ye7zLyhErNKmhlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ5PPFED9C9AC99.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 19:03:47 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 19:03:47 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
Subject: Re: [RFC 1/2] drm/xe/migrate: Add tracepoint during VRAM copy
Thread-Topic: [RFC 1/2] drm/xe/migrate: Add tracepoint during VRAM copy
Thread-Index: AQHcIZs2BnW1wSf3ZE2du69UjJMuGLSLNbeA
Date: Tue, 9 Sep 2025 19:03:47 +0000
Message-ID: <65ee8dcc2384b5e1652d4ffac97f06bb2f56b0b2.camel@intel.com>
References: <20250909150437.986365-1-francois.dugast@intel.com>
 <20250909150437.986365-2-francois.dugast@intel.com>
In-Reply-To: <20250909150437.986365-2-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ5PPFED9C9AC99:EE_
x-ms-office365-filtering-correlation-id: 0db54588-a5c4-4435-2c91-08ddefd39b10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?K2pSNWRwS2taTGFuWE53ZEdjTnhqVktETHByYzl3VlpWOUwwcjdLUHJ6TXlI?=
 =?utf-8?B?QStCY1FEODJpYUEwSXJaRFozYTM2bzdMZ1ZobUlWS0lsUTBhUWtSYnRhYXhy?=
 =?utf-8?B?U1B1a1phRDVwNkNHYlpLOG51UXVtWHlMVVBtMHRxZHNmeW5WVXpMbW1BL0NN?=
 =?utf-8?B?Mlk4ZGdFL25hQ1V1T05JVk9hakZjKzNnaFUyS2t6aUZMN1RLb3pXYzJ0Rmtm?=
 =?utf-8?B?cUFkVmw4MzJPdzFIbzFSNUJkZXJ6UGRZTGFhSDB1bnVSUlJ3OGJrWXFBQUF1?=
 =?utf-8?B?RFJ1b1k5SDN1dzIxeThBM3pvbTR2MlZiUGp3ZXhwUk1VT0xvWm53OFdSVGIx?=
 =?utf-8?B?YlpsYlo4SFJhcmJuaWdsNWNuT2xrZm1lMmpCUVFXSW00RVpNVHBXV3lZa20x?=
 =?utf-8?B?TXd5ZzFTcVA3NUZBWjVkYjlqSU5vdHhQMlJWV0NyZGN3Z0lxcmZCNUlTZzJN?=
 =?utf-8?B?WWZFcjh5YjVWazh4OWVyY3kyM1VKaks5Tkg2MWcvYmg4Sll2QkJZSWFWOTVE?=
 =?utf-8?B?S1FTWHhhcDBQN2FnLzdrL3FsUHltd0VxcndIUTdaTzRVTHVXeUlMN0t6K2Y5?=
 =?utf-8?B?d0VFMGRhaHRobVdRL2hGUk5aelloVlF5cElpNDFnbXA1MnJLdzdDSE1LVTZU?=
 =?utf-8?B?Ri84OXVTSUdEc0VuNVFNdWZ3aktSdm9jMXVydDJLZFh1OFQwOVNabStUWENu?=
 =?utf-8?B?ZGZLQmJBVnJkZnhjQ3Y1NVQ3WmtraXhXRkNQQjU5bDFJamVIMWhBWk1abC9u?=
 =?utf-8?B?UERGSGZ1MjROSkZpb1ZEWWJrMk1LcUxQWnlkamFMRXk4MHBDSzV3OWFNNHJS?=
 =?utf-8?B?RC80UkxmTUZUeWhvNFN3YW1LSmkxMEduT2hHWDRDbll4QVdZRkNtcWRUZm5R?=
 =?utf-8?B?Q08wczh3RXcxT1MwYXJhVkJBempva21OWC9sSlAxamtXT05IYVpoVVhkUU5J?=
 =?utf-8?B?T2Z2OWFDdUYwWS8xTzYzMzRsWlFhY0ZxQzZpMzBYbTNKOUw0clNVbnhzb2R1?=
 =?utf-8?B?UGFFeDl3QUszSDdJV3FCMlFWMUxUTjFzWTRHUUljOTN0YlZaYWpCRXBqblpC?=
 =?utf-8?B?c1ExUnZnc0UwV0QvVE1QK1R0WkEwMWM5MC9obXZKb0hoOW1ZSnBMR2hxdlpP?=
 =?utf-8?B?eGFOaU81RFJNTVY3bmZXQ3pNWVF0Y2tPL1lhRmVEY1RDL2FXTi9kbzRWNGVp?=
 =?utf-8?B?aGxrMWhUNmhyU0lTZ1BJMlpMRjFoR0Q2ZUY0L3NIcFBRazNNM0hjaGNTbGRj?=
 =?utf-8?B?TDF6eThkVGFTYzhkTUFBSXdKTlBkbDRjalRFZTd0RWFKdVN4cHlZU0VkY0FY?=
 =?utf-8?B?cXptRTNDK2hobVp0bWovQjBmN0dKaUUyeFJ6R1dMYjI4MFRKRy9ZYzlpU1la?=
 =?utf-8?B?Rk5xMTBaRFZmZHNMOTdidWtrSkxZTmVqSzN6K3U5VUxGT2FsdGdjR25tdEQv?=
 =?utf-8?B?SWRXV3Z1bmVTbm1HZXRYemgyZmZYMjVMLytRTUU3TEdSengydytoRjhUYThE?=
 =?utf-8?B?SXI1eVNaQVMySHVUYXFZQlI4cFBmcEk5TFI2SWJSbVJseUhpSlh1SUcwanRM?=
 =?utf-8?B?cHJBenp3UUpCRktOZGl3ZFhSZnpiSzArR3dyWjBLb3RQd3RQUFI5UDhsWHlm?=
 =?utf-8?B?Ym1mYlp1WjNLYUt6UDRWVjFtVTN1SVdnR2JIODlrWlZBSjhBdjNXY2FZRGtz?=
 =?utf-8?B?MWxuZlFmU2NwMnFBckFzU3cxTjRwUWVHWVFqNW9CYUlGVVhUdDZkZk44R3FK?=
 =?utf-8?B?ekpyUG9RQW9MZWNwRHJQQnMvazRyRWpUQk1yUmQrd1p0M2FlOFk3T0Zud1Bm?=
 =?utf-8?B?SHV1ZWZQR3VFY3JjS0J4Z28wbzZYM1NqTXBmdU9qekJLTFpxdTNYSWdvd0h1?=
 =?utf-8?B?ZVlnaHlsU244czFjV2xPUkRFL2lONW5aWTZmTEJCL3ZFbHBQbjkzNG4yQmY5?=
 =?utf-8?B?SWNxNTY2eDdDT3BkRWw3QzdSRVBGNDJxdTBWaWprL1Z5YzBZTDlFYnovK0RF?=
 =?utf-8?Q?WeV6S4yM9duLWfgVpaNRmA6ceUoTQ4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkIrdUprMzZ6RjZaMG9UWjMxc3p2MXg2V3BsakxPcFpjQ3JXaGFxY1lwdFpx?=
 =?utf-8?B?T0hYMjdsNzdGRythSkcza0t4UlAyQ1lHZXVKaHJjUEptVW8vdm9EWnJLTnE3?=
 =?utf-8?B?R3NEZG94b0VTMG9jRjBzcDBqZEd6akVzMkIyTUwwYTkxcGpvSFBVTUFBbzdo?=
 =?utf-8?B?YUFucm9VTjNqMFlzbjdjckNON01xUXZOMzVWQ0ZBdnhlUzArWkhGN3hjMGZN?=
 =?utf-8?B?VU10cWJDNWdMSmZ3eUFSMXZEK1V6V0VlVm5YOTNzZWpWMFhLeFNBM1lQcysr?=
 =?utf-8?B?NGNsYno5c01JZ29sV3hHNDNoYlVxMS9FdTAyTEIzSGZYT3ZMVXkzaW96ZHpC?=
 =?utf-8?B?a01IQThDR1pNVDNaeHRzTWpEbVJSL0VrdXF6YTBMMnFqK2NDL3puY0dFbGhJ?=
 =?utf-8?B?MDFxS2dlekp6UDFpK080LzVMN3Y3clpBQSt2S1Vudjd6ckEyZ3NGVS84YnNp?=
 =?utf-8?B?MHVmQnF2ZnJOQVdLTUdKMVBMckptYnBDcGE3MWlkbng3WFprTnNTa2hKT2Mw?=
 =?utf-8?B?bXdCQ2lGZEVMWmlGbngrcGQ5a1RnQ3hIMmsxVEo1aUF2SE9jWUk0enRiZHNi?=
 =?utf-8?B?YngwR1pMdjlaRmRBTVRrUkMrN2FzZjhjNlpNa2E1ZUhhTWc5VFJGQ2ZGSHVx?=
 =?utf-8?B?bi91SXZwdFlIWW9lYyswVzluYjY5NjUxY3dmVndxVkdKUlRLU0oyVHlIVXVu?=
 =?utf-8?B?K25KUndRZU1VY3FUVkN0VlpYUDZSVUd6bWxFdndOUjEybGhwTU9NZFg2d3Nv?=
 =?utf-8?B?eDFTaGJLVWs5czRNUktFa2U0dDNjd2JJSnI4bFNLVkJ6ejNjbktuc1RoL3pr?=
 =?utf-8?B?NFdmc1dtRjJIMHIzN2U1RS9pZEJ3eTFNMVhlOTJwNnpLUldFTnM2VjBSdkg1?=
 =?utf-8?B?NXhyRmFRcXZqaU1vU1VURVB1d1NzaTlQdVJ4dEppTE40bTJHQ3J0SWhtNFVU?=
 =?utf-8?B?aXYzRGhqTlNRMU9PSEYwU0F4ZGt0dVcwZlF6dGpKOGRDd0tib0VnY2ZLZlNH?=
 =?utf-8?B?Q1FORW1wMjExUm1xVmx0WlBjS1RVZUQvcVRjUitNY05NcjgvbzJYaEE5MHNz?=
 =?utf-8?B?anhDQnp2RU5rcEd1T1h0VzBoWFNnTkp6YVFmL0JMS3RMRVVKSkJXTzNSaG9o?=
 =?utf-8?B?TGRCbHNPTm40azdjb01PWlNWdC9Vb25ydmNGRExHaHp4OUd2L1FDbXljNmFl?=
 =?utf-8?B?czNFcHZPdXNqOXpTckpDa0VTcURtUDd2M3RwUEJFamp5TXJFcVcwNFdMdFBq?=
 =?utf-8?B?ZHZuN2I2eGw1Z2duVlBHRlA2MWxmbGJ6cGZJME9iMCtHVnc4Uk4zbTUzeWtK?=
 =?utf-8?B?WHllZW5Ea21lM0FCcFBEbVh6OGQzc0hYRzZVS3g5bTVUaC85ZnA2NlN1UkV6?=
 =?utf-8?B?Mm9XV2ZIRlRBTk8va3htWEhXTVliaE1ZQzEzR3lzV2FHNDA2K1FkeTdyUjBt?=
 =?utf-8?B?UmV2K1N4eGF3elNCR0pCd0xsNHA2WnZ3RUpjY1VrYXFXQndvRUg3YjBidUwx?=
 =?utf-8?B?SVgvaVgzL1dDUnlNdU5xaUNPSUl6TDFucVU5bGNTQkx6WFpveU12TjIvekVp?=
 =?utf-8?B?allzSHlxQmplQkd1TVhSSmt0UWlZcVZmaGdaVlRod1l5MU1PaTJwekhNWndT?=
 =?utf-8?B?RklWR3lKdGhybFBxbHo3MVU4WGx4ejY1RlVJMFI0MGg0eE9kaGIycTl1V2Y1?=
 =?utf-8?B?dWNhV2thZ1B5akNUVFZxZDNLWmprN05ZcjQxQVZOQ0VSRFdmakdMMEwybnhn?=
 =?utf-8?B?cE00emk3T0RCazJQQlk0K3RWRGpBSHY3M3F1OXZCOUFzZzBrUGphMFpuTDVt?=
 =?utf-8?B?UERDL1A3ZDhQYTRsdG4yb0xtcW9QNUNPVktpWmZUWFM3TXdjY1JrSmJFK2dJ?=
 =?utf-8?B?VE5HbkNpM1FWTVdOMWQ4QUhya3Qvbkt3dEJGVU8rSzEwVkRTcmNjZnMvOVkv?=
 =?utf-8?B?SFlHdGxyMDlGa0NmUERyT3B4WGU2bmVCaVlFK3ZXZmNyUDJvUks3OHlzcUtL?=
 =?utf-8?B?dlpIZ0RhZWtZd2YwWHQwMFl2WC8wZFZKN0N4V3RDK042OXR5UjdnOVp3R01I?=
 =?utf-8?B?dS8rQ1A2Yml5M3czR0hUQVp3R1dNeG5JOVJxT2gxbGtKdDYxU1lneFU5SExV?=
 =?utf-8?B?dDRxVU1OWXlGS3JDcGRGRmlLRFNBL2pEUXZiOGtreWVqQ3VUWllkU25XeHRK?=
 =?utf-8?B?M0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BD5E867A174E54CA06A17100FAA9657@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db54588-a5c4-4435-2c91-08ddefd39b10
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 19:03:47.4745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bVAQU5xUVli1Ltd19Hq8DXZmYMKx8OgRl+3Q0mYfmUcsQ8gOJJbWZY/9QjHOnFjoiSjnGKhmJ2/0TuN3VaEzokylIdr1Dr8x+WpD2jNOLbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFED9C9AC99
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

T24gVHVlLCAyMDI1LTA5LTA5IGF0IDE3OjAzICswMjAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
Cj4gQWRkIGEgbmV3IHRyYWNlcG9pbnQgd2hlbiBtaWdyYXRpbmcgbWVtb3J5IHRvL2Zyb20gVlJB
TS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBp
bnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jwqDCoMKg
wqDCoMKgIHzCoCA5ICsrKystLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZV90
eXBlcy5oIHwgMTQgKysrKysrKysrKysrCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdHJhY2Uu
aMKgwqDCoMKgwqDCoMKgwqAgfCAzMgo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+IMKg
MyBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IMKgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlX3R5cGVzLmgKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYwo+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYwo+IGluZGV4IDNmMGM4ODMyMTIwZi4uZDQ0NjJjYjkx
Y2JiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jCj4gQEAgLTI4LDEyICsyOCwxNCBAQAo+
IMKgI2luY2x1ZGUgInhlX2h3X2VuZ2luZS5oIgo+IMKgI2luY2x1ZGUgInhlX2xyYy5oIgo+IMKg
I2luY2x1ZGUgInhlX21hcC5oIgo+ICsjaW5jbHVkZSAieGVfbWlncmF0ZV90eXBlcy5oIgo+IMKg
I2luY2x1ZGUgInhlX21vY3MuaCIKPiDCoCNpbmNsdWRlICJ4ZV9wdC5oIgo+IMKgI2luY2x1ZGUg
InhlX3Jlc19jdXJzb3IuaCIKPiDCoCNpbmNsdWRlICJ4ZV9zYS5oIgo+IMKgI2luY2x1ZGUgInhl
X3NjaGVkX2pvYi5oIgo+IMKgI2luY2x1ZGUgInhlX3N5bmMuaCIKPiArI2luY2x1ZGUgInhlX3Ry
YWNlLmgiCj4gwqAjaW5jbHVkZSAieGVfdHJhY2VfYm8uaCIKPiDCoCNpbmNsdWRlICJ4ZV92bS5o
Igo+IMKgI2luY2x1ZGUgInhlX3ZyYW0uaCIKPiBAQCAtMTc4MywxMSArMTc4NSw2IEBAIHN0YXRp
YyB2b2lkIGJ1aWxkX3B0X3VwZGF0ZV9iYXRjaF9zcmFtKHN0cnVjdAo+IHhlX21pZ3JhdGUgKm0s
Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoH0KPiDCoAo+IC1lbnVtIHhlX21pZ3JhdGVfY29weV9k
aXIgewo+IC3CoMKgwqDCoMKgwqDCoFhFX01JR1JBVEVfQ09QWV9UT19WUkFNLAo+IC3CoMKgwqDC
oMKgwqDCoFhFX01JR1JBVEVfQ09QWV9UT19TUkFNLAo+IC19Owo+IC0KPiDCoCNkZWZpbmUgWEVf
Q0FDSEVMSU5FX0JZVEVTwqDCoMKgwqDCoDY0dWxsCj4gwqAjZGVmaW5lIFhFX0NBQ0hFTElORV9N
QVNLwqDCoMKgwqDCoMKgKFhFX0NBQ0hFTElORV9CWVRFUyAtIDEpCj4gwqAKPiBAQCAtMTgxMyw2
ICsxODEwLDggQEAgc3RhdGljIHN0cnVjdCBkbWFfZmVuY2UgKnhlX21pZ3JhdGVfdnJhbShzdHJ1
Y3QKPiB4ZV9taWdyYXRlICptLAo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgZXJyOwo+IMKgwqDCoMKg
wqDCoMKgwqB1bnNpZ25lZCBsb25nIGksIGo7Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqB0cmFjZV94
ZV9taWdyYXRlX3ZyYW0oeGUsIGxlbiwgdnJhbV9hZGRyLCBkaXIpOwoKTG9va3MgZ3JlYXQsIHRo
YW5rcyEKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5j
b20+Cgo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGRybV9XQVJOX09OKCZ4ZS0+ZHJtLCAobGVu
ICYgWEVfQ0FDSEVMSU5FX01BU0spIHx8Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgKHNyYW1fb2Zmc2V0IHwgdnJhbV9hZGRyKSAmCj4gWEVfQ0FDSEVM
SU5FX01BU0spKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIEVSUl9Q
VFIoLUVPUE5PVFNVUFApOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWln
cmF0ZV90eXBlcy5oCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZV90eXBlcy5oCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmMzMzJkMDYxMDgxNAo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZV90eXBl
cy5oCj4gQEAgLTAsMCArMSwxNCBAQAo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlU
ICovCj4gKy8qCj4gKyAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uCj4gKyAq
Lwo+ICsKPiArI2lmbmRlZiBfWEVfTUlHUkFURV9UWVBFU18KPiArI2RlZmluZSBfWEVfTUlHUkFU
RV9UWVBFU18KPiArCj4gK2VudW0geGVfbWlncmF0ZV9jb3B5X2RpciB7Cj4gK8KgwqDCoMKgwqDC
oMKgWEVfTUlHUkFURV9DT1BZX1RPX1ZSQU0sCj4gK8KgwqDCoMKgwqDCoMKgWEVfTUlHUkFURV9D
T1BZX1RPX1NSQU0sCj4gK307Cj4gKwo+ICsjZW5kaWYKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3RyYWNlLmgKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5oCj4g
aW5kZXggMzE0ZjQyZmNiY2JkLi5iOWY1OTY1MTc3MWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3RyYWNlLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHJhY2Uu
aAo+IEBAIC0xNiw2ICsxNiw3IEBACj4gwqAjaW5jbHVkZSAieGVfZ3B1X3NjaGVkdWxlcl90eXBl
cy5oIgo+IMKgI2luY2x1ZGUgInhlX2d0X3R5cGVzLmgiCj4gwqAjaW5jbHVkZSAieGVfZ3VjX2V4
ZWNfcXVldWVfdHlwZXMuaCIKPiArI2luY2x1ZGUgInhlX21pZ3JhdGVfdHlwZXMuaCIKPiDCoCNp
bmNsdWRlICJ4ZV9zY2hlZF9qb2IuaCIKPiDCoCNpbmNsdWRlICJ4ZV90bGJfaW52YWxfdHlwZXMu
aCIKPiDCoCNpbmNsdWRlICJ4ZV92bS5oIgo+IEBAIC00NDEsNiArNDQyLDM3IEBAIFRSQUNFX0VW
RU5UKHhlX2V1X3N0YWxsX2RhdGFfcmVhZCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+cmVhZF9zaXplLCBfX2VudHJ5LT50b3RhbF9zaXplKQo+
IMKgKTsKPiDCoAo+ICtERUNMQVJFX0VWRU5UX0NMQVNTKHhlX21pZ3JhdGUsCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9QUk9UTyhzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSwgdW5zaWduZWQgbG9uZyBsZW4sCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1NjQgdnJhbV9hZGRyLCB1OCBkaXIpLAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVFBfQVJHUyh4ZSwgbGVuLCB2cmFtX2FkZHIs
IGRpciksCj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVFBfU1RS
VUNUX19lbnRyeSgKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBfX3N0cmluZyhkZXYsIF9fZGV2X25hbWVfeGUoeGUpKQo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZmllbGQodTMyLCBs
ZW4pCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgX19maWVsZCh1NjQsIHZyYW1fYWRkcikKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2ZpZWxkKHU4LCBkaXIpCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKSwKPiArCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9mYXN0X2Fzc2lnbigKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2Fzc2lnbl9z
dHIoZGV2KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBfX2VudHJ5LT5sZW4gPSBsZW47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19lbnRyeS0+dnJhbV9hZGRyID0gdnJhbV9hZGRy
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IF9fZW50cnktPmRpciA9IGRpcjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCApLAo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFRQX3ByaW50aygiZGV2PSVzIGxlbj0leCB2cmFtX2FkZHI9JWxseCBkaXI9JXMi
LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBfX2dldF9zdHIoZGV2KSwgX19lbnRyeS0+bGVuLCBfX2VudHJ5LQo+ID52cmFtX2FkZHIs
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIF9fZW50cnktPmRpciA9PSBYRV9NSUdSQVRFX0NPUFlfVE9fVlJBTQo+ID8KPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIlRPX1ZS
QU0iIDogIlRPX1NSQU0iKQo+ICspOwo+ICsKPiArREVGSU5FX0VWRU5UKHhlX21pZ3JhdGUsIHhl
X21pZ3JhdGVfdnJhbSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9QUk9UTyhzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSwgdW5zaWduZWQgbG9uZyBsZW4sIHU2NAo+IHZyYW1fYWRkciwKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1OCBkaXIpLAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFRQX0FSR1MoeGUsIGxlbiwgdnJhbV9hZGRyLCBkaXIpCj4gKyk7Cj4g
Kwo+IMKgI2VuZGlmCj4gwqAKPiDCoC8qIFRoaXMgcGFydCBtdXN0IGJlIG91dHNpZGUgcHJvdGVj
dGlvbiAqLwoK
