Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98367C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 14:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3968610E42B;
	Wed,  5 Jun 2024 14:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bs9mITRu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2245E10E42B
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717596827; x=1749132827;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=RsxJNnvozPWL+sTwsh5h/4mRw+ek7JM32HNjJu1N880=;
 b=bs9mITRuXBnbsyGrI0M7WzdGdktBvz9m975e1sM0COxGqYXosq9eZFD8
 +k6kwxSXdjutI2ensoDaMWKw/fS0dNgJ/U+ooUOLKtIh3u7dAuTaShj7e
 X/z23aAcV7seSDNAN0csrKqh5sKmnlgXrPb7+hAqjAEef+vuAtz+y4s7N
 bt9CVxQqKLgVyEUdKxL/LQLbWwdq9x3Xoyg0TvcDDti7ZkoQW4tQr5AH7
 olpAyYJR2d41noOGEWsJsD2iQ1v3ogU6V9AoqV2UVdwoTZ/wtOfhN4xzL
 Sh5kPbbzonhb6Y8Hq44ke9UWpIj7g2/KhGL63+5sa/JpvvxSyriL1LkcL Q==;
X-CSE-ConnectionGUID: 8D0/B4cOSLSlBXraSDNGHQ==
X-CSE-MsgGUID: f2H5sxBERWOJU5FtmVqJoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="18034567"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="18034567"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 07:13:27 -0700
X-CSE-ConnectionGUID: FzDHc6jdSj+mER90wsMfRg==
X-CSE-MsgGUID: 8cHv5Z9gSte6PEPPq7zVcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="42058848"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 07:13:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 07:13:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 07:13:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 07:13:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 07:12:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDBQxMCcfBj4YRQ3WFOf3VGpy0gljTRBupj6ni1RttO8Kz21u7dgYYbKLrYCPauKBzt3UDNQ48hlFkW/nmFIYVv65doLTY6lD9NFgGl4TbdXdOp7ndJRmJScbTteUN5zDpRtC5ddwIkVYyJKOEp8xr2nXwqZHnSgr4G/GQfF5UQUFlYwI2cOccdO9+ytjNFJ0LE6+6tTePI6JtW4AEkL8Cm05RX2Y+87XyaT53d6+zFZgqrjt/VxLNsT6pOLNCpZqeG7gPkIcEFdUW0IWpzHc0cKldNDz5fWANAWb3uItKERZOz7N2OLa6qJjn3EH3EwJaKTnK60uUO6sUpUg7dbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsxJNnvozPWL+sTwsh5h/4mRw+ek7JM32HNjJu1N880=;
 b=c/g38xV1TEhSen56JDs2UI6K5hNpvNgd9aOL6xJNGtrjiVQmiqk9EUwULIC/g4+RpbrjbOtpG0BhSczDJgBNdhee79FW3y+JTNRkdewaz2pp61m2shJ/3QSPELrmDxMl1NfkKSWC7fG+jVw+A/i5sYYHu+xExiBSrzmO3B1M/DNgC909IQrK9CbARc6g+UDvT2UcjkfoA15mK8jiceBPK3bQfc7mV460EsYC1dGdq3mMk+smgJ+MQCanJxkpheS0vR83NIwnNIqwA7k8ao6LkgGs47SifBqf2LIIIcYdX38mM6QoGCeIA7yr17T6MRGMIlRHXQoa+lTT0/7dO5NQEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MN2PR11MB4566.namprd11.prod.outlook.com (2603:10b6:208:24e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Wed, 5 Jun
 2024 14:12:54 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 14:12:54 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v15 00/17] Add OA functionality to Xe
Thread-Topic: [PATCH v15 00/17] Add OA functionality to Xe
Thread-Index: AQHar9da2moQLBpzvU+0kMW8h3xYubG5RTkA
Date: Wed, 5 Jun 2024 14:12:54 +0000
Message-ID: <6bee6a666dd0ab8440ca74d692a80788bfb1d748.camel@intel.com>
References: <20240527014333.603914-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240527014333.603914-1-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MN2PR11MB4566:EE_
x-ms-office365-filtering-correlation-id: cb841dc7-b594-4bd5-436a-08dc856997b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?QnpOVXllQm5BeG9lUDkvOTBoNnhvVjE5L3ZsclRBN2l6NzFaSzEyLzdJU09Y?=
 =?utf-8?B?ODlFVm5uZGh3ODhuZ0JOdFRHT2xYMC9KY25VVWtxaXRoWVNhQzNTS3hMWSs0?=
 =?utf-8?B?dkRqOURhQWNxWkdhUkRGVEdiSjREY1JGSGw1L0xLU3dBSk1tV2lLV0UveWhN?=
 =?utf-8?B?Rzk3SUtncUUrTGI4aktZZlRKRUluNVJTanhILzN3a1BpSC9FZ3hIRjIvWVVG?=
 =?utf-8?B?MndiSnJBVkpDbzIwN1A4eTFERS82cUR2OVRpcy9QcFJVNnV3WDJSeDBXSGF0?=
 =?utf-8?B?MmpMSnhpZmxaZWYvZGlubzNjaXNmZEp0Ulg4K3d0VXRibHRtZkFOcDhPWWVn?=
 =?utf-8?B?VHN3R3I4LzhYanRabk84b0kzKzdyVytUWG10MkliZHhScXZiVjJ2OUFueWVs?=
 =?utf-8?B?cDhILzl1RkpweU5RYTVjS0Y2VTgvRk5TVGtVN2lpbEFQMEltMEhZdHFUUGNT?=
 =?utf-8?B?bUs4Ky9MYWtsakl5RzdGaUFncFhxaUlEazZuNWlLckJFcktrbkQvdVlKMVdL?=
 =?utf-8?B?YVBlNnNnSHVtQ041UzNCbHUwS0JGZXU5bVVNTkk4R3lXRFQ4QWdwZThaT3dV?=
 =?utf-8?B?SWRjaHdXdTJoZU9Jc1NXN1BaVVBqNnl3ZWZKdXFNR3FLVmR1TTl5V3g2U3Ra?=
 =?utf-8?B?ekE0WCtQa2pIZmNZbnk1V2ZqWnR1TEo2Zm5aUUNRSldMcVg1QlR1WDNZWHlu?=
 =?utf-8?B?UmZQRXpUNE5aY2xxVFZFdFpLWTROM3h5Vlo4OFF5S09NclM3YW9sTUZBYkZa?=
 =?utf-8?B?MHNNaCtzNWNMajJQcFladzVlMmt1bGFzNHhmOEtFakRqWnBOY1RMZWJiVlRh?=
 =?utf-8?B?cUI5UFFGOVdNVjFsR0o0N2YzaXV6dXlIczNOcCs1RDlrVXBBL25halBQUjFD?=
 =?utf-8?B?Q095UFVzVnR3UVpFdlgzUHc0cmw3cVRBNVRwb3VxbFZKRDF0aEdQdTdIb1BC?=
 =?utf-8?B?T1VXL1g5M2FBWEFGdm5ZVjZHckVCMjRXSndtbzJJb2lmNFpBV2dOQnRPdGVJ?=
 =?utf-8?B?THltS3hhanpsanlYY21RTzZvV3R3YUNwdXFuVE9zWm5NQ0xwWGh2SGNxUDdw?=
 =?utf-8?B?eGxuMmdhTHBPa0xNbVNDNk9EREtFWjMrQm95T2JPckVyMlp6YUNQWkR1bHZV?=
 =?utf-8?B?QW5tckhKWEYwOXF3d2cxSmhQSVF1dTF1T3hpOXNLbVVueUUxKzBoSk94Z1hM?=
 =?utf-8?B?RmdLN0NqRjBJODNaWkY0WCtKc0dxNFY2UlJLQVN1c1RSSDdicHpmYjMzNWVn?=
 =?utf-8?B?ZVhYQlFTQ0crd24vQXYrRXdwT1ZXc01ZOHhadCtOVXVHWkVuc0k2SElON1lr?=
 =?utf-8?B?VVdoc2F3enROOC96MGNoWno4bFU1MkoyWEFiWkhvUHN2VURnc1hEclE1THhC?=
 =?utf-8?B?a3ZIdmh0Smh0TVlHcmNReWYvYTBUUjM1TzIxeEVxM1dtRDZJQnBUcTdnVVVT?=
 =?utf-8?B?UFBZUkFGUFQxSko3UjFmRXN2WUFMRXNoczNobUlNNFVVNHpQV0NxanVDdXh0?=
 =?utf-8?B?eWxtZUdNUklOZ3NGYVZnb3FUaUlKQTlWOVNQSmFHT1p3N2VjVXpGd1RvS0Zs?=
 =?utf-8?B?eEJ1NGF4OFpJRlVKc3hDRDkzc1JWTkpZTzVocWMzOFhhYzh2RFdndzFVdndq?=
 =?utf-8?B?OUx5ajFmbFo2dzhJU3RGanNuUWIwQnBaNHN6TkQ5Q0t4VE9CaGI0VzM5UXZq?=
 =?utf-8?B?Y2ZhcTBIRkZWNHQ4ZE9iN2NvNjI3TDh6UHFSYjR3L242ZEU0cUZUYU0vTnlX?=
 =?utf-8?Q?ttmgwIXLCWOJVL9mFDCEHAXFPz0ut4ROd0Rqamg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akRZb2NUMys0OVNseUlST1dtaU10QldjVWVscDVnODBiUDVlTkFRR0FXaGVs?=
 =?utf-8?B?ejl0eXZqMHYvSkwraUlGeEhleEtPZXJYalBtTmRuWUxHNjY1bFMwYXlrcE8x?=
 =?utf-8?B?QUVvYjVLR1cwSU44Tmg0MXFsREMyemRrVUZuNFJGejkrSW4rakcxREtWNlNu?=
 =?utf-8?B?MWcxL05RMVdJTW0rYUZYazRVbDNwL25LQTU4Z2FpNFQrWFhlNGRiVElaQ3VX?=
 =?utf-8?B?SVJiUUhaTkhJRFVUSEdsaGRKa2FpbFpMazJMY0ZQKzNCVEEwUExJQVBEMUV1?=
 =?utf-8?B?VTZyVDk3OXRManZFSloyN0dSbDhKdGw3aUFtME9LZnJyQ2gzcSsyNUxkYjFp?=
 =?utf-8?B?bEdpRFlrV2M1V3lNU2hGNGtScGRrOGg4cWlHSUlTR3N4V3E2VFplOVRDVkNK?=
 =?utf-8?B?dkVZRFdMRExmT2JSWmVSOHNsenFwclpRRm1NQk5nY0tHV3lncEx2VHViV1VR?=
 =?utf-8?B?Tm5nbTduMXhnaUREWTlqSXZOVmprNlFWak5xRTZjalR3S3ZjN0FTR3RMNE1z?=
 =?utf-8?B?VndXc1hZaUNTVTdjNTNpaWc3ckw4WjlWRXlONWpVRlpDNlM1UDNNSFBWR2dS?=
 =?utf-8?B?WWI0cGd2dEhldFhNR1JReHJhWEpsa3VCMG5kWEVjVEZHbks0cThGdVMyY25J?=
 =?utf-8?B?aGJyKy9WQitib0JGTThLMzFCUzlXU0hVSzNtN0x3dUgvWUhQdndtQk92ODRr?=
 =?utf-8?B?WmVMV3Z2TEhlcjFST2ZPb3hZcTQ3ZkNaSzRFV3ErUnBFOStUci9TY0tvOVQ0?=
 =?utf-8?B?dTlHY2pvaUVqZ0dyNHFOcVQ1Y05QV21QMHE3R2tEYisxKzl6bldmaGl1VE4x?=
 =?utf-8?B?Vm1kUms4aW05NlZOUGdGd1hrN2xQVlhGQU5aMlU5WmdpTlk4SWtvdllqcllR?=
 =?utf-8?B?MkJKS0dIb0tzYkVobk1TVzR4NTd4VGNHTUVyUVNnZ0FFOU1JSnJzdExLajFK?=
 =?utf-8?B?aUxUUXZCSTNBKzY2K0xyWkEvWlZGMUo4cTVVYVdwQzJUaW9aU1pTc3l3dnpq?=
 =?utf-8?B?UGVPQnNmMTV3OWxOb05ieXFuTk5mV0RUTzFFMmZ0SXpqM1hGRFhubW9rM1VU?=
 =?utf-8?B?WnpqUUNsNTdoSm84cHNoT3M4UENiNzRBcitBelNadURmOHIyVGRGK0JRSisy?=
 =?utf-8?B?S0gyK1J4OVluMnFJTW1EZDhsbUFLamJUaVFGZkVtdXNHbkRWa0lDZDBaTk9T?=
 =?utf-8?B?dDZ4UHd1Y25GbjBGeXM5OUIvM1N0Yi9VczIrMU9VSldMdDZaWFBsb3FnRzNl?=
 =?utf-8?B?S25hYkRYS3h3NnM0L05tNGFONTVjdm5heCtCeFgvQ2pZc2phdHd1T3liM25n?=
 =?utf-8?B?NXhQOGs2ZDlrZU9PVlkwQ3FJNHFiNm9kSXFQUHF5MW9hcDZSU0VxVVdzcEhS?=
 =?utf-8?B?Q1BRcmR4WFI5Q2JiUm9FeHVyRytWQ0hTdTYxbW51Zk4rT29UYjBSNHREN0F2?=
 =?utf-8?B?MjhoY3V3SnUzT2RyTnZlU0Y4NDdVMWtBbEgvSUgzaE5LWWU0SzZsK21icEk4?=
 =?utf-8?B?ZS9nS2trT09BU3YvN2o5QnVOZWhuT3dUaFlhT1cvSnRBM2NTaFpCblVqVFA1?=
 =?utf-8?B?MDBmU0hoQy9NT29BbWd4OWVVKzRSUTZ6SFI5T3poUXB2a256UUZKZFdKcG5y?=
 =?utf-8?B?QjZsTzc1czJ0Tlloc3RMOER5ZEVhYk53UXppeGlOd0U3YzV0eFBmTjU3UU9Y?=
 =?utf-8?B?anBrVmdqdi9yTm9HbUwxaUdGMDViK2FtZkF3VkRxM2YybFlPbXFhK3N3bDJK?=
 =?utf-8?B?dzRlZGlnR20yaCtpVEtUMndnNzdjc2J5R1ZYYmNsQmZJUVFKcm9pVWpJQkRl?=
 =?utf-8?B?NzBPUk1wbGxiZ0xBK05iY21TVVUvYXVCQWhUaDJGdjR2VjlqNnR4MXN3RnMx?=
 =?utf-8?B?dWZ4Y0UyaVpCU2lvemNRanYzWjlwWmdPZGZxd0NFOUtZZE04NzE2SXVraXR0?=
 =?utf-8?B?eGhhMS9VZWRZZTlRRjM1amFrOFhYb2J5dFVESUFNakV2Tk5UMnJoQ2x1OGRU?=
 =?utf-8?B?ejN3NW05VnNncDgvRlBKQXc3R2FET3dwU2x0RGpad1hzRjlJeTFjcTF1MGUy?=
 =?utf-8?B?WTBTVVBGakxZUlgyUUhMaW4xQWdIdUg4RzRFWkpITk5CV1hJVjFPbmsxbERF?=
 =?utf-8?B?b3BIMGZrT1cxWG1SMG5Kd203WDN2RThaVjBPd2Z6MmpLZy8yQitOaWJZVkRG?=
 =?utf-8?B?NFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <879A8B1EB2E47C4CA1F0E06A8CD2B5E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb841dc7-b594-4bd5-436a-08dc856997b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 14:12:54.2475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VnyLCJiiPFsVNcM8rTAvzyq9UaDjKHKKAAPIaMUINQ8Bj+1wLlFv+iOSPXXSOnmmiaVQGlHLtln2kSOK+nm84g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4566
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

T24gU3VuLCAyMDI0LTA1LTI2IGF0IDE4OjQzIC0wNzAwLCBBc2h1dG9zaCBEaXhpdCB3cm90ZToN
Cj4gUGxlYXNlIHNlZSBjb3ZlciBsZXR0ZXIgZm9yIHY3IGhlcmU6DQo+IGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTIxMDg0LyNyZXY3DQo+IA0KPiBGb3IgY2hhbmdl
cyBpbiBsYXRlciB2ZXJzaW9ucyBzZWUgY2hhbmdlbG9nIGJlbG93Lg0KPiANCj4gVGhpcyBzZXJp
ZXMgaXMgYWxzbyBhdmFpbGFibGUgYXQ6DQo+ICAgICAgICAgaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL2FkaXhpdC9rZXJuZWwvLS90cmVlL3hlLW9hDQo+IA0KPiBUaGUgc2VyaWVzIGhh
cyBiZWVuIHRlc3RlZCBhZ2FpbnN0IHRoaXMgSUdUIHNlcmllczoNCj4gICAgICAgICBodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvYWRpeGl0L2lndC1ncHUtdG9vbHMvLS90cmVlL3hlLW9h
DQo+IAlvciwNCj4gCWh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTMw
MDMzLw0KPiANCj4gT3BlbnNvdXJjZSBjb25zdW1lcnMgdXNpbmcgdWFwaSBpbiB0aGlzIHNlcmll
czoNCj4gDQo+IGdwdXZpczoNCj4gCWh0dHBzOi8vZ2l0aHViLmNvbS9taWtlc2FydC9ncHV2aXMv
cHVsbC84Ng0KPiANCj4gbWVzYToNCj4gCWh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9t
ZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy8yOTMxMg0KPiANCj4gVGVzdC13aXRoOiAyMDI0MDUy
NDAzMTQzOS4xMDYzMzItMS1hc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20NCj4gDQoNCkFzIGZpcnN0
IHJvdW5kIHRoaXMgdUFQSSBsb29rcyBnb29kIGZvciBNZXNhIHVzYWdlLCBzZWNvbmQgcm91bmQg
YWZ0ZXIgdGhpcyBvbmVzIGlzIG1lcmdlZCB3aWxsIGFkZCBhZGRpdGlvbmFsIGZlYXR1cmVzIGFu
ZCB1QVBJcyBuZWVkIHRvIHN1cHBvcnQgYWxsDQpNZXNhIG5lZWRzLg0KDQpBY2tlZC1ieTogSm9z
w6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCnRoYW5rIHlvdQ0K
DQo+IHYyOiBGaXggYnVpbGQNCj4gdjM6IFJlYmFzZSwgZHVlIHRvIHMveGVfZW5naW5lL3hlX2V4
ZWNfcXVldWUvDQo+IHY0OiBSZS1ydW4gZm9yIHRlc3RpbmcNCj4gdjU6IEFkZHJlc3MgcmV2aWV3
IGNvbW1lbnRzLCBuZXcgcGF0Y2hlcyAxMSB0aHJvdWdoIDE3DQo+IHY2OiBOZXcgcGF0Y2hlcyAx
OCB0aHJvdWdoIDIxDQo+IHY3OiBQYXRjaGVzIGFyZSBjb21wbGV0ZWx5IHJlZG9uZSBhbmQgZG9u
J3Qgc3RhcnQgd2l0aCBpOTE1IHZlcnNpb24gb2YgdGhlIHVhcGkNCj4gdjg6IFNlZSBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNTc1MjE0Lz9zZXJpZXM9MTI4OTkzJnJl
dj0xDQo+IHY5OiBTZWUgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzU3
NzQ0MS8/c2VyaWVzPTEyODk5MyZyZXY9Mg0KPiB2MTA6IFNlZSBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvcGF0Y2gvNTc3OTQzLz9zZXJpZXM9MTI4OTkzJnJldj0zDQo+IHYxMTog
U2VlIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC81ODEyMzkvP3Nlcmll
cz0xMzA3MDUmcmV2PTENCj4gdjEyOiBBZGQgbGFzdCB0d28gbmV3IHBhdGNoZXMgdG8gZW5hYmxl
IFhlMisgb3ZlcnJ1biBtb2RlDQo+IHYxMzogVXBkYXRlIGxhc3QgdHdvIHBhdGNoZXMgYWZ0ZXIg
Y29kZSByZXZpZXcgY29tcGxldGlvbg0KPiB2MTQ6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9wYXRjaC81OTU0NDcvP3Nlcmllcz0xMzQwMjgmcmV2PTENCj4gdjE1OiBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNTk1NTQ5Lz9zZXJpZXM9MTM0MDU2JnJl
dj0xDQo+IA0KPiBBc2h1dG9zaCBEaXhpdCAoMTcpOg0KPiAgIGRybS94ZS9wZXJmL3VhcGk6ICJQ
ZXJmIiBsYXllciB0byBzdXBwb3J0IG11bHRpcGxlIHBlcmYgY291bnRlciBzdHJlYW0NCj4gICAg
IHR5cGVzDQo+ICAgZHJtL3hlL3BlcmYvdWFwaTogQWRkIHBlcmZfc3RyZWFtX3BhcmFub2lkIHN5
c2N0bA0KPiAgIGRybS94ZS9vYS91YXBpOiBBZGQgT0EgZGF0YSBmb3JtYXRzDQo+ICAgZHJtL3hl
L29hL3VhcGk6IEluaXRpYWxpemUgT0EgdW5pdHMNCj4gICBkcm0veGUvb2EvdWFwaTogQWRkL3Jl
bW92ZSBPQSBjb25maWcgcGVyZiBvcHMNCj4gICBkcm0veGUvb2EvdWFwaTogRGVmaW5lIGFuZCBw
YXJzZSBPQSBzdHJlYW0gcHJvcGVydGllcw0KPiAgIGRybS94ZS9vYTogT0Egc3RyZWFtIGluaXRp
YWxpemF0aW9uIChPQUcpDQo+ICAgZHJtL3hlL29hL3VhcGk6IEV4cG9zZSBPQSBzdHJlYW0gZmQN
Cj4gICBkcm0veGUvb2EvdWFwaTogUmVhZCBmaWxlX29wZXJhdGlvbg0KPiAgIGRybS94ZS9vYTog
QWRkIE9BUiBzdXBwb3J0DQo+ICAgZHJtL3hlL29hOiBBZGQgT0FDIHN1cHBvcnQNCj4gICBkcm0v
eGUvb2EvdWFwaTogUXVlcnkgT0EgdW5pdCBwcm9wZXJ0aWVzDQo+ICAgZHJtL3hlL29hL3VhcGk6
IE9BIGJ1ZmZlciBtbWFwDQo+ICAgZHJtL3hlL29hOiBBZGQgTU1JTyB0cmlnZ2VyIHN1cHBvcnQN
Cj4gICBkcm0veGUvb2E6IE92ZXJyaWRlIEd1QyBSQyB3aXRoIE9BIG9uIFBWQw0KPiAgIGRybS94
ZS9vYTogQ2hhbmdlcyB0byBPQV9UQUtFTg0KPiAgIGRybS94ZS9vYTogRW5hYmxlIFhlMisgb3Zl
cnJ1biBtb2RlDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgIHwgICAgMiArDQo+ICAuLi4vZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29t
bWFuZHMuaCAgfCAgICAzICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9y
ZWdzLmggICAgICB8ICAgIDIgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3RfcmVn
cy5oICAgICAgICAgIHwgICAgMyArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9vYV9y
ZWdzLmggICAgICAgICAgfCAgMTAzICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Uu
YyAgICAgICAgICAgICAgICB8ICAgMTkgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2VfdHlwZXMuaCAgICAgICAgICB8ICAgIDQgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
X3R5cGVzLmggICAgICAgICAgICAgIHwgICAgNCArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX3BjLmMgICAgICAgICAgICAgICAgfCAgIDU3ICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfcGMuaCAgICAgICAgICAgICAgICB8ICAgIDMgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2h3X2VuZ2luZV90eXBlcy5oICAgICAgIHwgICAgMiArDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfbHJjLmMgICAgICAgICAgICAgICAgICAgfCAgIDExICstDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfbHJjLmggICAgICAgICAgICAgICAgICAgfCAgICAxICsNCj4gIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9tb2R1bGUuYyAgICAgICAgICAgICAgICB8ICAgIDYgKw0KPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX29hLmMgICAgICAgICAgICAgICAgICAgIHwgMjM3MCArKysrKysrKysrKysr
KysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX29hLmggICAgICAgICAgICAgICAgICAgIHwg
ICAyNyArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfb2FfdHlwZXMuaCAgICAgICAgICAgICAg
fCAgMjMyICsrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGVyZi5jICAgICAgICAgICAgICAg
ICAgfCAgIDY3ICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wZXJmLmggICAgICAgICAgICAg
ICAgICB8ICAgMjAgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgICAgICAgICAg
ICAgICAgIHwgICA3NyArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcmVnX3doaXRlbGlzdC5j
ICAgICAgICAgfCAgIDI0ICstDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICAgICAg
ICAgICAgICAgICAgfCAgMjkxICsrDQo+ICAyMiBmaWxlcyBjaGFuZ2VkLCAzMzIxIGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL3hlL3JlZ3MveGVfb2FfcmVncy5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX29hLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfb2EuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9v
YV90eXBlcy5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bl
cmYuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wZXJmLmgN
Cj4gDQoNCg==
