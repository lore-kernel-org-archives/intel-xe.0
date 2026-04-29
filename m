Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5F0FF8875
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 20:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F44688C4C;
	Wed, 29 Apr 2026 20:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GL+JSeXB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8404C88C4C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 20:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777496115; x=1809032115;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+5Uhpu18wb7k9LVwtLY56FJ2YOWDSb96NQrB53B01sI=;
 b=GL+JSeXBtuYh3OXA4055+b/l6CibO3uIlf9vDfDOIucRDnY+NvXkg9RJ
 mBNRiEFDICKYVLd92OhOJZVs28i8E+FFcB2HEJxQqcmgVRK46H+xGmgL5
 0IhyLYq4L3l2z1lgZrUyqkgYqbpjmZEXBqAZa6k6PDbcNxA0+GK3zUUI3
 xLMR4SJBDEZ+hpmSEwpyBWmkPPIVBkRJC0Epic6HCnnpHSHNJdXd2ecNz
 L0FZg5MehrGqKMjbM5sibfH1L+jvu2M+qfEbD2XG0lJT3hmNW3Ejlh898
 vnbe5HY+edNuc5IJBaj3A1z8l2rGFf9wGd0+1d8ybAvg+wJJYbSt3hnEt w==;
X-CSE-ConnectionGUID: Oi8z40udRBG1Ghsv/KkJXA==
X-CSE-MsgGUID: /Ow4iVx2Txa0WbFcfCAz4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="95856701"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="95856701"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:55:15 -0700
X-CSE-ConnectionGUID: umCHNbgZQ+G/0uAQbvHneA==
X-CSE-MsgGUID: SqoD08hKR8STrzNRp1cFIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="264763181"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:55:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 13:55:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 13:55:13 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 13:55:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqjA2mT6PfXdiM1+V7z527fnkTga+0aCbCU/U1hQIB2DQoiAd00ZJtEts8JjdQSklCYLhxUeKrz7UGqkivJoO6oAdj0ELQYTTAiNyjeR4ELx0mqteJQOUQrhoFkc6vef94X4/o46nATtGIfWHK3OKwtuLub++YQw6IN0suGyJdrMkIdoX4GrynynNctvMV4NnUC2wHs91Z2waece+CVLGfkndgArNsyScLacE54bT1gJ5vZSfjTtC6MBbtTQUP1enHZXcSBx757crPboVZ+L5bVsuh1TX9ojUv3pHJu/MR2vhpumTvjTPv/7pwbrGILIJmOamAs2hPnCTftzLgK4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5Uhpu18wb7k9LVwtLY56FJ2YOWDSb96NQrB53B01sI=;
 b=QoSE+NtxM8mspMjT3iha1xOqh2u6r9Eyk9ohA3m5CMOoWNIgWjVhiYWBtZXtlttxxbVdzN45K7KaXxWPs3g02A4lLqEJbKr57gWP2Eca3GhFTtMM3HkLBQ3q7TZVUKhbMJLxCnydkXHlif4gKxBW6yc/5QslS5YG2AUR7NN3RaDZPr+sROHFKhl+BR7JAkbe4FVgXxTsHBZCf5Kddfw9Jd1vK7JrUpGkLXoZI3a6E1lrMoLGn+KAVdSmaSuknZqwpEWvR1KjuoAJbBV1+YzA5aygMpeMRnMaoE0eBjVCVJYiGvNngn5+uHwaEjRX2/iQf3xJEYlRdVTAShuBtWszOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB8263.namprd11.prod.outlook.com (2603:10b6:806:26d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 20:55:05 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 20:55:03 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Fix MMIO access using PF view instead of VF
 view during migration
Thread-Topic: [PATCH] drm/xe/pf: Fix MMIO access using PF view instead of VF
 view during migration
Thread-Index: AQHc2A2rM7/5/AczIEa2mcS/xSi0qLX2fIqAgAAFHwCAAAMcAA==
Date: Wed, 29 Apr 2026 20:55:03 +0000
Message-ID: <aac8f3a1b86c96e4e5804594cce32d47cc47afa1.camel@intel.com>
References: <20260429192259.4009211-1-shuicheng.lin@intel.com>
 <a2b00865f74aca893aa0d9a1af179b42f8dece63.camel@intel.com>
 <4975abb3-990b-462a-8eef-a376a6c14aad@intel.com>
In-Reply-To: <4975abb3-990b-462a-8eef-a376a6c14aad@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB8263:EE_
x-ms-office365-filtering-correlation-id: 3136432b-893d-4523-168d-08dea631961d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: xIOrakd6zM8tmfOVTVgTD4tsQA+ZAdkV/4duxB5NNslb3t2cyALtZrRwXHT5pQxlYUg2mbvN7L4tND3qfMljh1NunPPN3H/WdywnClk6e8095F5CPo3Vt5qC+m+kAUItS5jCysgiJSAJeGDaAHecfYxWjcpSfMnk2/vfmciDU4pHg1NeRL7eP0pq8/1Fbd2j/nLsgWsZ6z4RM7AmSlItyToaJxelEnJESE7quRcnoxWUVaQw3BoR5geZSARJsXwBAOnknuPw7HPjlrM+nWoWfPVKUsDwU4JslhOXpc+9G/RIIRai76ofDIcpM0mYBaLQIqwKlkjCK+5+gi5NSdiI3jR4BrLk5AOvOc9dEm9dwMKMtXgbKHiguerbWNgpWgM2R3P0bcjSHnDNRsiikF2HaVEg609gmeVS/PhzUOPWL/O0tdjpZAR88TXEQw86QQom/EHoZTj7uqFb6UG7SaMIv0p05C+rBwqZH4UrFSsOWAhPAt4JyHfWAhVdz/2bjmtHRQ9/USzRPRvAdoq4nXUKByMKhDdbpVjkMXlgKRZ8C/hU4JzxJnVRXi4cRxyRYZOl7+qoT0c73DX2e7wNrWihcMZrnqbS+2udxnVWcft4/Q0tNQtvUbNXQvpryyZBfpTuMR2AK+lAfFAvpTs9w2o4zNdNrTfPCrj8sOGc4SSsAaKCAP+BTnuiQsrmvU0bIftR7h6hywlRrZ2IlsQH/tjaq3Xbx/XITQSEIkNi7KbHoJH+AM0A1FvBuVxiC6h+4eHc8VWUfsSXVwawr1j2B50m5nKb/NRQFS5f9WFhyf7F0do=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWdNdTZDandrTFpxcTY2WWdtNDdxbXNUcFI3dWpIYzVZZkphMWgxbDNuZTRz?=
 =?utf-8?B?K2VUbVZTM3Z0UGZlTTVYUjVxR2ttTm5oSEx4N042UHRWcVBQTW05b2hadW9Z?=
 =?utf-8?B?QXJrRlFsMWFSRXZPWHhVVWdvT0tRd0hMOFMzcVhtdHdDM251c2VxTVExRzJh?=
 =?utf-8?B?WkxLNHJEZk1JTC9oWXNMcHB4OWpKcHJiUVZuUmsvQmxhbWpyeHI2Tk5ZOXpa?=
 =?utf-8?B?ZGMwOW1RNnNFczVsdnVBQ1lhcVpHRGFqWGVlblJzcHpGSjhUYU42UENOZWNQ?=
 =?utf-8?B?SVNRcDRQek1VY2JlandLWDJKV1Jrb3JhZzg0TkFLYmZZamRsSXZTay93bWsy?=
 =?utf-8?B?c2FRekhRblBKS3JqRGt3djFxK094NFlUWVhPaTRtbkk2RlFUditUTUJnQTMx?=
 =?utf-8?B?NEg0QlBBOUkrWjhvaUhNSlI5K0w0TXJ6ekdNdDN2S3l4ajVNMjRMcHFPUUFX?=
 =?utf-8?B?QmRsejlsNUVjdThWRDN1eSt1Tmh1dEREbU1xR05WN3l2WFBFdTRnQ21yN0pl?=
 =?utf-8?B?b3JDYnZsMUhVbkVrT21lVmxCN0dXcE93ZVlCMERqSFdDUkdvMUQ1R1NtSDh6?=
 =?utf-8?B?RDY5a1MyUHJDemswUmpnY3BVUFJCK0VWTEl5MEU5enRzTEsvSDJxd2dhLzRD?=
 =?utf-8?B?eGRWbFUyemp0dno0S2RZWnV5K2tyVERyRFJJNkI1N2dmVGM1bjNLQWtPeGZx?=
 =?utf-8?B?d0F6NU1Ia0dOOC9zZ3NPcWs3Tm5XcCtVem03TVZZNXlKOGVXRnpyRGxlZlBL?=
 =?utf-8?B?NTc5TlBvZHdzUDd4anAyKytva0xSZ3VVWnowTTJVQVMwMW01cWxPZEJ4SjNV?=
 =?utf-8?B?c1ROQUg1NFZjN21GMGJzbnErbGMxbDQwdEdTaDIycEVuSjhpUHdkQm1ab2NN?=
 =?utf-8?B?cFRHS3NaQVhZMHJQYWdnRkNCWVBuWnhnNVNUTitsQ2w1VTZ6RWVOZ3RqbE9C?=
 =?utf-8?B?b1Y4T2thYmo5ZmJaM0h0YXlMRGIxSTJxTUE5WGtyTHlPbFpFZHBIak5nYkJM?=
 =?utf-8?B?WFJSWDQ3U2pIU0FUbmlYeVJJUVBDL1kzK3ZnM2xDMGl3VTV6Tk1iNFhtb3lp?=
 =?utf-8?B?TjdxVFhHZkpwcXB3UFVBQTRmTE9nMTV4M3VXcldIOFk3cWZGQUs3UVpCb0lX?=
 =?utf-8?B?YlhaQlFaaGwwd3h6d29DTXh6R2ZoN3d5dDBLUVFVUlkrS0FPVGlXQ0NqbjBT?=
 =?utf-8?B?dWZCbExWTFA4eTVhTGRydVF0OWwrS0xzL0lvdnRXVEIvWC9MUkd4andhUlFX?=
 =?utf-8?B?QUJ1VXlyNy9XWmNiRGdDVXNZNjQ2dzVhUkRiaDRHcGZ3dzVzYjNMdStvbFJy?=
 =?utf-8?B?d0xzSWxaZmZNYlU0RStVb1J4b2FGZkFMR0JLR08xa3djWG50TElhdFMyL25j?=
 =?utf-8?B?L2Y0WkM1RHNpbG1OZWhSTmZyL0h2REpCREhpMzNtOEdSeVVLRkhPSGFFMFJu?=
 =?utf-8?B?UmZrVE93aFV6SXZDZ1hTaGhYV0h2VFZNTFE2akp5OTA1RWt3MldkSUNVNnlJ?=
 =?utf-8?B?UXRGbi9BTXR6WEIwczdJekV2YWhvZlYwZXVsSjlJZ1k1c3R3eW83SmMxYldM?=
 =?utf-8?B?WGZ0b3lFdVl0UDdKY3ZWd2JMYkRnRWhiK0ZSSkhHbWNOUGtPLzM5RzJnR2l4?=
 =?utf-8?B?cE5TbEMvM2xZRVd0amdKQlNvSEErSStwY3N5TmtTVzNsdUhRODJDWnprZ3lk?=
 =?utf-8?B?amtyM2k0eXpTMXg3ekM1NUpLV2thU2g5NnQ1dHF0NHE2SFJwN2Z3ZGtqbWo1?=
 =?utf-8?B?Qk5tMUQvQ21vblNNQ2EwOHkzUk5sVlM2Z0NyOHNKNHNWcXpkaGJGbnpzVmI4?=
 =?utf-8?B?NzRHS2dzQVZnckZXdG80YmR4WjVmdVdCSkF2b25mbk5NZVpiMkdoUFZ5dEE5?=
 =?utf-8?B?NlNOQnFXTitXUnU0bHZtRW5TWERNZDNyZEhETDlZWDhXU0FSQ1AzWkJENHE3?=
 =?utf-8?B?Zm1EVk91bk83SzBkOFFaRU1yTm9aU1A4RzM2d0VBWmRWSDBVQ2VvN3I5c0pa?=
 =?utf-8?B?SmxrVlAwS2NkamNKR0wxckc5dkFoN2lwTkQ5eWdPenZnU1VjT3hNSjFUdlpF?=
 =?utf-8?B?OTFoM0FyYUZTYWdGNFpPajFzWjc4R3hMQ2Z1d2JFeUJ6bU43MWNCR3VhYUht?=
 =?utf-8?B?OGVtR0p3MWRzZzR3TmNDck0xRlBFK0wrVC9XQlc4WlV4SXpEWWZFSjczbzZl?=
 =?utf-8?B?dHlsK1puaDl3aks5ZHBvSFFTcXdxbEVqTXFCanVCdnFiMmZGdDgvMUQ1Z3Yx?=
 =?utf-8?B?TWpkU1FiMU9MR0dJTVFDSkZZdVFKUXQvTVVGNW05elJuY3l4M1J5N2U0T05v?=
 =?utf-8?B?RG95WEdyQ1ZSbm00VlcrZEsrVERVUnZIUXdIVml3aVR2a25rYXBCaVp2aStt?=
 =?utf-8?Q?drRDjPL7+8TqXiUY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7016925B8D24A43995A29FDD7ABDAAC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Itv5RYDT9NPHr93LG59OrSk0Dp4efR4/AwVdyleun+1RdDwDNvBRl+0V1bxxFQi9ysuhqqXlcDyAd1SOkCt3wKZgRq4DjP44JsbGTWuyUpXyQugVDEYEH+mebvW8ONKxCMXPlAx/b18PCEEW9cD6b4hZhpvcW/1zg0n3R2FIWiklvxMWGWV/srRIpiDTphKmPMUaax+AJmX7hiCR4fqtS8ZLLq7iYhnWlG8kRDKsoIVxsSi4xOOXoPqK0WejvZDUnKw/AFfOhvRT/g/9TJYhUi9cmeosuVipQ1GRoxI+0zxO2+3EViuTyhnxcCmR4QII6hxpSnMezhS+gdXcFpKw3g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3136432b-893d-4523-168d-08dea631961d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 20:55:03.5047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ojStS2THwNzvDyo0yaiVwdAbhMnWmIeJMyo2FwTE29n3RJd+KxESAK8qzYtJEex/0A3k6U6isAS0JMxpaO11nPQljIgw3YAfEUmpci9dYC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8263
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

T24gV2VkLCAyMDI2LTA0LTI5IGF0IDIyOjQzICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiANCj4gDQo+IE9uIDQvMjkvMjAyNiAxMDoyNSBQTSwgU3VtbWVycywgU3R1YXJ0IHdyb3Rl
Og0KPiA+IE9uIFdlZCwgMjAyNi0wNC0yOSBhdCAxOToyMiArMDAwMCwgU2h1aWNoZW5nIExpbiB3
cm90ZToNCj4gPiA+IHBmX21pZ3JhdGlvbl9tbWlvX3NhdmUoKSBhbmQgcGZfbWlncmF0aW9uX21t
aW9fcmVzdG9yZSgpDQo+ID4gPiBpbml0aWFsaXplIGENCj4gPiA+IGxvY2FsIFZGLXNwZWNpZmlj
IE1NSU8gdmlldyB2aWEgeGVfbW1pb19pbml0X3ZmX3ZpZXcoKSBidXQgdGhlbg0KPiA+ID4gcGFz
cw0KPiA+ID4gJmd0LT5tbWlvICh0aGUgUEYgYmFzZSkgdG8gYWxsIHhlX21taW9fcmVhZDMyKCkv
eGVfbW1pb193cml0ZTMyKCkNCj4gPiA+IGNhbGxzIGluc3RlYWQgb2YgdGhlIGxvY2FsICZtbWlv
LiBUaGlzIGNhdXNlcyB0aGUgUEYgb3duIFNXIGZsYWcNCj4gPiA+IHJlZ2lzdGVycyB0byBiZSBz
YXZlZC9yZXN0b3JlZCByYXRoZXIgdGhhbiB0aGUgdGFyZ2V0IFZGDQo+ID4gPiByZWdpc3RlcnMs
DQo+ID4gPiBzaWxlbnRseSBjb3JydXB0aW5nIG1pZ3JhdGlvbiBzdGF0ZS4NCj4gPiA+IA0KPiA+
ID4gVXNlIHRoZSBWRiBNTUlPIHZpZXcgZm9yIGFsbCByZWdpc3RlciBhY2Nlc3NlcywgbWF0Y2hp
bmcgdGhlDQo+ID4gPiBjb3JyZWN0DQo+ID4gPiBwYXR0ZXJuIHVzZWQgaW4gcGZfY2xlYXJfdmZf
c2NyYXRjaF9yZWdzKCkuDQo+ID4gPiANCj4gPiA+IEZpeGVzOiBiN2MxYjk5MGY3MTkgKCJkcm0v
eGUvcGY6IEhhbmRsZSBNTUlPIG1pZ3JhdGlvbiBkYXRhIGFzDQo+ID4gPiBwYXJ0DQo+ID4gPiBv
ZiBQRiBjb250cm9sIikNCj4gPiA+IENjOiBNaWNoYcWCIFdpbmlhcnNraSA8bWljaGFsLndpbmlh
cnNraUBpbnRlbC5jb20+DQo+ID4gPiBDYzogTWljaGFsIFdhamRlY3prbyA8bWljaGFsLndhamRl
Y3prb0BpbnRlbC5jb20+DQo+ID4gPiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQu
Ng0KPiA+ID4gU2lnbmVkLW9mZi1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRl
bC5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogTWljaGFsIFdhamRlY3prbyA8bWljaGFsLndhamRl
Y3prb0BpbnRlbC5jb20+DQo+IA0KPiA+ID4gLS0tDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndF9zcmlvdl9wZl9taWdyYXRpb24uYyB8IDggKysrKy0tLS0NCj4gPiA+IMKgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zcmlvdl9wZl9taWdyYXRpb24u
Yw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfbWlncmF0aW9uLmMN
Cj4gPiA+IGluZGV4IDg3YTE2NGVmY2MzMy4uMDFmZTAzYjllZmU4IDEwMDY0NA0KPiA+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3BmX21pZ3JhdGlvbi5jDQo+ID4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfbWlncmF0aW9uLmMNCj4gPiA+
IEBAIC0zODUsMTAgKzM4NSwxMCBAQCBzdGF0aWMgaW50IHBmX21pZ3JhdGlvbl9tbWlvX3NhdmUo
c3RydWN0DQo+ID4gPiB4ZV9ndA0KPiA+ID4gKmd0LCB1bnNpZ25lZCBpbnQgdmZpZCwgdm9pZCAq
YnVmDQo+ID4gPiDCoA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICh4ZV9ndF9pc19tZWRpYV90
eXBlKGd0KSkNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZm9yIChuID0g
MDsgbiA8IE1FRF9WRl9TV19GTEFHX0NPVU5UOyBuKyspDQo+ID4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZ3Nbbl0gPSB4ZV9tbWlvX3JlYWQzMigm
Z3QtPm1taW8sDQo+ID4gPiBNRURfVkZfU1dfRkxBRyhuKSk7DQo+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZ3Nbbl0gPSB4ZV9tbWlvX3JlYWQz
MigmbW1pbywNCj4gPiA+IE1FRF9WRl9TV19GTEFHKG4pKTsNCj4gPiANCj4gPiBHb29kIHRvIGdl
dCBmZWVkYmFjayBmcm9tIE1pY2hhbCBXYS9NaWNoYWwgV2kgaGVyZSwgYnV0IEkgZG9uJ3Qgc2Vl
DQo+ID4gYW55DQo+ID4gdXNhZ2Ugb2YgdGhlc2UgTU1JT3MgZnJvbSB0aGUgVkYgaW4gdGhlIGRy
aXZlci4gQXJlIHRoZXNlIGV2ZW4NCj4gPiBleHBvc2VkDQo+ID4gdG8gdGhlIFZGPyBUaGlzIHNl
ZW1zIHVuc2FmZSBmcm9tIHdoYXQgSSBjYW4gc2VlLi4uDQo+IA0KPiBzZWUgeGVfZ3VjX21taW9f
c2VuZF9yZWN2KCkNCg0KT2sgZ290IGl0IGFuZCBtYWtlcyBzZW5zZS4gSSB3YXMgc2VlaW5nIGFs
c28gdGhlIGd0LT5tbWlvIGluDQp4ZV9ndWNfbW1pb19zZW5kX3JlY3YoKSBidXQgSSBzZWUgdGhh
dCBpcyBjYWxsZWQgZnJvbSB0aGUgVkYgYXMgd2VsbCwNCnNvIGdvb2QgdG8gYWxpZ24gdGhlcmUu
DQoNClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29t
Pg0KDQo+IA0KPiA+IA0KPiA+IENhbiB5b3Ugc2hvdyB0aGUgZXJyb3IgeW91IGFyZSBzZWVpbmcg
c3BlY2lmaWNhbGx5Pw0KPiANCj4gaXQgbWlnaHQgYmUgaGFyZCB0byBjYXRjaCB0aGUgVkYgZHJp
dmVyIGluIHRoZSBtaWRkbGUgb2YgdGhlDQo+IE1NSU8gY29tbXVuaWNhdGlvbiwgd2hpY2ggdXN1
YWxseSBpcyBkb25lIG9ubHkgZHVyaW5nIHByb2JlDQoNClllYWggbWFrZXMgc2Vuc2UuLiB3YXMg
YWxzbyB3b25kZXJpbmcgYmFzZWQgb24gdGhlIGNvbW1pdCBtZXNzYWdlIHdoaWNoDQppbmRpY2F0
ZWQgY29ycnVwdGlvbi4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+ID4gDQo+ID4gVGhhbmtz
LA0KPiA+IFN0dWFydA0KPiA+IA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGVsc2UNCj4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZm9yIChuID0gMDsgbiA8IFZGX1NXX0ZMQUdf
Q09VTlQ7IG4rKykNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmVnc1tuXSA9IHhlX21taW9fcmVhZDMyKCZndC0+bW1pbywNCj4gPiA+IFZGX1NX
X0ZMQUcobikpOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZWdzW25dID0geGVfbW1pb19yZWFkMzIoJm1taW8sDQo+ID4gPiBWRl9TV19GTEFH
KG4pKTsNCj4gPiA+IMKgDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+ID4gPiDC
oH0NCj4gPiA+IEBAIC00MDcsMTAgKzQwNywxMCBAQCBzdGF0aWMgaW50IHBmX21pZ3JhdGlvbl9t
bWlvX3Jlc3RvcmUoc3RydWN0DQo+ID4gPiB4ZV9ndCAqZ3QsIHVuc2lnbmVkIGludCB2ZmlkLA0K
PiA+ID4gwqANCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoeGVfZ3RfaXNfbWVkaWFfdHlwZShn
dCkpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAobiA9IDA7IG4g
PCBNRURfVkZfU1dfRkxBR19DT1VOVDsgbisrKQ0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9tbWlvX3dyaXRlMzIoJmd0LT5tbWlvLA0KPiA+
ID4gTUVEX1ZGX1NXX0ZMQUcobiksDQo+ID4gPiByZWdzW25dKTsNCj4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfbW1pb193cml0ZTMyKCZtbWlv
LCBNRURfVkZfU1dfRkxBRyhuKSwNCj4gPiA+IHJlZ3Nbbl0pOw0KPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoGVsc2UNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZm9yIChuID0g
MDsgbiA8IFZGX1NXX0ZMQUdfQ09VTlQ7IG4rKykNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfbW1pb193cml0ZTMyKCZndC0+bW1pbywgVkZf
U1dfRkxBRyhuKSwNCj4gPiA+IHJlZ3Nbbl0pOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9tbWlvX3dyaXRlMzIoJm1taW8sIFZGX1NXX0ZM
QUcobiksDQo+ID4gPiByZWdzW25dKTsNCj4gPiA+IMKgDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIDA7DQo+ID4gPiDCoH0NCj4gPiANCj4gDQoNCg==
