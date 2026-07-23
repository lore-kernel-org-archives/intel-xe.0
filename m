Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9EAC531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D178910E5CA;
	Thu, 23 Jul 2026 16:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqGQQuu3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765C810E5CA
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 16:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784825240; x=1816361240;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iPYwnWLxXl5spTmBzXXl20ZXHlhjHaS6SHC7K+jmEa8=;
 b=QqGQQuu3LI59aR7/uYRGMqFEmPYhIQRyKggbvth+szoQopExBsxEvLip
 YeM5UoiFq3eT4efyuaEA/gcwFyokjP1W7S7lGDsY0vA7Kzb7WQJyO/V9x
 0sD7Pq0pDOZL6cgFoYaD2z80d9DnQdptgl7g2vRweYKUUuQXFMgalfzzH
 nskiEUKCOiWkfm2mFZ3yAmjhoYvQNdrMgAHXdh8BqILOrG/TDaemBHOgi
 YopCruZ4ZrQoymkKNR78IWjoBS6D8v1rrzTHhsE7qRaSlXuwDP2JkImI6
 Ag5b/kC68FzKgX79xmtcBWzOyPLNc4FaCysrvSTuRePclW0dKrW9cSS2p g==;
X-CSE-ConnectionGUID: AOGN5REaQbWhVxibyw/pAQ==
X-CSE-MsgGUID: I/bMg0mfRHSHk9qnfUZP6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="108276734"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="108276734"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:47:19 -0700
X-CSE-ConnectionGUID: VhZohKonTKmybkOzi9ojVg==
X-CSE-MsgGUID: IYyNxrOcTG+M5I/KP2EMEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="257194442"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:46:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:46:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 09:46:55 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:46:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaBqMIKnlzLE5TJwHILmt7rUlgh7APFNT1Z0c7icEah03x8962N/uloy2TEgtkb0KdaUsWzBPeuBizQDqnYEPdRkIjUqnuDh5OrloL9+mnJedj0G51zpv4P63obOC1TUmo3fORP7SKfm2C4mFWaj1+kVCyyw6NrE9pgWqzoGf31fdfr/Ib1iiOhtzNN4arWpwRvLUGYUropm4OObZXb+fPqifW7ADgJ5KPNlX5BVhOE3u4ciJAea+mJV0W2xIdYp0F3etXbw5Iav0x3mriqOXaar1vnnUYM3o7CKm+C27JEvhL4PIfiKxRCPvO7F07ZgZzNnSCSn2uBfZypaeQmOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPYwnWLxXl5spTmBzXXl20ZXHlhjHaS6SHC7K+jmEa8=;
 b=hjxytCYxYp776YthLBOi+HYSzzmc6Ud6DR/rgCQbxZw5oFsV+LAbliESSiLKt2+pzboxGzGEHcy1ogkYURh4XlM2nWxoePSReYlpsXQ8fP6C1zUd7BpRSmRdlg+a+BxfoQYB0eW5NTO2vn+xhbPFe3XsvZrveoH792pWlYWTPmD19o7T56g5RqpGhcF79dKUpCGG/eYBYJFikTC7CT2H2E+6IQ0gTgOqf9k28fk7UnkwlQinIBY7m3or6M98qZmhLVQDj5cfbJ905teq+dR+to7fb3qZthZ/ijrbGDekUeWH4DEmDwKIsLiJ2X/mMF8irIRscyDVl6SHh1EhLYDkeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by SJ5PPF4422C5374.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::824) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 16:46:50 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:46:49 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 0/9] Add new debug infrastructure for configfs
Thread-Topic: [PATCH 0/9] Add new debug infrastructure for configfs
Thread-Index: AQHdGiOneX7w0Eq7yU68VKFYJRqVmrZ7UWYA
Date: Thu, 23 Jul 2026 16:46:49 +0000
Message-ID: <1c64d19dd90a90d6b9c7c4762c9e9bc1351d84a3.camel@intel.com>
References: <20260722214656.107936-11-stuart.summers@intel.com>
In-Reply-To: <20260722214656.107936-11-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|SJ5PPF4422C5374:EE_
x-ms-office365-filtering-correlation-id: a88a1456-a693-4c6c-aa18-08dee8d9fdd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003|3023799007|38070700021;
x-microsoft-antispam-message-info: tW5J6uDw/XuuIsbiIbKfK/K2J3vAhuGTIPCM/0bca2uq4/JX2f1747QTar5w0hbr9vSVfuH/Sk+yDfFXy/NXAFJkGs70Yl0SI4z2vLQJ1fkskf7D52N7ZJ+bO59jlguByqT0ME/2ifX2hHepNqK19A77gyJJ6w3qRF2VV0rkpe4OHz1NMRVHyp2/1QuRHV7MYriVI3TSJ9gqrXopObYGBu3o3/2Un/A7SkqS6VYyDZdKAA/VhJ0VV0HLVB2JEXubbXkLEnwMuv1o2wA0v1VKyEE2Js9K9l59IK2lysK4QNDs+DiU/6uJC4RqiwYP7f8wq3Ujh06mdcJTkla/uBL4aRyEKsIq8VEZO9ztVc+PoMGqSFMeI3TrcQQuHgK9+cfGWaGj/sGIVdD4tye3+k9iXAMl+rvmlDHbeSwudlet7V5wxp5bF8w3LYL2mXzKbNqBrhVpXfkD3ZczBKIMBeDEVGq3OxYi3+UHFuv23hpRawLgV4CadDxOXKq/ZSpbVHxje6OamfpL0vpNfH9m9X+4U8w3zWymRTIYN6yMEKe0Z5fldcNR/rjmnJ4b9tgQBxn9LHKnqrPNgxExAtCd4zTrvPemJk7yJVND+GM/lLm0TiXEIgpXjUWClt5IH9vJzxMT/JuMh0Ubqm8f28SLYCxGvFB8M1QetZrJPt2jGz6RvBY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWhubkg4UmZtMGptOGV3WHV1WVo3RkZ6RThVNW5PcTY1Tm84d1NFc2dYQnlw?=
 =?utf-8?B?Q0tUb0loQ3h5MzJkbFh2M0FVMFlUMmJJakVLNDFtYjBzclZyeUdpaXg5VTdk?=
 =?utf-8?B?cGd6U2dkRkptV1RkRXhvc0dJeGMzQk1odVptbFJNTitCbXQrT0lMMHVDT21P?=
 =?utf-8?B?cmpkci8xd1pCT1Q1YWYvQzZTTHFwTVoxa2tqS25yNmxjanVxL3Bid1dQSlpH?=
 =?utf-8?B?bkZiSjF1Ykk4QmMrWG5uemdQajhCVWZVN3U0b09SM0pja2N3bnozSGtaUnk2?=
 =?utf-8?B?bVhIdnlGTVFWcE1hclhCQzdmV3ZrTlBwUnZpRyt1aTRpdHRHL2taOS84Wits?=
 =?utf-8?B?UkxZd3hLV0NiTEpOaDlmTTVDTjQwRlMwUTVFOUI1RGNHTHZnd2llSUNhVEFm?=
 =?utf-8?B?MHkyQkg0KzBra3R3dTdXOFNYSDE2VUYrUnJDLzFxam5qUmxkVG1WTWNlemZ3?=
 =?utf-8?B?Rm4va1FkVlFqd3N0dXViYXNSd0tyTEV6OXlCZjlRbllRYVVCbUs4QXcwU2or?=
 =?utf-8?B?QXhMSVdPS1NUNHRDVnVRTmlaS1RFNXFTTlh0MWROWEFRSUpiOHp2TFpVQkVL?=
 =?utf-8?B?Z1VnY05NWmJlL25pdzlsY0xUZlFUa01aZ24xaVlsQTVINHdDdjhsTzJ2UzZy?=
 =?utf-8?B?NFVLOWd5azhVZUZjek5iRG5zeFV3ZWJrV3pTSDFpR2w5M2NpKy9EdVlvVTRm?=
 =?utf-8?B?YnU2RDY3Q3hCQ0ZNQ2Z6NStKWkVvMXZXejVBdERmRnZvbitpeDZEYVQ3QUVJ?=
 =?utf-8?B?dnpEWkZvZmN4OFQwSHhBbWliMEZJZ0JMTUZUYzU0cDJHemYvbmJZSXNRUTFH?=
 =?utf-8?B?SnZoV2Q2dVNHMXc2NGkxWjZQeVZLVWFOSDlPZEtRZkk4cHdKZEhhdFNiZWYy?=
 =?utf-8?B?WjExcE5EWkdDaU50ZWZEQjk2MVk5dDk4QkJPVnNCYVdheXBva05EeWNBamdo?=
 =?utf-8?B?K01KcGtwbEdyVDNWOEw5L3M3UTAzODNITW50dCthb2VQc29ZSUdmVHI4eXRW?=
 =?utf-8?B?V1ZENHJoNkFqNmtKeW1IOW41NytMeGhmQ2dnVG5XdTZhckZkTFBkUkNjb0VY?=
 =?utf-8?B?SGF4c1hRelp6ZUhoT0VLSGk5Tk41Rm5NRHhDYjFaeEN0Z3d0RHV0ZVExZnN4?=
 =?utf-8?B?cnhDa2daY3VZcGptbTc2QjZSK2dxUkZBODZORHZMODVPL21ldkJ1K1ZaN2hG?=
 =?utf-8?B?N2dVT2tTZlNLc2xaZXRia3c1NlFJdGdGYy94SFBMWUlPUmp2aGFkKzdoR0cz?=
 =?utf-8?B?WVUxQnppVXRvK2RmbzM3T3ZkbU52VVNWYTYrdjdIMUNLVzNnVmU4WmNJcWw4?=
 =?utf-8?B?Y1djUUd0N2tEK0pHbGEzS0ZNeldSNE5MMUZnODdFeEZWdzFYVVVEbnBTRFp5?=
 =?utf-8?B?WnNHc0VlRm9VWkdaemRvWkdlenozZDZtYW1OaWN3Q25aUk1VMEEyV0I3V25s?=
 =?utf-8?B?UitTTTBVR2pmcGljVWs2MlR5VWVyUW9qcytIOGFNaVdBSXMrY0gyZ3pjdmor?=
 =?utf-8?B?SWZCc1NhOE0zV1ROdDZsam9MdU81a2lxRVJVNzlBWExMRENGOHA4MmRGMDJL?=
 =?utf-8?B?QjhBTUx1RndLZTliZ3BqS2E3aExhYVJPSVZiSm05S3ppd2hKTWh3aU5SMUl2?=
 =?utf-8?B?TEFKZHlNY21LYzNBY2FNaDJ4T0FaR3RIZmxCeS9rMkZWa1o4V29mRnd4NzhN?=
 =?utf-8?B?c0RpbHlvVldZREtVM1U0L1g1TTFWZmFiZXBRU1FyMHJlM2lJRGJyZG5LMndq?=
 =?utf-8?B?cEtwZFRmVUNtaCt3dytNKzNtT2huUFZyV3ZwaHpsa2RtcERkaGpRb1V1Q3VB?=
 =?utf-8?B?REQ4RDIrWEdEK1hIYlJTdHB6aDd3eGtydmcyWE5hZnA2d202ckV6ZThXS3BX?=
 =?utf-8?B?R0NXLzBhY05WL3owMzA1Y1pOUmE5NWV2Tnd5VGFwZm5raE9wUFdsTW5JR0hG?=
 =?utf-8?B?Q3JhZ3pBYkZMSkZOejk5ejVpMjRSZEp6ZUljcU9RczV0aHZYRGRueWpiNG1h?=
 =?utf-8?B?S21JalVMWDRxZFZUZkZqbFJVZDBBWHIzZ0hTZENYTGM1NXFVY1JUM2dtRTMx?=
 =?utf-8?B?ODdIN0xwQTRTVjhRaElmZlhlTG4yK0dOVkdtaTdMbmxqSmVhWWIwckhsTXBZ?=
 =?utf-8?B?VnZjWEZpcEFpM3VTQUt0dklFc1dOZE0vdFlzNjZwQkZtS0ZwMlRGa2NvMFdH?=
 =?utf-8?B?bXZCelZqYnN5MWlveXVtV1VvUHE5SStOb3k5Wm5tcHMrclMvWG5MeDJuRTA3?=
 =?utf-8?B?ZVpsRUtYQjRyeVFFODBjdTRiV0luTENhTWVnYlVMVUpTN2ZsT01EWXVBcXFu?=
 =?utf-8?B?aFBnSTJwUS9WRmtmVWJ4UlRYNitqblN2clFUaUVTZ1o4UnZaN2JGbFowR2sv?=
 =?utf-8?Q?TUXpAkOXeui03Ye0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E83E12E1FD41E438DFAD6950A23A63A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TeyQIi4nCSnp+WTYilNECm8OHzuw2QR89m9QLDTfVT6vaI2TDAwTW/J4O3K1LP9O+SW8Sa/Pet+al9gCbsY+59AEe2PzVgIRKrmbR8NiCYRfSQ1azMzpN+rS5Z1cDfZGPlnFrslqpLp7AlllXfyK33+X2q8+Hw1jVd1i8R2Pf4O2eVZK/ZfiTaddelthXjT1Kjhox8d6rWYjBdMNyq7xZfbJpV6MY9Hu7EyltGW09KYU/Iqp6T4Bkjc9Vfb/FGkhVdpsIyZMfK90IWAqEphnJAShs08YRM2EIFKvVUtAoMeTSToOx2rLj5VtMMBvqqn12U12YD3A7RUpwiMIXP6CKA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88a1456-a693-4c6c-aa18-08dee8d9fdd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 16:46:49.7206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PxHWJHQzD2aEtygt6YKkXk+xYIg7aSEiX+60kQQanDZbv2TPqMI2rPFKiqEkNmrIT3NFfDg00DOJ9jy+eNk8h9XaMNa3grCB/VDZr+6PbYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4422C5374
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

VGhlcmUgYXJlIGEgZmV3IHZhbGlkIHJldmlldyBjb21tZW50cyBmcm9tIHNhc2hpa28gSSdsbCBp
bmNvcnBvcmF0ZSBhbmQNCnJlcG9zdC4uLiBqdXN0IGFuIEZZSSB0aGF0IEknbSB3b3JraW5nIG9u
IHRoYXQuLi4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCk9uIFdlZCwgMjAyNi0wNy0yMiBhdCAyMTo0
NiArMDAwMCwgU3R1YXJ0IFN1bW1lcnMgd3JvdGU6DQo+IEFkZCBhIG5ldyBjb25maWdmcyBkZWJ1
ZyBncm91cC4gVGhlIGludGVudCBvZiB0aGlzIHN0cnVjdHVyZSBpcw0KPiB0byBhbGxvdyB1cyB0
byBzZXBhcmF0ZSBBQkkgZmFjaW5nIGNvbmZpZ2ZzIGVudHJpZXMgZnJvbSB0aG9zZQ0KPiB3aGlj
aCBhcmUgcHVyZWx5IGZvciBkZWJ1ZyBwdXJwb3Nlcy4gQW5kIGl0IGFsbG93cyB1cyBtb3JlDQo+
IGZsZXhpYmlsaXR5DQo+IGluIGhvdyB3ZSBkZWZpbmUgdGhvc2UgcGFyYW1ldGVycyB1c2VkIGZv
ciBkZWJ1Zy4NCj4gDQo+IEFkZCBhIG5ldyBpbmZyYXN0cnVjdHVyZSB0byB0aGlzIGRlYnVnIGNv
bmZpZ2ZzIGdyb3VwIHRoYXQgbGV0cyB1cw0KPiBlYXNpbHkgZGVmaW5lIHRoZSBwYXJhbWV0ZXJz
IGluIGEgcXVpY2sgbGlzdC4gVGhpcyBpcyBwcmltYXJpbHkNCj4gdXNlZnVsIGZvciBzaW1wbGUs
IHNpbmdsZS10eXBlIHBhcmFtZXRlcnMgc3VjaCBhcyBlbmFibGUvZGlzYWJsZQ0KPiBmZWF0dXJl
cyBvciBzaW1wbGUgdmFsdWVzIHBhc3NlZC4gRm9yIG1vcmUgY29tcGxleCBwYXJhbWV0ZXJzLA0K
PiB3ZSB3aWxsIHN0aWxsIG5lZWQgdG8gZGVmaW5lIHRoZXNlIHNlcGFyYXRlbHkuDQo+IA0KPiBQ
dWxsIHRoZSBHdUMgdGFyZ2V0IHJlbGF0ZWQgY2hhbmdlcyBmcm9tIFsxXSB0byBmaXQgd2l0aGlu
DQo+IHRoaXMgbmV3IHN0cnVjdHVyZSBhbmQgYWRkIGEgbmV3IGRlZmluaXRpb24gZm9yIGd1Y19s
b2dfbGV2ZWwNCj4gb24gdG9wIG9mIHRoZSBleGlzdGluZyBtb2R1bGUgcGFyYW1ldGVyICh0byBl
bnN1cmUgd2UgYXJlbid0DQo+IGltcGFjdGluZyBleGlzdGluZyB1c2VycyBvZiB0aGUgbW9kdWxl
IHBhcmFtZXRlcikuDQo+IA0KPiBOb3RlIHRoYXQgdGhlIGRlYnVnIHBhcmFtZXRlcnMgaGVyZSBh
cmUgYWxsIHRvIGJlIHVzZWQgImF0IHlvdXINCj4gb3duIHJpc2siLiBXaXRob3V0IGhhdmluZyBp
biBkZXB0aCBrbm93bGVkZ2Ugb2YgaG93IHRoZXNlIGltcGFjdA0KPiB0aGUgc29mdHdhcmUgYW5k
IGhhcmR3YXJlLCB0aGVyZSBjb3VsZCBiZSB1bmZvcmVzZWVuIGNvbnNlcXVlbmNlcw0KPiBvZiBz
ZXR0aW5nIHRoZW0uIEFzIHN1Y2gsIHRoZXkgYXJlIGFsbCB3cmFwcGVkIGluIGENCj4gQ09ORklH
X0RSTV9YRV9ERUJVRyBjb25maWdmcyBvcHRpb24uDQo+IA0KPiBJbiB0ZXJtcyBvZiB0aGUgcGF0
Y2hlcyBoZXJlLCBJJ20gc29ydGluZyB0aGUgZXhpc3RpbmcgcGFyYW1ldGVycw0KPiBieSBuYW1l
L3R5cGUuIEkga25vdyB3ZSBoYXZlIGEgZmV3IG90aGVyIG1vZHVsZSBwYXJhbWV0ZXJzIHRoYXQN
Cj4gY291bGQgbWlncmF0ZSBoZXJlLCBidXQgSSBkaWRuJ3Qgd2FudCB0byBvdmVybG9hZCB0aGlz
IHNlcmllcw0KPiB0b28gbXVjaCwgc28gdGhlIGZvY3VzIGZvciBub3cgaXMgb24gdGhlIGV4aXN0
aW5nIGNvbmZpZ2ZzIGVudHJpZXMNCj4gYW5kIGRlbW9uc3RyYXRpbmcgdGhlIG5ldyBzdHJ1Y3R1
cmVzIHdpdGggdGhlIEd1QyBsb2cgbGV2ZWwgYW5kDQo+IHRhcmdldCBwYXJhbWV0ZXJzLg0KPiAN
Cj4gSSB1c2VkIEdpdEh1YiBDb3BpbG90IHdpdGggQ2xhdWRlIHByZXR0eSBleHRlbnNpdmVseSB0
aHJvdWdoIHRoZQ0KPiBwcm9jZXNzIGhlcmUgYW5kIGF0dHJpYnV0ZWQgYXMgc3VjaC4gSGFwcHkg
dG8gYW5zd2VyIGFueSBxdWVzdGlvbnMNCj4gYXJvdW5kIHRoaXMuIFRvb2sgYSBiaXQgb2YgdGlt
ZSBnZXR0aW5nIGJhY2sgdG8gdGhpcyBzZXJpZXMgYXJvdW5kDQo+IG90aGVyIHdvcmssIGFuZCBp
biB0aGF0IHRpbWUgSSB3YXMgcGxheWluZyBhcm91bmQgd2l0aCBhIGZldw0KPiBkaWZmZXJlbnQN
Cj4gbW9kZWxzLCBoZW5jZSBzb21lIG9mIHRoZSBwYXRjaGVzIGFyZSBzaG93aW5nIG11bHRpcGxl
IG9mIHRoZW0uIEkNCj4gdHJpZWQgdG8gYXR0cmlidXRlIGVhY2ggYXMgSSB3YXMgaW1wbGVtZW50
aW5nIHRoZSBjaGFuZ2VzLg0KPiANCj4gSSBhbHNvIGRlY2lkZWQgdG8gZHJvcCBKb2huIEhhcnJp
c29uIGZyb20gdGhlIE5QSyBwYXRjaC4gSXQgaGFzDQo+IGJlZW4gbW9kaWZpZWQgcXVpdGUgYSBi
aXQgZnJvbSB0aGUgb3JpZ2luYWwsIGJ1dCBtb3JlIGltcG9ydGFudGx5DQo+IEpvaG4gaXMgbm8g
bG9uZ2VyIHdpdGggSW50ZWwgYW5kIHRoYXQgZW1haWwgYWRkcmVzcyBpc24ndCBhdmFpbGFibGUN
Cj4gYW55IG1vcmUuIElmIGl0IG1ha2VzIGEgZGlmZmVyZW5jZSBoZXJlLCBKb2huIGFuZCBJIGhh
ZCBib3RoDQo+IHNlcGFyYXRlbHkNCj4gaW1wbGVtZW50ZWQgdGhpcyBzYW1lIGNoYW5nZSBhdCBk
aWZmZXJlbnQgb2NjYXNpb25zIGZvciBkZWJ1Zy4gVGhlDQo+IG9uZSBJIHVzZWQgdG8gc3RhcnQg
dGhhdCBpbml0aWFsIHNlcmllcyB3YXMgY2hlcnJ5LXBpY2tlZCBmcm9tIGhpcw0KPiBsYXRlc3Qg
dmFyaWFudC4NCj4gDQo+IHYyOg0KPiDCoC0gSW4gdGhpcyBzZWNvbmQgcmV2aXNpb24gSSBkaWQg
Y29uZmlybSB0aGF0IHRoZSBndWNfbG9nX2xldmVsDQo+IMKgwqAgbW9kdWxlIHBhcmFtZXRlciBp
cyB0YWtpbmcgcHJlY2VkZW5jZSBvdmVyIHRoZSBjb25maWdmcyBwYXJhbWV0ZXINCj4gwqDCoCBh
bmQgZW5zdXJlZCB0aGUgb3RoZXIgcGFyYW1ldGVycyBzZWVtIHRvIGJlIGF1dG9nZW5lcmF0aW5n
IGFuZA0KPiDCoMKgIHdvcmtpbmcgYXMgZXhwZWN0ZWQuDQo+IMKgLSBJIHRyaWVkIHRvIGFkZHJl
c3MgYWxsIHRoZSByZXZpZXcgZmVlZGJhY2sgZnJvbSB0aGUgZmlyc3QNCj4gwqDCoCByZXZpc2lv
biwgWzJdLg0KPiDCoC0gSSBhbHNvIGRpZCBhbm90aGVyIHBhc3Mgb24gdGhlIHNvcnRpbmcgc2lu
Y2UgdGhlcmUgd2VyZSBhIGZldw0KPiDCoMKgIGRpc2NyZXBhbmNpZXMgSSBub3RpY2VkIGluIHRo
ZSBmaXJzdCByZXZpc2lvbi4gSSBrZXB0IEd1c3Rhdm8ncw0KPiDCoMKgIFItQiBvbiB0aGF0IG9u
ZSwgYnV0IHdvdWxkIGxpa2UgYW4gYWNrIGJlZm9yZSBtZXJnaW5nIGF0IGxlYXN0DQo+IMKgwqAg
dG8gY29uZmlybSB0aGUgcGF0Y2ggaXMgc2FuZS4NCj4gwqAtIEFuZCBmaW5hbGx5IEkgbW92ZWQg
dGhlIGdldHRlciBmdW5jdGlvbnMgaW50byB0aGUgWC1tYWNybw0KPiDCoMKgIGdlbmVyYXRvcnMg
c28gd2UgY2FuIGF1dG9nZW5lcmF0ZSBtb3JlIG9mIHRoZSBzaW1pbGFyIGZ1bmN0aW9ucw0KPiDC
oMKgIGJldHdlZW4gdGhlIGRpZmZlcmVudCBwYXJhbWV0ZXJzIGluIHRoYXQgZGVidWcgcGFyYW0g
bGlzdC4NCj4gDQo+IFsxXTogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy8xNjIwODcvDQo+IFsyXTogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy8xNjU4NzkvDQo+IA0KPiBTdHVhcnQgU3VtbWVycyAoOSk6DQo+IMKgIGRybS94ZTogU29ydCB4
ZV9jb25maWdfZGV2aWNlIGZpZWxkcw0KPiDCoCBkcm0veGU6IFNwbGl0IG91dCBjb25maWdmcyBk
YXRhIHN0cnVjdHVyZXMNCj4gwqAgZHJtL3hlOiBBZGQgYSBuZXcgZGVidWcgZm9jdXNlZCBjb25m
aWdmcyBncm91cA0KPiDCoCBkcm0veGU6IE1vdmUgZGVidWcgY29uZmlnZnMgZW50cmllcyB0byB4
ZV9jb25maWdmc19kZWJ1Zy5jDQo+IMKgIGRybS94ZS9ndWM6IEFkZCBjb25maWdmcyBzdXBwb3J0
IGZvciBndWNfbG9nX2xldmVsDQo+IMKgIGRybS94ZS9ndWM6IEFkZCBzdXBwb3J0IGZvciBOUEsg
YXMgYSBHdUMgbG9nIHRhcmdldA0KPiDCoCBkcm0veGU6IEFkZCBpbmZyYXN0cnVjdHVyZSBmb3Ig
ZGVidWcgY29uZmlnZnMgcGFyYW1ldGVycw0KPiDCoCBkcm0veGU6IE1pZ3JhdGUgZXhpc3Rpbmcg
ZGVidWcgY29uZmlnZnMgZW50cmllcyB0byBwYXJhbXMNCj4gwqDCoMKgIGluZnJhc3RydWN0dXJl
DQo+IMKgIGRybS94ZTogVGFpbnQga2VybmVsIHdoZW4gZGVidWcgY29uZmlnZnMgcGFyYW1ldGVy
cyBhcmUgc2V0DQo+IA0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDIgKw0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS9hYmkvZ3VjX2xvZ19hYmkuaMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDggKw0KPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCAxMDE3ICstLS0tLS0tLS0tLS0tLQ0KPiAtLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9jb25maWdmcy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgOTAgKy0NCj4gwqBk
cml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVidWcuY8KgwqDCoMKgwqDCoMKgIHzCoCA4
NzAgKysrKysrKysrKysrKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVi
dWcuaMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQ4ICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Y29uZmlnZnNfZGVidWdfcGFyYW1zLmMgfMKgIDE1MSArKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfY29uZmlnZnNfZGVidWdfcGFyYW1zLmggfMKgIDE5MiArKysrDQo+IMKgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX3R5cGVzLmjCoMKgwqDCoMKgwqDCoCB8wqDCoCA1OSArDQo+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlZmF1bHRzLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqDCoMKgIDUgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxNCArLQ0KPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfYWRzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAg
MSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19sb2cuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqDCoCAzICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vu
Z2luZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSArDQo+IMKgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2xyYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgwqAgMSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BzbWkuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAzICst
DQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3J0cC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgwqAgMyArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdXJ2
aXZhYmlsaXR5X21vZGUuY8KgwqDCoCB8wqDCoMKgIDEgKw0KPiDCoDE5IGZpbGVzIGNoYW5nZWQs
IDE0ODQgaW5zZXJ0aW9ucygrKSwgOTg2IGRlbGV0aW9ucygtKQ0KPiDCoGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVidWcuYw0KPiDCoGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVidWcuaA0KPiDCoGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVidWdfcGFy
YW1zLmMNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZp
Z2ZzX2RlYnVnX3BhcmFtcy5oDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9jb25maWdmc190eXBlcy5oDQo+IA0KDQo=
