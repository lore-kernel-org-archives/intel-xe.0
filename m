Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C29E7718B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Dec 2024 18:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297C610E095;
	Mon, 23 Dec 2024 18:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZPV9MfH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8FF10E095
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Dec 2024 18:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734979876; x=1766515876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uNpcBnylBuRlKCIzWruf/0CVwzqpCC53BWtQbVU/ODU=;
 b=BZPV9MfHDXfCASGLHw2c7Z6XNBjt84Gm2SUJJTOP9CjkuPwXgcP1/iTk
 nJ/2O2yBJzo8KSa92paCJm+0a25rHzVC0Xkg19VMYlEtpVJuM7AqO330h
 /rIs3j1jybEPqCU7MURPhkcpF4obdpeiA4+Wz+61DW7Gph7/Q7aFpF9qs
 bz2HwORfuywjhIL/20D5eLSzrj2j7mbpOBHrz6aIKblIi61yGEy44ZFBv
 1QADot7SIjIrrQHMCp1w9gmmR8rx5CNrVZ0o+vnPsxnAfWwEBvosTlq6Q
 0DF0fMN8yHE+8mz016hoSg6o6B42aIz5sEo0sCA4Z6olGnUyO7MxCRr0H Q==;
X-CSE-ConnectionGUID: k5zcvmKWTJOiQZUgFeza8Q==
X-CSE-MsgGUID: 8Y9xt5D6TSmYTpOorlnROg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46049115"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; d="scan'208";a="46049115"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 10:51:15 -0800
X-CSE-ConnectionGUID: RwlQ/QpITdC+8KVJ5MfgNA==
X-CSE-MsgGUID: W7hM20g7TO+izA8RSKG0pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; d="scan'208";a="104137793"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Dec 2024 10:51:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 10:51:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 10:51:14 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 10:51:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCGMgEjG9XPk7as0KUaM2kYhOncW3kiNifwVEWzIF8dkh9ofXFRycRJQTiZYr0g2jW4QnNc40zON/iLsV9UAFpuCtioOht6JVg8dURa2LWEqxisAzFAuO/4g8r8RHV7eJNcO5K9U+TtljOeuYALlWmiHuuqrGfVlOjJFZJ8E4ALv01h/JNshtNl3QfcA33gjuwMoQZIRYQaqZ9W+ACVsY31+HKEzC0Cw2arMctnDOIhRhjUrd8JELgYUYDiLD4cKHW0sTO9Sp3p5M1dQtkray3sL733TZnUQA+2L+cuPFxpklAq9dSOBjXGtUnxV84akJ6CRtTZUw+oFpKP4L8ROrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNpcBnylBuRlKCIzWruf/0CVwzqpCC53BWtQbVU/ODU=;
 b=cGHeq+bAnj8hr+OQF6svckZEqAW6otHfEbmvYnlM59kHObyHL0CRZLKF5Oe9O1g5Emtbq9n0aYzk1KRsv0EsCeoX2zvWfL1RdWOALUO7WoHumx+1lq7/ayhl+cXzfTW+ul0r+qz2IHhW1L9OLV4bQ/Nwbp+EukNdafvGRPZqXC/5UyJhedXadtMzRNK/6VqNXtyLr6SwjvcHHzlAdYNJDAOyatNkiiPyyo8srslA/DO1Ts1OtRz2Y7I8Ge9eLGOQ7gSYrp4XEVOIGmOlKgyma0VUagv0yvbXSRPmj9ounPfW2IaCXcC1+svNggMohNrSES8peXDMd+dSUOAiMnP6Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB7182.namprd11.prod.outlook.com (2603:10b6:8:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Mon, 23 Dec
 2024 18:50:54 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 18:50:53 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Remove 'Force write completion' from
 MI_STORE_DATA_IMM
Thread-Topic: [PATCH] drm/xe: Remove 'Force write completion' from
 MI_STORE_DATA_IMM
Thread-Index: AQHbVWix/xTZH76Y7E+kjyCcxw6t8LL0J1cg
Date: Mon, 23 Dec 2024 18:50:53 +0000
Message-ID: <CH0PR11MB5444E5271C145AD14D961819E5022@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241223182918.126288-1-jose.souza@intel.com>
In-Reply-To: <20241223182918.126288-1-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB7182:EE_
x-ms-office365-filtering-correlation-id: 0da2e8e5-568b-47a9-446a-08dd2382ba8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NE5LbTE0UzVqVEdtUkpDUDBLbDR1QUdpRk5TU3VVVTg2TzdsRXlJaXd4N0hM?=
 =?utf-8?B?N3RlVTdHMkx3TUljMXAyUGROMDNUUHJtVWx5bUM2WHlqQ2RBb0hyREJ5alB3?=
 =?utf-8?B?K0FteXMvSUJMVUdCb0oveldxUE9xRENzS0tGY0plTXVDYmJ3WkdXSjkzU2ky?=
 =?utf-8?B?bWJ3YkhwbXcvdklZS0RsUXVpVVpNaXBuU28rZzI0N2NMZmdOMVVxYkJjSitT?=
 =?utf-8?B?eUdlZWRnMVM2TEU2OEdSdkE2ZVR3R1BKVHhvZzlHb0dqNTliT0hkdmFZUDEw?=
 =?utf-8?B?YkZrZEtPWVBkMEtSWUZTeGtWR2dHNHNzaXdzOUZzZW5RTXAwTDc2c0ZKVmxG?=
 =?utf-8?B?RHlZU25VNWsxc2l3K3FrZUlGUll5cGZRRk8vRzh2S0lBcHVkYUJhZzFuR1Rr?=
 =?utf-8?B?eUNJU0M0eWFqT2VrTnFVRGNSc2hFVFFEWVk3SXBlT0NLSGxFL09jZTBteWpW?=
 =?utf-8?B?aWsyd09kclh0TDV3SktZdW9aUzBSQUV4ZjdQZ244SnZubVNkdW55aXZmVHBO?=
 =?utf-8?B?NHV2ZVVBaHlxdlhndG9CY2MwSEFqVUVsU1JVV0NqdWJBb2Y4RnpsTHZzTFBl?=
 =?utf-8?B?ZGFQVEpEOGtSc3NXbS81bDdCd2tCcDJSU3VGYXRRMkNGWDE1aEFGQjZjWGt5?=
 =?utf-8?B?TFRDZHdNakVjMitsSll4UHNVU2kvc0ZKblVOTDczNzBhSVZpY2lWUDVHWnhr?=
 =?utf-8?B?V2M4SEJlQ3ZXTHE5UEVYUmpMdmFMNmwyWElFaGs4UWVRZ0s1Q2ZjV3NUTjhK?=
 =?utf-8?B?MmxuWis5dDE2dStNSFl0UW9XdzFEcGdnKzROYndlcVRHWk42WXVlVW1xK0pq?=
 =?utf-8?B?bHFGdk9YQWcvcmkyajN4b0ZzaXpMY2FqOThpWnlHbXJEb2FqNSs0VmRCaGhs?=
 =?utf-8?B?WE1RTjl6NmFlUkpRRzJ6Yk5hVnVyd3A1TXNFMmlGRkwrTDFuMFhHbjlFTjBa?=
 =?utf-8?B?MHZmak5kMWwwZFU2QmJ0N1RVMmliWnQ2V3JLMFEzd01uSnVUdVcxZGhEcVVW?=
 =?utf-8?B?bnRncTVVNFJNaGg3MGtYdlVZRm10OGgyZ291Mk9pZHR5a2pSNUNiNWFwTUZ3?=
 =?utf-8?B?VGJwVXR6eHNRZS81QVdRbnQxSDFqd3gvTXBHYUNsdy9JM1NqZE9wN3poSnJH?=
 =?utf-8?B?QklTNnkzQVZrUWorR0xoTWJzQUVoUWpOUkcwYWg5eDRBS3p3WmtXNC9qZ3BD?=
 =?utf-8?B?azJkdGdXUVZpZkRuSFZFaUNDd0NERkxsa1dzWVpBMFlRajhLUC9hVXFiS3BT?=
 =?utf-8?B?TTRMTjMwRlBabXo5OXpFSWgzRkVRc2ZFTStOUVdtWlgxOE5mZ1Z6ak10Qk92?=
 =?utf-8?B?V0ZKczVKWlFLaU9icmlPWlNhdGdRc0Z1R0NINzhsd1hBK2oySUludUc2bGM3?=
 =?utf-8?B?cEpaVzJxY0FwMjBXYmc3M1FvVVlXSkdlaHdoVDRHMnFTTm5FWmo4SzlySWhu?=
 =?utf-8?B?T21yT1dVUzM0cUVueE1wVlBZSGVqS0paZC9HY3luL0pwQ3dodHZUSHE1S0JL?=
 =?utf-8?B?ZG0yMXF0MnlnSlNiWEdCSlZwNGM1N2RMZjdjT0F1Ry9uMEdMTWI0V29Gbld6?=
 =?utf-8?B?aE8xNDJyd3pwTmdjQldzRE5PdGN1UC9uQ1AyQVNWRUVCbFJGSWIwZlBqcFB5?=
 =?utf-8?B?eDlMNnIyMXJiUnVqd3FyYWtCbmFQUGEvcFJFN2Z4cWFhTURFa1U0cllJcUVR?=
 =?utf-8?B?L3p5UFhkZDI2S2RzZVBZSmtMQlJVQUFaMGQxb1dBckpVbG12bzd4bmtqcXN1?=
 =?utf-8?B?azZKZHdzSGJKQnAzUkxGVUI0N0Y4RXoxUkMyMUlxcWRTUVR3QzVYMU9EYlNs?=
 =?utf-8?B?SEFSZXRnbkxkY0tqYW5xOWJFdFBpMWlPQlVoTmJ0SHRoUUFHN2Ivd1ZqQnMz?=
 =?utf-8?B?aWdLWVhsUVB5NUJ6QzJjUjNHcEk1Zkt2ZkM1cnFXT1VOK0tXRlVleUdrSEQx?=
 =?utf-8?Q?6/ci1efp8w5KWRIWQIvDQ3FSNJ07Z0fD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c294VTJRSVljWW5IWXFqV1ZtYko3SkNBZGpNKzRYT29qN1ljSmU4U28zOHhJ?=
 =?utf-8?B?Z2FZcVJEV3FRK1hDVVRFZFM4TllhWkFWeUFjVXZNTGRMZ1Q1R1VaNkRSZURO?=
 =?utf-8?B?cTVZYjJIUUFDS2h4TFh1RW9maVp1YjBrNnJ2WnhEMjZHOWROak1WMTlpT1do?=
 =?utf-8?B?SW1vRnNISFQ4dFRSWkJ5Y3BhLzdEWW5kaWdsa0xVVzlGRDRyWlFlVEEzZTFh?=
 =?utf-8?B?NDB1UWUvL1ZReEl2RGlrclZFTlRDVXhQWFNJUDlXK2tCaHlIN0pZemVlelk5?=
 =?utf-8?B?alBBekNCZWRIdWNhdkV0NldxRFBkVStjdkZhZ2VKSElpcU4rc3hIdStncWVQ?=
 =?utf-8?B?Q0U1TDNacGg5R0g5K3g3dHdpRjNsdE9rZ2FON3NQci9WZGFUNnZheExzWWxl?=
 =?utf-8?B?bG1DRVpKQTNYekRwY1NNQjREWnFYam5sUHAzMnVDckFSZGZXanF1S1FMaFhI?=
 =?utf-8?B?MUYraldSb1NUS1g5TnlrSEZZNzRsa0NJOGw2cnVnbWo3bllzZGlNQUlGTjhS?=
 =?utf-8?B?UGxZTHlYc0hJMTc3RlJqVXFwSk1xTXluUlB6VXZDcGZsVzIzRUtqaWdUTDZq?=
 =?utf-8?B?d2ZqYlk1Vjc2bXNHeFlwb25hL3BsZlRYZFdDM0NPdEtueFdGa0gyZk1DYlBv?=
 =?utf-8?B?bVhlQ2tEaE9zVFNzcThldkhwSFEweUZid2lmMjdsVVZQWGh5a2thbHFVSEt6?=
 =?utf-8?B?WWhvZkpWaTJ3WURObUNOQ01UUkJ5VDNYbG55YVovWXkvY3RqTTNJUFhzem4z?=
 =?utf-8?B?eTlOb2ZyUjhHQTZnKzVKQ25sUndtWmlpWkJZZnYyYWRrazY2UUx3Mk85OGQv?=
 =?utf-8?B?NTBDUDFQWGZ2SzM4R3IyWGNQTkFPcEJvRUNPdlpMcFV2V3V5YW9QL2hULzFK?=
 =?utf-8?B?RGozQ2lwRnZSVGtHcEh2QWJGUlBWcnlEQ2s2REcvdFY4Vi81MFFORE5ZQVVB?=
 =?utf-8?B?UGhuZlRBQXFRNFVnYURnakRHWkVVM0V3TktrYkwwTTA2eXBTRERjcUszQzRi?=
 =?utf-8?B?RzNZS1Nvb1k5TlNSZEhVLy9EVXM0Q3RYdmhiRkg4ZlhmeDdBeXlKVUovRkUy?=
 =?utf-8?B?dTNHM3NvNTBiWitoU2RyZ05DbFgxblFVYkR1aG55Q0hQYThnNzBuZWNjR2lT?=
 =?utf-8?B?QVVRTytGSEduelJ1dWlKQU01QjNyMlRDMGxEeForRC93RXgwYmQrS3lRWHpm?=
 =?utf-8?B?aHRYMHQwVmVkRTFZQlZJOWpBU3Q4R1dEeUI5dHFZYWl0K3ZCY0VmemxVODgw?=
 =?utf-8?B?OE5YUHIweDFhcGJmTGhjNHdvRVBFRzVNZmtLd01taEtPSldneXNjd01BRjlE?=
 =?utf-8?B?Z3ZLcHJMRlVJWjJPM1lpd1JMZ2JGbDFWWlpUWm5ZWDdpMURoOWNFdDFxTUFU?=
 =?utf-8?B?TjRmeEw3VUd4dk9kdGxnWFpKVVExM3E4Ykl4TitXVGJYRnowSnRHVmYyWEZl?=
 =?utf-8?B?OUlwWk5OZG5mbHBBNzRtTzI3SzU4aWRJSzFwb1dQUUtMYXliNVBsdGRPdmQ0?=
 =?utf-8?B?Y1MzUk0vNktMTllCWElJK3d0M2poc1A0RmJOSHRwekIvWWpzaVNSVjRNclpt?=
 =?utf-8?B?aWlBSGtRYmxZc092eWJOUUk1TjlFazBjd2VVNlJMM2lKSVBpVzFkcFZLbHRZ?=
 =?utf-8?B?b0hhWkg5TWp4TkpQWHM2b1dwMGRacHRLK0U2R041bW1xQWFiaHJ6eGlXV3Y2?=
 =?utf-8?B?VGpwQzlrai80VUpCaWV6OTVMZk55VVVkdzdpQWFuMFd6WFJwY0dKSWxyWC9S?=
 =?utf-8?B?M3pqWHZMRzV0SzZKL21Lc2NYMFFwKyswc3FkOG5SYWprWlZGUFU5OTBnZDMz?=
 =?utf-8?B?SlQwSnlJMWlHQkF6c1B0ZXNTWVZIVjVWR0tLd016bFRPN1VmN2RHdG5xanRs?=
 =?utf-8?B?NlBYWHBlZENmelJXRDJJemhyUlpIcktVbzQvRzRUenVaZ3FvUEVveHhqWlJz?=
 =?utf-8?B?YjNCQVNFdVR6ZlpEUi94SUFEeG1meVB1MWg2b1NIakEycnk4eUtkeUd0ajQ1?=
 =?utf-8?B?cXVaTVljS1M5SlluOWh2KzZDY25xT0E4SzdBeEtkeDhINGdCdlBEV0ZBQ1BL?=
 =?utf-8?B?enZVY2NPS0lsN1cwZEpkWUI3TS9kQVZFbFNRRFRiWXlpdXpWMEpkSDNEOHll?=
 =?utf-8?Q?sb0rK/v/HLYUdy+QMxBLfracu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da2e8e5-568b-47a9-446a-08dd2382ba8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2024 18:50:53.8568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YMnRAEaqy5eYEHkxToObPIMRG8diSPQPm0O0A6V70n6KJyrkaJUmzqJWAEaEsDiVXD+cIEAFSwciJCN736AINv+zR+ACb9cnD/vSB9wvprA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7182
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEpvc8OpIFJvYmVydG8gZGUg
U291emENClNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMjMsIDIwMjQgMTA6MjkgQU0NClRvOiBpbnRl
bC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFz
LmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+OyBEaXhpdCwgQXNodXRvc2ggPGFzaHV0b3NoLmRp
eGl0QGludGVsLmNvbT47IFNvdXphLCBKb3NlIDxqb3NlLnNvdXphQGludGVsLmNvbT4NClN1Ympl
Y3Q6IFtQQVRDSF0gZHJtL3hlOiBSZW1vdmUgJ0ZvcmNlIHdyaXRlIGNvbXBsZXRpb24nIGZyb20g
TUlfU1RPUkVfREFUQV9JTU0NCj4gDQo+IEluIGFsbCBwbGFjZXMgdGhlIE1JX1NUT1JFX0RBVEFf
SU1NIGFyZSBub3QgZm9sbG93ZWQgYnkgYSByZWFkIG9mDQo+IHRoZSBzYW1lIG1lbW9yeSBhZGRy
ZXNzIGluIHRoZSBzYW1lIGJhdGNoIGJ1ZmZlciBhbmQgdGhlIHBvc3RlZCB3cml0ZXMNCj4gYXJl
IGZsdXNoZWQgd2l0aCBQSVBFX0NPTlRST0wgb3IgTUlfRkxVU0hfRFcgaW4geGVfcmluZ19vcHMu
YyBmdW5jdGlvbnMNCj4gc28gdGhlcmUgaXMgbm8gbmVlZCB0byBzZXQgdGhpcyByZWdpc3Rlci4N
Cj4gDQo+IFRoaXMgaXMgbm90IGEgcmV2ZXJ0IGJlY2F1c2UgSSB0aGluayBpdCBpcyB3b3J0aHkg
a2VlcCB0aGUgcmVnaXN0ZXINCj4gZGVmaW5pdGlvbiBhbmQgdGhlIGNvbW1lbnQgb24gdG9wIG9m
IGl0IHNvIGZ1dHVyZSByZWFkZXJzIGRvbid0DQo+IGdldCB0aGUgc2FtZSB3cm9uZyBjb25jbHVz
aW9uIGFzIEkgZGlkLg0KDQpNYXliZToNCiIiIg0KTm8gTUlfU1RPUkVfREFUQV9JTU0gaW4gdGhl
IGN1cnJlbnQga2VybmVsIGlzIGZvbGxvd2VkIGJ5IGENCnJlYWQgb2YgdGhlIHNhbWUgbWVtb3J5
IGFkZHJlc3MgaW4gdGhlIHNhbWUgYmF0Y2ggYnVmZmVyLg0KQWRkaXRpb25hbGx5LCBwb3N0ZWQg
d3JpdGVzIGFyZSBmbHVzaGVkIHdpdGggUElQRV9DT05UUk9MIG9yDQpNSV9GTFVTSF9EVyBpbiB0
aGUgcmluZ19vcHMuYyBmdW5jdGlvbnMuICBFcmdvLCB0aGVyZSBpcyBubw0KbmVlZCB0byBzZXQg
dGhpcyByZWdpc3RlciBpbiB0aGVzZSBjYXNlcy4NCg0KVGhpcyBpcyBub3QgYSByZXZlcnQgYmVj
YXVzZSBJIHRoaW5rIGl0IGlzIHdvcnRoIGl0IHRvIGtlZXAgdGhlDQpyZWdpc3RlciBkZWZpbml0
aW9uIGZvciB0aGUgZnV0dXJlLiAgSSBhZGRlZCBhIGNvbW1lbnQgYWJvdmUNCml0IHNvIGZ1dHVy
ZSByZWFkZXJzIGRvbid0IGNvbWUgdG8gdGhlIHNhbWUgd3JvbmcgY29uY2x1c2lvbg0KdGhhdCBJ
IGRpZC4NCiIiIg0KDQo+IA0KPiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ry
b21AbGludXguaW50ZWwuY29tPg0KPiBDYzogQXNodXRvc2ggRGl4aXQgPGFzaHV0b3NoLmRpeGl0
QGludGVsLmNvbT4NCj4gRml4ZXM6IDE0NjBiYjFmZWY5YyAoImRybS94ZTogRm9yY2Ugd3JpdGUg
Y29tcGxldGlvbiBvZiBNSV9TVE9SRV9EQVRBX0lNTSIpDQo+IFNpZ25lZC1vZmYtYnk6IEpvc8Op
IFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQpBc2lkZSBmcm9tIHNv
bWUgbm90ZXMgb24gdGhlIGNvbW1pdCBtZXNzYWdlOg0KUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIENh
dml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCg0KVGhvdWdoLCBJJ20gbm90IG5lY2Vz
c2FyaWx5IHRoZSBiZXN0IGF1dGhvcml0eSB3aGVuIGl0IGNvbWVzIHRvIGJhdGNoDQpidWZmZXIg
b3BlcmF0aW9ucywgc28geW91IHNob3VsZCBkZWZpbml0ZWx5IHdhaXQgZm9yIGEgc2Vjb25kIG9w
aW5pb24uDQoNCi1Kb25hdGhhbiBDYXZpdHQNCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94
ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaCB8IDQgKysrKw0KPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX21pZ3JhdGUuYyAgICAgICAgICAgICAgICAgIHwgOSArKy0tLS0tLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5jICAgICAgICAgICAgICAgICAgICAgICB8IDEgLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMgICAgICAgICAgICAgICAgIHwgNiArKy0t
LS0NCj4gIDQgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25zL3hlX21p
X2NvbW1hbmRzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25zL3hlX21pX2NvbW1h
bmRzLmgNCj4gaW5kZXggZjRlZTkxMGYwOTQzMi4uOGU5ODg0YWFhNGI4YSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL2luc3RydWN0aW9ucy94ZV9taV9jb21tYW5kcy5oDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaA0KPiBA
QCAtMzUsNiArMzUsMTAgQEANCj4gIA0KPiAgI2RlZmluZSBNSV9TVE9SRV9EQVRBX0lNTQkJCV9f
TUlfSU5TVFIoMHgyMCkNCj4gICNkZWZpbmUgICBNSV9TRElfR0dUVAkJCQlSRUdfQklUKDIyKQ0K
PiArLyoNCj4gKyAqIFBJUEVfQ09OVFJPTCBhbmQgTUlfRkxVU0hfRFcgZmx1c2hlcyBhbGwgcG9z
dGVkIHdyaXRlcywgb25seSBuZWVkZWQgaWYNCj4gKyAqIHdyaXR0ZW4gdmFsdWUgaXMgcmVhZCBp
biBiYXRjaCBidWZmZXINCj4gKyAqLw0KPiAgI2RlZmluZSAgIE1JX0ZPUkNFX1dSSVRFX0NPTVBM
RVRJT05fQ0hFQ0sJUkVHX0JJVCgxMCkNCj4gICNkZWZpbmUgICBNSV9TRElfTEVOX0RXCQkJCUdF
Tk1BU0soOSwgMCkNCj4gICNkZWZpbmUgICBNSV9TRElfTlVNX0RXKHgpCQkJUkVHX0ZJRUxEX1BS
RVAoTUlfU0RJX0xFTl9EVywgKHgpICsgMyAtIDIpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfbWlncmF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYw0K
PiBpbmRleCA4YjMyZmFkNjc4NzgyLi45YjNiY2I3ODllZWUzIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9taWdyYXRlLmMNCj4gQEAgLTU4MSw5ICs1ODEsNyBAQCBzdGF0aWMgdm9pZCBlbWl0X3B0ZShz
dHJ1Y3QgeGVfbWlncmF0ZSAqbSwNCj4gIAl3aGlsZSAocHRlcykgew0KPiAgCQl1MzIgY2h1bmsg
PSBtaW4oTUFYX1BURV9QRVJfU0RJLCBwdGVzKTsNCj4gIA0KPiAtCQliYi0+Y3NbYmItPmxlbisr
XSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwNCj4gLQkJCQkgICAgTUlfRk9SQ0VfV1JJVEVfQ09NUExF
VElPTl9DSEVDSyB8DQo+IC0JCQkJICAgIE1JX1NESV9OVU1fUVcoY2h1bmspOw0KPiArCQliYi0+
Y3NbYmItPmxlbisrXSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwgTUlfU0RJX05VTV9RVyhjaHVuayk7
DQo+ICAJCWJiLT5jc1tiYi0+bGVuKytdID0gb2ZzOw0KPiAgCQliYi0+Y3NbYmItPmxlbisrXSA9
IDA7DQo+ICANCj4gQEAgLTEyMjUsOSArMTIyMyw3IEBAIHN0YXRpYyB2b2lkIHdyaXRlX3BndGFi
bGUoc3RydWN0IHhlX3RpbGUgKnRpbGUsIHN0cnVjdCB4ZV9iYiAqYmIsIHU2NCBwcGd0dF9vZnMs
DQo+ICAJCWlmICghKGJiLT5sZW4gJiAxKSkNCj4gIAkJCWJiLT5jc1tiYi0+bGVuKytdID0gTUlf
Tk9PUDsNCj4gIA0KPiAtCQliYi0+Y3NbYmItPmxlbisrXSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwN
Cj4gLQkJCQkgICAgTUlfRk9SQ0VfV1JJVEVfQ09NUExFVElPTl9DSEVDSyB8DQo+IC0JCQkJICAg
IE1JX1NESV9OVU1fUVcoY2h1bmspOw0KPiArCQliYi0+Y3NbYmItPmxlbisrXSA9IE1JX1NUT1JF
X0RBVEFfSU1NIHwgTUlfU0RJX05VTV9RVyhjaHVuayk7DQo+ICAJCWJiLT5jc1tiYi0+bGVuKytd
ID0gbG93ZXJfMzJfYml0cyhhZGRyKTsNCj4gIAkJYmItPmNzW2JiLT5sZW4rK10gPSB1cHBlcl8z
Ml9iaXRzKGFkZHIpOw0KPiAgCQlpZiAocHRfb3AtPmJpbmQpDQo+IEBAIC0xMzkyLDcgKzEzODgs
NiBAQCBfX3hlX21pZ3JhdGVfdXBkYXRlX3BndGFibGVzKHN0cnVjdCB4ZV9taWdyYXRlICptLA0K
PiAgCQkJdTMyIGlkeCA9IDA7DQo+ICANCj4gIAkJCWJiLT5jc1tiYi0+bGVuKytdID0gTUlfU1RP
UkVfREFUQV9JTU0gfA0KPiAtCQkJCQkgICAgTUlfRk9SQ0VfV1JJVEVfQ09NUExFVElPTl9DSEVD
SyB8DQo+ICAJCQkJCSAgICBNSV9TRElfTlVNX1FXKGNodW5rKTsNCj4gIAkJCWJiLT5jc1tiYi0+
bGVuKytdID0gb2ZzOw0KPiAgCQkJYmItPmNzW2JiLT5sZW4rK10gPSAwOyAvKiB1cHBlcl8zMl9i
aXRzICovDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfb2EuYyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9vYS5jDQo+IGluZGV4IGFlOTQ0OTBiMGVhYzguLjZiNDQwYTU0NzAy
NTUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5jDQo+IEBAIC02OTEsNyArNjkxLDYgQEAgc3RhdGljIHZv
aWQgeGVfb2Ffc3RvcmVfZmxleChzdHJ1Y3QgeGVfb2Ffc3RyZWFtICpzdHJlYW0sIHN0cnVjdCB4
ZV9scmMgKmxyYywNCj4gIA0KPiAgCWRvIHsNCj4gIAkJYmItPmNzW2JiLT5sZW4rK10gPSBNSV9T
VE9SRV9EQVRBX0lNTSB8IE1JX1NESV9HR1RUIHwNCj4gLQkJCQkgICAgTUlfRk9SQ0VfV1JJVEVf
Q09NUExFVElPTl9DSEVDSyB8DQo+ICAJCQkJICAgIE1JX1NESV9OVU1fRFcoMSk7DQo+ICAJCWJi
LT5jc1tiYi0+bGVuKytdID0gb2Zmc2V0ICsgZmxleC0+b2Zmc2V0ICogc2l6ZW9mKHUzMik7DQo+
ICAJCWJiLT5jc1tiYi0+bGVuKytdID0gMDsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9yaW5nX29wcy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMNCj4g
aW5kZXggM2E3NWEwOGI2YmU5Mi4uMGJlNGY0ODlkM2UxMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3Jpbmdfb3BzLmMNCj4gQEAgLTcyLDggKzcyLDcgQEAgc3RhdGljIGludCBlbWl0X3VzZXJfaW50
ZXJydXB0KHUzMiAqZHcsIGludCBpKQ0KPiAgDQo+ICBzdGF0aWMgaW50IGVtaXRfc3RvcmVfaW1t
X2dndHQodTMyIGFkZHIsIHUzMiB2YWx1ZSwgdTMyICpkdywgaW50IGkpDQo+ICB7DQo+IC0JZHdb
aSsrXSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwgTUlfU0RJX0dHVFQgfA0KPiAtCQkgIE1JX0ZPUkNF
X1dSSVRFX0NPTVBMRVRJT05fQ0hFQ0sgfCBNSV9TRElfTlVNX0RXKDEpOw0KPiArCWR3W2krK10g
PSBNSV9TVE9SRV9EQVRBX0lNTSB8IE1JX1NESV9HR1RUIHwgTUlfU0RJX05VTV9EVygxKTsNCj4g
IAlkd1tpKytdID0gYWRkcjsNCj4gIAlkd1tpKytdID0gMDsNCj4gIAlkd1tpKytdID0gdmFsdWU7
DQo+IEBAIC0xNjMsOCArMTYyLDcgQEAgc3RhdGljIGludCBlbWl0X3BpcGVfaW52YWxpZGF0ZSh1
MzIgbWFza19mbGFncywgYm9vbCBpbnZhbGlkYXRlX3RsYiwgdTMyICpkdywNCj4gIHN0YXRpYyBp
bnQgZW1pdF9zdG9yZV9pbW1fcHBndHRfcG9zdGVkKHU2NCBhZGRyLCB1NjQgdmFsdWUsDQo+ICAJ
CQkJICAgICAgIHUzMiAqZHcsIGludCBpKQ0KPiAgew0KPiAtCWR3W2krK10gPSBNSV9TVE9SRV9E
QVRBX0lNTSB8IE1JX0ZPUkNFX1dSSVRFX0NPTVBMRVRJT05fQ0hFQ0sgfA0KPiAtCQkgIE1JX1NE
SV9OVU1fUVcoMSk7DQo+ICsJZHdbaSsrXSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwgTUlfU0RJX05V
TV9RVygxKTsNCj4gIAlkd1tpKytdID0gbG93ZXJfMzJfYml0cyhhZGRyKTsNCj4gIAlkd1tpKytd
ID0gdXBwZXJfMzJfYml0cyhhZGRyKTsNCj4gIAlkd1tpKytdID0gbG93ZXJfMzJfYml0cyh2YWx1
ZSk7DQo+IC0tIA0KPiAyLjQ3LjENCj4gDQo+IA0K
