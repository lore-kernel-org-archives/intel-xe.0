Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40771C02181
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 16:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B58210E9D3;
	Fri, 24 Jan 2025 16:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTs/JSZL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFA710E9D3
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jan 2025 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737734906; x=1769270906;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BYY9vGozPqIaY+5kjcU4DTi0MesZkMgoe5nQthC6dpo=;
 b=NTs/JSZL4Uaa9d16mE4/zcrlyONosnClfFttpnbf5bQUzdCriZ3t0rSk
 1kB/XZ3pzF6kY9yXyeEb9JrpydJ+NMCiMBb+zKuwkaRrE66WfUYQOGdOE
 Y/5AdQvD9bwjkTl9ooKFtG3nX364je7gA47bcuDkubzRfLHr9kqId+Mw5
 GBxOkTv5mHotjvz86AY1LoEdP39VdM3j+wx+fdwpV7C7rn7GlPOCn54PQ
 2EozneL8iNnpZGp+id65oI6IE6yyei4fEqXmYkU8HEX53ZAQm+M0PnY1W
 gX2H7m5TxZUvfnwiG0ByqDh85yDzoG3izDaUcOkLihG7e8j7c17jWN5Tp g==;
X-CSE-ConnectionGUID: jY0SqzJfSqqvkbknWcV1jA==
X-CSE-MsgGUID: 9rssC61UQIOCwkaQYSYihA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38417378"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="38417378"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 08:08:26 -0800
X-CSE-ConnectionGUID: 2uTXz0YHRl2oCVezihGDGQ==
X-CSE-MsgGUID: /zQ/nVdLTfWfNFAWrCREmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="112817485"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2025 08:08:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 24 Jan 2025 08:08:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 24 Jan 2025 08:08:24 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 24 Jan 2025 08:08:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flYZfo0HHtiKcxdcSzPzrffz9TMdcXUIj69eOJ5Pp57T3v9toM4uPKJfk03XdyupuuOuwbOdSS1HKtz1g13XztfnbnBeeXc1dXTjdmmhr5IxUr5tsurfu8VvuXvnU35GiDd4v3NvbzSQw1q8QQUdyifLgrFMGyftOFTscOtsVXJem0RSu3qbnPeq5bDUG+1VSiFkloKdntX1tAH3d6018AaAFcwzKML64d3PAfMbOXECDOSWhNxUMn2R2zeaGh+DePGyMjdjGjpOzZFcjKTRGLd85HwhPXcefWM9Zfv3U11fp089pTK54Yd2OqRncbjVvhUZwIthQF+E55QSjGLKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3WZdCkWS48s06glfLZYY8zgZe79q83+sq+HTYtdUnM=;
 b=XUPtiYPX4i1/TjwUSfW6/CmBd01LdRRSm8MaDZ+hCgUQbF2OIwnzRLFZCjCHQ+1C2PrVoEh1AlhIwaW1IwsdqKws6akK2XljPeL/M7OilAs5utdtZbJ8sFjre+B/3EAl240Q/ISAnbiY/ncKG74qjgT3vgZwB5p+tKvcH0fmykZvYRCVPBA0Xo8cCtZp+i96/D8mFaQGkmNDLJ0KppBzl9kOToY2LHjUGqhFASv7y7LW1wxnBpurbvtWXWP+uSPZoUtdjLGtIjEZVZU1ewhIoxoG0F5GCKgk4bNzeqr5mibD2JcAaRPhK++sHqqnV1zK3KU7Udmq4db7vann0Vbk2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SN7PR11MB6726.namprd11.prod.outlook.com (2603:10b6:806:266::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Fri, 24 Jan
 2025 16:08:03 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%2]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 16:08:03 +0000
Message-ID: <d9ba4385-ec55-4f16-b0c1-9a493c9319a8@intel.com>
Date: Fri, 24 Jan 2025 21:37:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/hwmon: expose package and vram temperature
To: Raag Jadav <raag.jadav@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>,
 <andi.shyti@linux.intel.com>, Karthik Poosa <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <anvesh.bakwad@intel.com>, <saikishore.konda@intel.com>
References: <20250108092415.289551-1-raag.jadav@intel.com>
 <94e0bc3e-897c-48e2-950d-777d40519ab7@intel.com>
 <Z5GuzT7R0WZTr3r3@black.fi.intel.com>
 <bc971c1c-bcf1-40f4-a7fd-52107ebec05b@intel.com>
 <a79e18b1-49da-4f14-bd7d-06bc497fa004@intel.com>
 <Z5OImvYNno8VDci5@black.fi.intel.com>
 <fba28165-eea6-41dd-938d-9db749eb9f60@intel.com>
 <Z5OvwSv5OykmbTNK@black.fi.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <Z5OvwSv5OykmbTNK@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0253.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::7) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SN7PR11MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e46be81-7985-4ac2-dc57-08dd3c9147c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3hJVkF2YkpaSlNBdHFDcm1DanB2aXd3dCs5ZDlMclhidHU0eUhQOVNEcElx?=
 =?utf-8?B?L0NjOUpMODhMQnZFOUN3N3lJeDRrcW52SnJYTk9YMm1TdGZzdVhWUlNpVHM0?=
 =?utf-8?B?Vy8yWGRUcVRaUWNYNE90UFlUc0FUVVBUTHhvbVFFZUlJQkJadkh4SU0rSVI1?=
 =?utf-8?B?bjhhc0tocFNydUZ2YkFkQWxNK3BPYjZ2MG5SekNDODNCT1ZCdDdINHZBL1o0?=
 =?utf-8?B?MGlzZ0xNNGpodUxtNGVDN2xpWDdDckQ0ZlVtb0EvcVh6Sjk2dE9vTTZWRkZM?=
 =?utf-8?B?OWEwTlBLU3ZlZlg0b0NPbUJiQm5XeUtVZTFYMzhaOTE5NHdQYmxmcWhqaHdl?=
 =?utf-8?B?Y092OVYwSDVmM0gvbGx0RG9tZEl3ay9uZW9IMDVlRnA0YWxnYThCRlk0bkZB?=
 =?utf-8?B?Szgyc2FML0NwQU9FRzFyZy9mRFlObHR4K011NlJIQTQ3ZDlJRFNzSVZQK2NV?=
 =?utf-8?B?MGtOMjc0Y0w5Z3c1UEYwTWlueWZxK2hEbzZDT1RhZUV0NWhXSzdKVFhiZ1R3?=
 =?utf-8?B?aG1MYnE5cUc5V1QvWWZHYkdZSWhnMllqVVdRVWozQnhJb1FEa3VtaGkxM2pW?=
 =?utf-8?B?YUx6M0YzL1p0N2NUVTg5M3FhZUQ2NlAyQVdXeXVzanA1RmU1bXdVMzlkZ3Ny?=
 =?utf-8?B?dFg1NmovVWNiL05VLzNnU0tXR2s3SjFJclhPc1h1ZmpuaXV0eXEwMVlUaFlv?=
 =?utf-8?B?Vmt3WlJveFFYTnAwSGRmS3lDQXl3eDA3MkllNlpOOTdTMGxRTCt1L1ZzaTFS?=
 =?utf-8?B?T0Vyb1ltckplLzAreGRxYlZ5dGJmM3VQaGNNcWZXbzJmOVlDRzhUT0lYWE9s?=
 =?utf-8?B?cmU0U0svTnpwc204M1RUbEZuZEVqL1JyQlk5aDJud2dIS3Y1S2tteTY0VXcr?=
 =?utf-8?B?U2F1NkFmeWM4UjdtdjBpNmZJMkxTSkVIYlVHTCt3NWF0ZHliUWp6bGt3SWFZ?=
 =?utf-8?B?eHRoY2pLZ25ZVk9mRUdJcUpBRmVhb1kxVEZ0UTR5VHVaZ2ZhNUM2YnIxVHA4?=
 =?utf-8?B?WkNoTjA1akVvaFcxVDQxR3dqeFBXaVh2dUswY3hNVzEwR1dQcHhtbTd6dlhu?=
 =?utf-8?B?S1V0ZlorYjY1WXM5SGZ0SUhnY1RUaTBRUWl1bko0SEdLanVoaHFNclJxM0hw?=
 =?utf-8?B?VEMrZHhyeHdPQ0loWE4wak1KcXVSUUduME9vdG5PT3MwKzR1eXhKVTNuaTdl?=
 =?utf-8?B?czI2T2dva2lBNllwUEdGczA3dVFtTjh4WmtTU3RlMk4xd3hsd3g4MDgxcnlv?=
 =?utf-8?B?YXF0SURKeklHdXprV29GMzZqdFhqbG9iK3dSbDBaNUJ0VEh6TzlBeTd0dUFL?=
 =?utf-8?B?Q1U2cVVzM0plUm00QzJRSlh3UTl0OXN2QjROUG9JdlFHM0RVeWhjaEp0cVY5?=
 =?utf-8?B?ZEg0SUtpSnEyMVVEMHN1NlZTdlViTm5zTE9Yc3FCUmpiNEJEeGYxbE1RbGVD?=
 =?utf-8?B?R0xsUEJMQXBVb0o5bmJ2dk5zK0RwUVY5bEU3dHZMMkVIcDdNRmp3ZUh2T1RO?=
 =?utf-8?B?cDhoMkRWSVAzMzRtZXM1eE8rSFE5ZnVjM0J0bUhwbThFYzNCaTNFQ2pWNXoz?=
 =?utf-8?B?UGhYV1ozV0tnTmQ2NE00RzY3RUcwUm4vOGthKzVBVUNxMEVHVWpFVTZKMW5y?=
 =?utf-8?B?K29YbGtMQ3g1c2xNbnhINUEzcTlHSDM5Nk1qcTl1bnpRMWZEc2RvaXlMYXNI?=
 =?utf-8?B?K0NVaVR1OVF6cmk4dklzTnN5THE1Ym5BNUs3ckE2OXYwQ3dnNWZ3ZjhrYlRO?=
 =?utf-8?B?MGEwSEFwVzI0SXhKbi9SRG81cjhQWEh0YmpqWnVnZkwxaGFwRTBEemg5Q2U4?=
 =?utf-8?B?bTRCQW5NcnlQYnkvbyt2WllHbEx4KzhpSmVvZTQzUCtMb21haWppTEJUa0g0?=
 =?utf-8?Q?4K6MScS1Hmxq4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUdpZi9UbUU4Q1dmQm1JZ2pFcnhXQVFsWmxCeUE4U2MwcStVVDArRFlpc3pX?=
 =?utf-8?B?SStsQmU0RXVRVXJiQkR0YWJrcEw4a3M0VERZeW1tUU05YjFaL0ZoS0haQ3lK?=
 =?utf-8?B?ZjZONTFxaklPV1VaRWdFWTQ0NTQrVnM1Vm1PSjBXeVBOOHpWdHRuMitXRjB0?=
 =?utf-8?B?dFlhVFdHaWxyd2MwUElENmdoR1hUcmxIdDFZc1RYNVR5dGx0TFAzbkJHUVlX?=
 =?utf-8?B?WTR4TWZxMzVDRllFeFB3amRGcmE0YVNNUTdFb3RTV0Zoa0JFWTh6a1dXdHpm?=
 =?utf-8?B?Njl5Mi9ZZVFzbVhDbjNkVit3QWl6NlFaajdMSDRkK0ZmblhpOU9xc2tBSWJU?=
 =?utf-8?B?MU1jMk1KV2l1QWVSc1VQT2RpKzBCMXBCTStOcUVETUJ3QVovUHljTnJBVjVZ?=
 =?utf-8?B?RVBVR3phMUFVb3BiZ1kxbVp2Ylg0VCtZN1YyOXVuTGkyUGRuRkpQaE5pTTha?=
 =?utf-8?B?Q3pHSFVoQ3d2L252aUtzZmJzTm5YaHRReHBQQUV4KzdiZmJkWEwzMlhqNUcr?=
 =?utf-8?B?d3pLanplNTI4NGt2NmkvbEpyQk5aNnFIOElvdWdmUUJGWG5td1gzTDVSOUxL?=
 =?utf-8?B?VDhhRWpJZjYrOC85aXViVVFRbXJlcjU2NXI3bU91a2hOMW5UdGVPaEo3bnpv?=
 =?utf-8?B?blkyUC9ZcHF1VnAzNFlydlB1UHFZQ0VlK2cxc25BaW9ZZ1VseHJSMi9SczIv?=
 =?utf-8?B?eTJSUHNSN2RpQVdvMjJWUWhTQUhERXpRREtaamZmSXFEOXlnWU1GSXRGRlBu?=
 =?utf-8?B?cStIV2Z0MFRTdEVhUERhSk02emhuNEUxOW1hV0FvSXYrRStaVmlleEdCVlQy?=
 =?utf-8?B?QTc4RkdnczNpOVBGZnRhQzd1SjVIL1p3VjJMWm5XbHh5aUhWMnRXMVZpblVt?=
 =?utf-8?B?RDQ3Qld5T29ZRUlPb0hsWFZnVms2MTk5TWFSTEk2OTQzU05JdnlBNTJtcndL?=
 =?utf-8?B?K2Z5bkJSd0xwbVBROG1WQU5WZlZ3eVBIMkIrMnVuUzZ2UFB1amZaejZiZXcz?=
 =?utf-8?B?V3Z4RTVNSmhsLzZCcE15SWwzamtGaFp5VGE3c2JGMk9hRDNnbnY2NVJOeVI1?=
 =?utf-8?B?QWRkN01OS2xiNmVqU1NkOTUzc0lIclBwOERTUDhvd1FZV2YrQ09LVlFvdzBT?=
 =?utf-8?B?U2NvZ1dMMVdtR3ludzU0ZENZUkV0QUZqV3lHNE1wcFdwbzJwYkdJYllNTXpp?=
 =?utf-8?B?b1daSkxQZDVLREJ0NGhNc0ozUTVHcmtGbnUvcng4SVlVMDN6ZTdBUFpIWmNq?=
 =?utf-8?B?MGhnZHF4SnFnOGJzMjkvVkl0SnQ4dGU3OGNMQkRKdE5EUlNBUHJzVWl2L0Fr?=
 =?utf-8?B?LzBOVlhUYUVqTFl6UllhZ2VDZjdlMmJvcU1OVlhTYlFYcXVXYk42eHZhSGtQ?=
 =?utf-8?B?OHVOQXliYnpXZThFb3Q2Z3dWU0xxN0NlYkdESXYxeVZ0bHJ2aER1a2g3NTZx?=
 =?utf-8?B?T3hJTDNqSHI4cmJWVFUzcmkyTVk2OWlhdjR1ZXljSmhjeW5FTTVLdkV5eUdP?=
 =?utf-8?B?Ly80VkJoTHVqT2EvUU1xRFhYMEdQc2Z3cWZ6dkdsbzZrUnk3cDN1cHQxZiti?=
 =?utf-8?B?eFFaNkVFbWhXb2dNbzNFTm83dXlIcGVaSzcyOTBsNzhBdXpSbFZzZ1VQS2Ra?=
 =?utf-8?B?Q3Y4OVo3SDdrNUc0R1JYN3JrRmd2NUdWZXpyZFdxRW4raUZXSGZyZFVtMmlT?=
 =?utf-8?B?bWFDd2phY09kZ282N2xsdk85a2JLNUREcEZjcjZUeWlyV09UbnJGWFBWSEZV?=
 =?utf-8?B?aXNUWHJPbFkxamN6cyt5alZjREtSeUpES2h0MWZlbDc4OHEzK3Q0U052ajV4?=
 =?utf-8?B?Nm55aVlja2VDL1BNYlRhQTAzSWk1VXNrMDhBeVFUeDF2MjVRK2FwcEVOWlJW?=
 =?utf-8?B?dUxUZDhFQXB2YzE1R1I4ckpKRkIrZmdVb2JuZDlLQThzRlVqNlNlYThERi95?=
 =?utf-8?B?UDNjT3ZvNjJHQjJBdjh4NG9SaG5PdzI4ZzRWakllYXBiL0tZaFN2aGpHSHE1?=
 =?utf-8?B?ZmN0U1VPNVJFY1dNa3ZaSjFablRTY3o2bkdTc1JEdFFIRXNmZS93V1pIVkli?=
 =?utf-8?B?b0RiWkJLSXJaK3JZTDRLTTBQaFVxYnFWYzJoQ05kYnR1UFNrOGVnS2ZuckNF?=
 =?utf-8?B?Tm9BT0NXeXVJTkNhRGR3R1MyVVR4eGNNaXpPbzliNkhHckJPZ2RRNHJkck1G?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e46be81-7985-4ac2-dc57-08dd3c9147c7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 16:08:03.2238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPuxM0lFxFlXwwmBRac8aqevZhc5A3fXW+3NI4QbbRTrW5yq3H06scz9Fe2HxcdLS1G2pTW+4RPsYYGhmB/i5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6726
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


On 24-01-2025 20:50, Raag Jadav wrote:
> On Fri, Jan 24, 2025 at 08:27:14PM +0530, Nilawar, Badal wrote:
>> On 24-01-2025 18:03, Raag Jadav wrote:
>>> On Fri, Jan 24, 2025 at 05:29:16PM +0530, Nilawar, Badal wrote:
>>>> On 24-01-2025 11:46, Riana Tauro wrote:
>>>>> Hi Raag
>>>>>
>>>>> On 1/23/2025 8:21 AM, Raag Jadav wrote:
>>>>>> On Tue, Jan 21, 2025 at 01:56:05PM +0530, Riana Tauro wrote:
>>>>>>> Hi Raag
>>>>>>>
>>>>>>> On 1/8/2025 2:54 PM, Raag Jadav wrote:
>>>>>>>> Add hwmon support for temp1_input and temp2_input
>>>>>>>> attributes, which will
>>>>>>>> expose package and vram temperature in millidegree Celsius.
>>>>>>>> With this in
>>>>>>>> place we can monitor temperature using lm-sensors tool.
>>>>>>>>
>>>>>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>>>>>> ---
>>>>>>>>      .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
>>>>>>>>      drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
>>>>>>>>      drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
>>>>>>>>      drivers/gpu/drm/xe/xe_hwmon.c                 | 63
>>>>>>>> +++++++++++++++++++
>>>>>>>>      4 files changed, 84 insertions(+)
>>>>>>>>
>>>>>>>> diff --git
>>>>>>>> a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>>>>>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>>>>>> index d792a56f59ac..998cfb0ee1a6 100644
>>>>>>>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>>>>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>>>>>>> @@ -108,3 +108,19 @@ Contact: intel-xe@lists.freedesktop.org
>>>>>>>>      Description:    RO. Package current voltage in millivolt.
>>>>>>>>              Only supported for particular Intel Xe graphics platforms.
>>>>>>>> +
>>>>>>>> +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp1_input
>>>>>>>> +Date:        April 2025
>>>>>>>> +KernelVersion:    6.15
>>>>>>>> +Contact:    intel-xe@lists.freedesktop.org
>>>>>>>> +Description:    RO. Package temperature in millidegree Celsius.
>>>>>>>> +
>>>>>>>> +        Only supported for particular Intel Xe graphics platforms.
>>>>>>>> +
>>>>>>>> +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
>>>>>>>> +Date:        April 2025
>>>>>>>> +KernelVersion:    6.15
>>>>>>>> +Contact:    intel-xe@lists.freedesktop.org
>>>>>>>> +Description:    RO. VRAM temperature in millidegree Celsius.
>>>>>>>> +
>>>>>>>> +        Only supported for particular Intel Xe graphics platforms.
>>>>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>>>>>> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>>>>>> index 519dd1067a19..f5e5234857c1 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>>>>>> @@ -34,6 +34,9 @@
>>>>>>>>      #define PCU_CR_PACKAGE_ENERGY_STATUS
>>>>>>>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>>>>>>>> +#define PCU_CR_PACKAGE_TEMPERATURE
>>>>>>>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
>>>>>>>> +#define   TEMP_MASK                REG_GENMASK(7, 0)
>>>>>>>> +
>>>>>>>>      #define PCU_CR_PACKAGE_RAPL_LIMIT
>>>>>>>> XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>>>>>>>>      #define   PKG_PWR_LIM_1                REG_GENMASK(14, 0)
>>>>>>>>      #define   PKG_PWR_LIM_1_EN            REG_BIT(15)
>>>>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>>>>>> b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>>>>>> index 0b0b49d850ae..8846eb9ce2a4 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>>>>>>> @@ -21,6 +21,8 @@
>>>>>>>>      #define BMG_PACKAGE_POWER_SKU            XE_REG(0x138098)
>>>>>>>>      #define BMG_PACKAGE_POWER_SKU_UNIT XE_REG(0x1380dc)
>>>>>>>>      #define BMG_PACKAGE_ENERGY_STATUS        XE_REG(0x138120)
>>>>>>>> +#define BMG_VRAM_TEMPERATURE            XE_REG(0x1382c0)
>>>>>>>> +#define BMG_PACKAGE_TEMPERATURE            XE_REG(0x138434)
>>>>>>> indentation.
>>>>>> It's a git quirk, you won't see it in file.
>>>>>>
>>>>>>> Also you are using the same for DG2. Should have a common name
>>>>>> Just following the conventions.
>>>>> Did not find this convention in the file.
>>>>> BMG_VRAM_TEMPERATURE is used in both dg2 and bmg and has a bmg prefix.
>>>>> Doesn't seem right
>>>>>>>>      #define BMG_PACKAGE_RAPL_LIMIT            XE_REG(0x138440)
>>>>>>>>      #define BMG_PLATFORM_ENERGY_STATUS XE_REG(0x138458)
>>>>>>>>      #define BMG_PLATFORM_POWER_LIMIT        XE_REG(0x138460)
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>>>>>>> index fde56dad3ab7..5b5c844adf4a 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>>>>>> @@ -6,6 +6,7 @@
>>>>>>>>      #include <linux/hwmon-sysfs.h>
>>>>>>>>      #include <linux/hwmon.h>
>>>>>>>>      #include <linux/types.h>
>>>>>>>> +#include <linux/units.h>
>>>>>>>>      #include <drm/drm_managed.h>
>>>>>>>>      #include "regs/xe_gt_regs.h"
>>>>>>>> @@ -20,6 +21,7 @@
>>>>>>>>      #include "xe_pm.h"
>>>>>>>>      enum xe_hwmon_reg {
>>>>>>>> +    REG_TEMP,
>>>>>>> add to the end
>>>>>>>>          REG_PKG_RAPL_LIMIT,
>>>>>>>>          REG_PKG_POWER_SKU,
>>>>>>>>          REG_PKG_POWER_SKU_UNIT,
>>>>>>>> @@ -39,6 +41,11 @@ enum xe_hwmon_channel {
>>>>>>>>          CHANNEL_MAX,
>>>>>>>>      };
>>>>>>>> +enum xe_hwmon_temp {
>>>>>>>> +    TEMP_PKG,
>>>>>>>> +    TEMP_VRAM,
>>>>>>>> +};
>>>>>>> Can't the existing channel enum be used here?
>>>>>> Nope, that'd break the indexes.
>>>>> @badal/@karthik Are multiple indexes for the same channel okay?
>>>>>
>>>>> In the current code, for dg2 only channel 1 is exposed for power and
>>>>> channel 0 skipped. Something like that needs to be done here too?
>>>> Thanks for looping me in this. Yes, Channel 0 represent card specific
>>>> attributes and Channel 1 represent package specific attributes. That's how
>>>> it should be followed.
>>>> With that BMG_PACKAGE_TEMPERATURE should go under CHANNEL_PKG. For
>>>> BMG_VRAM_TEMPERATURE new channel (channel 3) should be added in enum
>>>> xe_hwmon_channel.
>>> And how does that work with hwmon_channel_info?
>> Check curr_crit implementation.
>> HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL)
> Exactly, and hence the separate enums for temp channels.


No, we want temp2_input for package (channel 2) temperature and 
temp3_input (Channel 3) for VRAM temperature.
Just for information, in i915 we create separate hwmon node for each 
layer i.e. package, gt0 and gt1. During review of xe hwmon 
implementation upstream architect recommended that there should be 
single node for a device. So we are using channel based approach. So 
lets stick to that approach.

Badal

>
> Raag
