Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0012C25B7C
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 17:39:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB2010F013;
	Tue, 21 May 2024 17:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2pWOriw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FC610F013
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 17:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716313163; x=1747849163;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=F8ADijA8daFYG2bchYvbzuLXq6CGMV6nOes1TNt2E6o=;
 b=F2pWOriw7Ce9lKsKATYUCb4qA88jXJSLmfPx0pqvSvOrZUo3TxrTMK4B
 0u6B3IfctLF3YSwQq3XSqDPj6zMewjoAdh9+ZzU4DM1PwFdScVCC+y7Qt
 xC6ZZC7+P+umAasAYBg+1Dh+V91Oob9QzehMxH07wLpl1UV5K66j96Yf6
 1OeDyZjtDZg3h1vQK5DJllyJs+H/wL2/qwCy+KCZ1YctDU5Skv146S2q2
 c28wUPwa+v1D9mbmWcJDPsngr7e3cWz4bjUub2ULE+cYpphGuP+nePbaB
 ro4T3atN5/2FY3ghLJo2BR0h4JMw6XIuVM//pmxN1kUGhluRnae+wlcYy w==;
X-CSE-ConnectionGUID: eIJVk2DYTHqWJwUiRdD3RQ==
X-CSE-MsgGUID: vL9jGLtCTOK3NUQjSmA75A==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12707737"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12707737"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 10:39:22 -0700
X-CSE-ConnectionGUID: BYt5qMMuRl2B5nimtcMXMw==
X-CSE-MsgGUID: fR7TVw5EQjSMG5x5sFT3jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="63833715"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 10:39:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 10:39:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 10:39:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 10:39:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 10:39:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ic3LvhQNcGnniCaMgL66ByO3xjNZrdxNmZihCmwPTTifWr59YfztStsaCeP5HVjiKFabKJweGN3j6bIE4U1QBfXjsPavUBy+++9XCONj35Knwsl9QyJrL0OQXGjbu965kLlEFWCL5mNcnzQK/DSIzI6OUPG+c3nz8bZuhwyPeXA+XdXhro312MmUKynNgUMlwpQUwnsEFomP7uJ1fPx087jOLUAUMzY7782S7IQoS4YXfIzZreKD2T36iZO5j79LCJO0/psAcVRiewZJK5YvPWL4KYuq/vHV2JD8FNJnAl3pRayV0Iwk+5/HD+VPfwnJgBo7tGenIeDR7hgCkiRbYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8ADijA8daFYG2bchYvbzuLXq6CGMV6nOes1TNt2E6o=;
 b=W0+syew64wrggQWE3X33DlqBawr8O/VDeDzwg3obaiwpt/altQg7xti7itzqoAAQpTAO0Gnu/dKXJqalYkH3G1YO0xsSEBIYXAiu0OJV0SGA9FzSJS8BYakmtdvjypgENl1ba6l+CNWfUkQfSrEjZdANs4FR3KwWzOOCCGWnTMQUOFgd50GozTtocD4NVLp/15YKHWUL/qe1bupdcK7niQGNTMPjVyIJipHeN33ayV+DOua/YsoKSRcwPtEmSp4nHr4v42/Xme/zyDKiJlL6Vdt8b+cSVyguQPcOhz6ennPUyrXL07Ye8XLtosBlfxuPQOe0H9DEsegjKbWMi5pxrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Tue, 21 May
 2024 17:39:17 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7587.028; Tue, 21 May 2024
 17:39:17 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 00/17] Add OA functionality to Xe
Thread-Topic: [PATCH 00/17] Add OA functionality to Xe
Thread-Index: AQHadnkcIUwutN2VakWosatViFIW8bGcJwYAgAB1PYCABZE6AIAAAUuAgAAW/ICAAAV7AIAAA74AgAAPqAA=
Date: Tue, 21 May 2024 17:39:17 +0000
Message-ID: <d7af155a3fa20d1e003f5c5ed3ca6abb839bda97.camel@intel.com>
References: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
 <438b276a653bf56fe1e0e131709d615dec86ae3e.camel@intel.com>
 <87frufuc96.wl-ashutosh.dixit@intel.com>
 <96d03111d07e8182e7ecb3c0ca1942c7fef22e6f.camel@intel.com>
 <595ea35d63cd92777b36f6ab87cd1f6483a4b38f.camel@intel.com>
 <851q5v2ljw.wl-ashutosh.dixit@intel.com>
 <8f86d8ea1d555e8261aab25bda0011ff96698522.camel@intel.com>
 <85zfsj15gf.wl-ashutosh.dixit@intel.com>
In-Reply-To: <85zfsj15gf.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB4782:EE_
x-ms-office365-filtering-correlation-id: 13357e93-3900-4bbe-f693-08dc79bcf092
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?VzMvbGN0VDJ4WFpuNWt3RHVBcHhoNjJnMy96dER3M1FXeEF0MW9kVnA0NCs2?=
 =?utf-8?B?dWdtK3BoQzMrN1lGVzFDY2tiMjFOTEFEWXhLVGZhTGRxZ0JrR1VhNHNNanN2?=
 =?utf-8?B?RVlnNnpGU2ZjQ21UVkw4NW1hS09qQnRRYzJ1TWdzSjh0RnVOVVFVelpnbmh2?=
 =?utf-8?B?UThmSFd4ZDg0cUg3SFI1Z0NjeWd2clVna0lIT1VmcENMdG9KSUZ4U0c2SlZZ?=
 =?utf-8?B?RU0yUVpnTnBMdkJHTGZ6WFAwcDVDRmFNUm5zNGRmcGNqcEdTR2tpcVF1TmZT?=
 =?utf-8?B?bG8yMHZ4STBkbis1bHlDcWx5UU5VYlg0U1pydjdGY3NPYXZKWE41Ym9KRXk4?=
 =?utf-8?B?UXZvekFvVlJZeTU4M0tGcjBqMU03OGloTGl6dFdwNlQ0ZURyYjNYc3BwMkxF?=
 =?utf-8?B?ZnB3R2dGVmQ4VlhqQ09iMnNIUW9hTVpnSFF0YytWbWxpWWVoUlpPbHhFSTYz?=
 =?utf-8?B?anRheWNXRXFRZ1YyWDlQWXdOSklEWFNpTURPYzVpWXZDTENzSFhuMGM0NjNW?=
 =?utf-8?B?SUl5SDNSRTVMZWJkSURVOWFoSmtTTk1Da3R2YnlYRDhKRHhVR0JVTHc1a0k2?=
 =?utf-8?B?OW5RblhDdzRSK0RyTnpOTDczYXBPc1J2emdFdXZLMk81aGx0NE40VTgraVhr?=
 =?utf-8?B?MkhVYzExUy9MTm5XdFNEc0xqQ000ZEhiRi9RUThrVUpXdWlWWXZNTGNjdFov?=
 =?utf-8?B?YjUwQmpENCtpVDUySEJZYlVuclByd2VMQUdtUmZNa0ZSREVQMm1ZbVRNcHRn?=
 =?utf-8?B?SHRLbWFwSS9TN1hmYW1rYS9CSFFPQjFqUDIvK2pXOXNyUEpIdnNFa2JzNTVs?=
 =?utf-8?B?cm5jRE1Lamkzdk5QM3hncjgrRkZ6S29VRUc2QUlHcDF0ay9rZm5zNHU2K1Zj?=
 =?utf-8?B?S3NjcnlpKzdGSHFWUldQT3R2bmxyNWdoUmhNSWExd1o0V2VUSnVJR2didE9v?=
 =?utf-8?B?MER1RU5kVXhTVGYvTUNmYWNJYjFubFhYSmt5QnRSN1EyU05wQzYzSlB1Z2xE?=
 =?utf-8?B?NE5aRGdYclFydzJsWDVWWFlOeFJOTFVLSW9aOGt3RUpXV05yeHJCbkZrOTRq?=
 =?utf-8?B?R0hEaFphQUlGK2kvZFRPSys0YUp5ODdBMXJqZ0JCNXVFR0EyNWsrRysyRFN1?=
 =?utf-8?B?Tm1BanlFSmpOaEt3K0dlVDNUNllYOEhwbXI0Y01OU09ldmtVNitTbnRyaFFz?=
 =?utf-8?B?YWZZZzRiS3JDeG9EYTVoNUoxMnVkTDlTU1Z2bWFyMUJGeG1Zcm16TThvUFNR?=
 =?utf-8?B?bGVuOGVBY3IwdFJxWjh1Mm1PdHd0cTk1OUh0WkxINmpUdGtZaWhsZzZ4bU9T?=
 =?utf-8?B?SDZWdTNlWExaVER4aDZnTkNleWNYZUk1NUVNWlFJU3JDTWc3VzlvVnN2cTl0?=
 =?utf-8?B?VjlLUlBXUFRQc1YzRWlwN2lQYUg5RUtxdDRJdEVZKzF3cGRJbmQyUVI0clZH?=
 =?utf-8?B?QURnLzAwTWY5a2YvWnV2QThFYlIzTmFuNkJndk5jNHNtVnpteVlUVGd0OXYy?=
 =?utf-8?B?Sm9PN2M3MTZwQmU2aFY0NHNWVWlLSENqSXVldkMxWmpUY3JnME1kOFVqVHJ4?=
 =?utf-8?B?SHBpay9LRHJ0dEVmQWhmZ3FJeEZMb3liNStueTBwSnMyZUtISWJVcUJpZ0NG?=
 =?utf-8?B?a2VtM0ZjT1kweGpsWmdCUnZHQVJJaDU3MTc4SGZmNlgrNE1QSTdSM1RJNVpD?=
 =?utf-8?B?VnJ1OWFSQ0VlNTA3YWFjVHgzaHcrYmhHOWJScUVTUlRUQ1Rlc0orQWt0WFRu?=
 =?utf-8?B?eWZMYzluTGRCR0FLaHpaMzZYN3U2Vk92VzhubTI2VDc0cTgzcXdLUklYKzNo?=
 =?utf-8?B?em9MUHkzc2VFZG8wZG9KUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amxFRHJoU29ZNDZDYjQwbW9tNkk3K3V1enJEOTlKU2ZDRldvUk45S1hVUXJS?=
 =?utf-8?B?WUVSdE1ER1FvZlRQRjQ0eUM5N0hwNGdBR2U4T0dlbnpBSjRaVWhpaG1FWkZq?=
 =?utf-8?B?S25ndlpCem5VVk0yNkpKRzF2aGtqcER4Ujd4a3htOHpoT2JXUDQxMm5TbGRZ?=
 =?utf-8?B?ZHJwSWhTK0sySWxEZmVUZUNFYWZQc0lIYzRjbmdYS2YxTFl2Rk1lemh3VllF?=
 =?utf-8?B?OEQvSkltcEkzYTU0S3A3WStGaFNOZHora0pJSTJQdmZKM3NDVGlmQ2ZhYzlX?=
 =?utf-8?B?ekFwQ2ljcU5QWDZKUUJnNy9uQWFKR1BFV2N5eVYvOURyNk9yWGRGRkxRVDY5?=
 =?utf-8?B?WGRYWlBybFlGZmxxTU53RXFwMWd2c21YbTJPNk85RGMwR25kd1AwZG5TMU91?=
 =?utf-8?B?dVNEYWczTGJ0UUFydzlHeUhvMGlHWDVOL3NXSVFSbTh0NjN3RXYra3dJcFpY?=
 =?utf-8?B?SGpqSGVoRlRjODhzU2cvVDhBeGV1V1RZSEo3OUk1c3ZLbWJlQkNOMzFtdkZM?=
 =?utf-8?B?SnZoOHFVMXFkMlhITTl2M0Y1a0J1Mkx1OUJsY1U4SXNGTk5PcFJ5QnZDVksw?=
 =?utf-8?B?enpGUDhJcy9jOWI3SVlwQUdYTWhrQjJtc0hNSzU5ZUhuU0pPQ1lWSC9seHo4?=
 =?utf-8?B?UlJ6SXV4bURBbDJHZ20wck9KUkpCN0o4OHIvbForWnJxQ1NHdXV2YitsVDdT?=
 =?utf-8?B?clUrb0k4RHZidi8zYW5MMW1qdG5PSmpEVkgwQnNVT2xhb3pOYUVFcEdIZ2FP?=
 =?utf-8?B?dzhLaGJhQlQ0T0dxYTFZZnRnZGlRanhNd1FwWFl5dnFBY3lUOXVJMmw5V0dp?=
 =?utf-8?B?L2owT0Iyb3ZyNFdjTkRNL1dXSkVVRjZ1RURsNEI0SFpnM28xWU1manFlZ3Vt?=
 =?utf-8?B?ZEpmbUx6RVo5czcwVHhacG1FNEJyZ1ppOGwySXcvaC9wVEJIdGlHd0xzVzBB?=
 =?utf-8?B?Vzl3dUNQVWhYNkZlOXJZcHhETk93ZDFTYlhZWklOSkFTakxJUnhzSlBXUDhG?=
 =?utf-8?B?UmRsTzh6QXBjWmZxQTNoM1AvTm1zeWw0WEhCNnBzZ21yVUtnUVdBeEtXRmtX?=
 =?utf-8?B?bEhkWldSSC9GejNpZW1vZitjendYWG0wYlBvaVdtWHQ0ZEc2T3FBaGtiRmww?=
 =?utf-8?B?THpMbUIzZ1p2WmczQUkzNkVUR08vMjlIeWZpc05VYlUvRXJmMmZhVndpbFdE?=
 =?utf-8?B?UFE1RjRxQmlOOVFETktrempjRU1xRlJ0WW9wcHQ0Zm5ZSnJTcUJYUGRNM1ZJ?=
 =?utf-8?B?VmY2SXlnOFFNUTlqcHVBU2Q0QzBLYi9ZdHJoYTlKdmErMCs2K2FEQUNQMUNn?=
 =?utf-8?B?cnROckE2bGE0R09ycmFDUHdwdU5XUUZZUWxTcFZQVWJWSXV4VjFVME1Yazha?=
 =?utf-8?B?ZVJRUTRkMjJURHBiYlZnNERHTTg3MW9hNERNWnlVRXhUMUxUc0lzQys3UU1i?=
 =?utf-8?B?OVhGeVoweG5hcnROZ2dnZ2creStUelRLMzgyRHBxNEM2QWt0cUdCaE1PSks1?=
 =?utf-8?B?MFc1QWdncG4vVFRYc2gwRWNKeER5NnpiQjRkR3dhR0pMbzFJeEdCOUtqcFlk?=
 =?utf-8?B?TUJJeFNta2diWjZETDBLSGNRSGZXR201N2lRQTJRZklxREZhWVhicHRwcGM3?=
 =?utf-8?B?cWh0d25oTm5RVlBXcDZ4TURIRHNZUTk4MklEeFRSVWl6UW50WnJETnFjSDRQ?=
 =?utf-8?B?MmZZcGpyT0V0UnhtMFNYdVU1V0NmNWVETnczaTBrSzVGYnMwMjdVOXpKZkh1?=
 =?utf-8?B?Mkd5N1A0VHpINUpJUTBtUjNTd1RxMVV4WnRaa1pkRnZNamVSZlhranExTEtG?=
 =?utf-8?B?ckI3ZTU3dVY2U3VGRElvdm01ZHVqamVCNEFkR1RMK2ZQbGNDWWkxUzVzTEp0?=
 =?utf-8?B?U1kzbnFxK0VFT2I5SHdtRmNDK3RsUXBwdmlRL0ZNQTZKVVVNeFdVbktGVGE0?=
 =?utf-8?B?eWl1SGdjcUxGODd4MjhkWFNBL0p0U2Zsd2lLVDdhQTRzbS9QQTJzTzc0eDlF?=
 =?utf-8?B?Sk42NXNSNGNkSmQraVdNMTFSd01kM3hMRWJYRmJrTVRadlkrek9vNEN1SERE?=
 =?utf-8?B?Zis0c25vU21WblV4Vk9EWmRNcXlhVG1iTkNZekJ1cEJ4cktYUTZmOHJHN2NO?=
 =?utf-8?B?WXY4ZFlodmJKZzRmZCtia3Q2ZXFJNm5Nb1ZUUTZDMEdnQkdzbDdiTXZEYkx3?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBEA26744D7BDF4489721CD12F6C4713@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13357e93-3900-4bbe-f693-08dc79bcf092
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 17:39:17.6423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SBj5nkMWjhvvYHlfCfFOy6lEPz5aMzDIHu4ZcNuR5nH+WwKxCArWlPJhGxoucrl11l/x9eN8h8jtigYr6lsw7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
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

T24gVHVlLCAyMDI0LTA1LTIxIGF0IDA5OjQzIC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFR1ZSwgMjEgTWF5IDIwMjQgMDk6Mjk6NTEgLTA3MDAsIFNvdXphLCBKb3NlIHdyb3Rl
Og0KPiA+IA0KPiA+IE9uIFR1ZSwgMjAyNC0wNS0yMSBhdCAwOToxMCAtMDcwMCwgRGl4aXQsIEFz
aHV0b3NoIHdyb3RlOg0KPiA+ID4gT24gVHVlLCAyMSBNYXkgMjAyNCAwNzo0Nzo1OCAtMDcwMCwg
U291emEsIEpvc2Ugd3JvdGU6DQo+ID4gPiANCj4gPiA+IEhpIEpvc2UsDQo+ID4gPiANCj4gPiA+
ID4gPiBPdGhlciBhc2ssIGNhbiB5b3UgcmVtb3ZlIHRoaXMgJ0ZhaWxlZCB0byByZW1vdmUgdW5r
bm93biBPQSBjb25maWcnDQo+ID4gPiA+ID4gZGVidWcgbWVzc2FnZSBmcm9tIHhlX29hX3JlbW92
ZV9jb25maWdfaW9jdGwoKT8NCj4gPiA+ID4gDQo+ID4gPiA+IE1pc3NlZCAnSW5zdWZmaWNpZW50
IHByaXZpbGVnZXMgdG8gcmVtb3ZlIHhlIE9BIGNvbmZpZycsIHRoYXQgbmVlZCB0byBiZQ0KPiA+
ID4gPiByZW1vdmVkIHRvbyBmcm9tIHhlX29hX3JlbW92ZV9jb25maWdfaW9jdGwoKS4NCj4gPiA+
ID4gDQo+ID4gPiA+ID4gTWVzYSB3aWxsIGJlIHVzaW5nIERSTV9YRV9QRVJGX09QX1JFTU9WRV9D
T05GSUcgd2l0aCBjb25maWcgaWQgc2V0IHRvDQo+ID4gPiA+ID4gVUlOVDY0X01BWCB0byBkZXRl
Y3QgaWYgWGUgS01EIHN1cHBvcnRzIE9BIGNvdW50ZXJzIGFuZCBpZiBhcHBsaWNhdGlvbg0KPiA+
ID4gPiA+IGhhcyBlbm91Z2ggcGVybWlzc2lvbnMgdG8gdXNlIGl0LiAgU28gaXQgY2F1c2VzIGRt
ZXNnIHRvIGJlIGZsb29kZWQNCj4gPiA+ID4gPiB3aXRoICd4ZSAwMDAwOjAwOjAyLjA6IFtkcm06
eGVfb2FfcmVtb3ZlX2NvbmZpZ19pb2N0bCBbeGVdXSBGYWlsZWQgdG8NCj4gPiA+ID4gPiByZW1v
dmUgdW5rbm93biBPQSBjb25maWcnIG1lc3NhZ2VzIHdoZW4gcnVubmluZyB0ZXN0cyBzdWl0ZXMu
DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gT3IgZG8geW91IGhhdmUgb3RoZXIgc3VnZ2VzdGlvbiBv
ZiB1QVBJIHRoYXQgSSBjYW4gdXNlLg0KPiA+ID4gDQo+ID4gPiBPSywgc28geW91IGFyZSByZWx5
aW5nIG9uIEVOT0RFViBhbmQgRUFDQ0VTIGVycm5vJ3MgZnJvbQ0KPiA+ID4gRFJNX1hFX1BFUkZf
T1BfUkVNT1ZFX0NPTkZJRyB0byBmaW5kIG91dCAoYSkgaWYgT0EgaXMgcHJlc2VudCBhbmQgKGIp
IGlmDQo+ID4gPiB5b3UgbmVlZCB0byBiZSByb290IChhY3R1YWxseSBDQVBfUEVSRk1PTiBvciBD
QVBfU1lTX0FETUlOKS4NCj4gPiANCj4gPiB5ZXANCj4gPiANCj4gPiA+IA0KPiA+ID4gVGhpcyBs
b2dpYyBpbiBYZSBzaG91bGQgYmUgY2xvc2UgdG8gd2hhdCB3ZSBoYXZlIGluIGk5MTU/IFdoYXQg
ZG9lcyBNZXNhIGRvDQo+ID4gPiBmb3IgaTkxNSwgb3Igd2hhdCBkb2Vzbid0IHdvcmsgaW4gWGU/
DQo+ID4gPiANCj4gPiA+IEhlcmUgYXJlIHNvbWUgcG9pbnRlcnM6DQo+ID4gPiANCj4gPiA+ICog
WW91IGNhbiBleGVjdXRlIERSTV9YRV9ERVZJQ0VfUVVFUllfT0FfVU5JVFMgdG8gc2VlIGlmIE9B
IGlzIHByZXNlbnQNCj4gPiA+IA0KPiA+ID4gKiBBZGQvcmVtb3ZlIE9BIGNvbmZpZ3MgYW5kIHVz
aW5nIHRoZSBnbG9iYWwgT0FHIGJ1ZmZlciAodGltZSBiYXNlZA0KPiA+ID4gICBzYW1wbGluZyBv
ciBEUk1fWEVfT0FfUFJPUEVSVFlfU0FNUExFX09BIHNldCkgYXJlIHByaXZpbGlnZWQgb3BlcmF0
aW9ucw0KPiA+ID4gICAobmVlZCByb290KS4gT3BlcmF0aW9ucyB3aGljaCBvbmx5IG5lZWQgT0FS
L09BQyAoT0EgcXVlcmllcywgd2l0aG91dA0KPiA+ID4gICBEUk1fWEVfT0FfUFJPUEVSVFlfU0FN
UExFX09BKSBjYW4gYmUgZXhlY3V0ZWQgYnkgbm9uLXJvb3QuDQo+ID4gPiANCj4gPiA+ICogSWYg
Ii9wcm9jL3N5cy9kZXYveGUvcGVyZl9zdHJlYW1fcGFyYW5vaWQiIGlzIDAsIGFsbCBvcGVyYXRp
b25zIGNhbiBiZQ0KPiA+ID4gICBleGVjdXRlZCBieSBub24tcm9vdCB1c2Vycy4gT3RoZXJ3aXNl
LCBhcyBJIGRlc2NyaWJlZCBpbiB0aGUgcHJldmlvdXMNCj4gPiA+ICAgcG9pbnQuDQo+ID4gDQo+
ID4gSXQgaXMgcG9zc2libGUgdGhhdCBwcm9jZXNzIG5vdCBzdGFydGVkIGJ5IHJvb3QgaGFzIENB
UF9QRVJGTU9OOg0KPiANCj4gWWVzLCBjb3JyZWN0Lg0KPiANCj4gQWJvdmUgSSBhbSB1c2luZyAi
cm9vdCIgbG9vc2VseSBhcyAiQ0FQX1BFUkZNT04gb3IgQ0FQX1NZU19BRE1JTiIuDQo+IA0KPiBT
byBpZiByb290IHNldHMgJ3BlcmZfc3RyZWFtX3BhcmFub2lkJyB0byAwLCBub3JtYWwgdXNlcnMg
Y2FuIGRvIE9BDQo+IHByaXZpbGlnZWQgb3BlcmF0aW9ucyAoYXMgZGVzY3JpYmVkIGFib3ZlKS4N
Cj4gDQo+IElmIHJvb3Qgc2V0cyAncGVyZl9zdHJlYW1fcGFyYW5vaWQnIHRvIDEsIG9ubHkgQ0FQ
X1BFUkZNT04gb3IgQ0FQX1NZU19BRE1JTg0KPiB1c2VycyBjYW4gZG8gT0EgcHJpdmlsaWdlZCBv
cGVyYXRpb25zLg0KDQpvaCBva2F5IHNvIHBlcmZfc3RyZWFtX3BhcmFub2lkIGhhcyBhIGdvb2Qg
dXNhZ2UgYnV0IGl0IGRvIG5vdCBjb3ZlcnMgQ0FQX1BFUkZNT04sIHNlZSBiZWxvdy4NCg0KPiAN
Cj4gPiAiVW5wcml2aWxlZ2VkIHByb2Nlc3NlcyB3aXRoIGVuYWJsZWQgQ0FQX1BFUkZNT04gY2Fw
YWJpbGl0eSBhcmUgdHJlYXRlZA0KPiA+IGFzIHByaXZpbGVnZWQgcHJvY2Vzc2VzIHdpdGggcmVz
cGVjdCB0byBwZXJmX2V2ZW50cyBwZXJmb3JtYW5jZQ0KPiA+IG1vbml0b3JpbmcgYW5kIG9ic2Vy
dmFiaWxpdHkgb3BlcmF0aW9ucywuLi4iDQo+ID4gDQo+ID4gQW5kIGZyb20gd2hhdCBJIHVuZGVy
c3Rvb2Qgb25seSByb290IGNhbiB3cml0ZSB0byBwZXJmX3N0cmVhbV9wYXJhbm9pZCwNCj4gPiBz
byBJIGRvbid0IHNlZSBhIHBvaW50IGluIGhhdmluZyB0aGlzIGZpbGUuLi4NCj4gDQo+IFNvIEkg
ZG9uJ3Qga25vdyBob3cgdGhpcyBzdGF0ZW1lbnQgZm9sbG93cz8NCj4gDQo+IHJvb3Qgb3Igc3Vw
ZXJ1c2VyIGlzIHRoZSBvbmUgd2hpY2ggZ2l2ZXMgdGhlIHBlcm1pc3Npb24gdG8gbm9uLUNBUF9Q
RVJGTU9ODQo+IGFuZCBub24tQ0FQX1NZU19BRE1JTiB1c2VycyB0byBiZSBhYmxlIHRvIGRvIHBy
aXZpbGlnZWQgT0Egb3BlcmF0aW9ucy4NCg0Kc28gaWYgSSdtIHJ1bm5pbmcgYSBwcm9jZXNzIHdp
dGggQ0FQX1BFUkZNT04gYW5kIHJlYWQgcGVyZl9zdHJlYW1fcGFyYW5vaWQgYW5kIGl0IHJldHVy
bnMgMCB0aGVyZSBpcyBubyB3YXkgZm9yIFVNRCB0byBrbm93IHRoYXQgcHJvY2VzcyBpcyBhbGxv
d2VkIHRvDQp1c2UgWGUgS01EIE9BIGZlYXR1cmUgd2l0aG91dCBkbyBhIHVBUEkgY2FsbCB0aGF0
IGNoZWNrcyBmb3IgQ0FQX1BFUkZNT04uDQoNClRoYXQgaXMgd2h5IEkgdGhpbmsgaXMgYmV0dGVy
IGp1c3QgZG8gYSBzaW5nbGUgRFJNX1hFX1BFUkZfT1BfUkVNT1ZFX0NPTkZJRyB0byBkZXRlY3Qg
aWYgZmVhdHVyZSBpcyBwcmVzZW50IGFuZCBpZiBwcm9jZXNzIGlzIGFsbG93ZWQgdG8gdXNlIGl0
LiBCdXQNCml0IGdlbmVyYXRlcyBhIGJ1bmNoIG9mIGRlYnVnIG1lc3NhZ2VzLg0KDQo+IA0KPiA+
ID4gU28gYmFzaWNhbGx5IEkgdGhpbmsgeW91IGp1c3QgbmVlZCB0byBjaGVjayBmb3IgdGhlIHBl
cmZfc3RyZWFtX3BhcmFub2lkDQo+ID4gPiBmaWxlIGFib3ZlLiBJdCB3aWxsIHRlbGwgeW91IGJv
dGggKGEpIGlmIE9BIGlzIHByZXNlbnQgKGJlY2F1c2Ugd2UgYXJlDQo+ID4gPiBnb2luZyB0byBt
ZXJnZSB0aGUgY29kZSB3aGljaCBjcmVhdGVzIHRoaXMgZmlsZSB0b2dldGhlciB3aXRoIE9BKSBh
bmQgKGIpDQo+ID4gPiBpZiB5b3UgbmVlZCB0byBiZSByb290IGZvciBwYXJ0aWN1bGFyIG9wZXJh
dGlvbnMuDQo+ID4gPiANCj4gPiA+IFRoYW5rcy4NCj4gPiA+IC0tDQo+ID4gPiBBc2h1dG9zaA0K
PiA+IA0KDQo=
