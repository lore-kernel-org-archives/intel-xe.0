Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32DEC02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 07:45:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A98210E083;
	Mon, 10 Feb 2025 07:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDW8evxg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C4410E083
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 07:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739173508; x=1770709508;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LdY0pywlxpBUR48Y4w9wC6P7KTzHM8LFoF7Zdl7TogE=;
 b=dDW8evxgivgnWGrXl6hQpCLL8cOMSbCDXxmzlLYZeuH6ibuO7UtSD6KS
 MQv9h+O6q5jLQ0idaj1Ijn9nYNvN4GjnXMzVOiDigJCAJPZFF+qNW0Zpu
 wKQKOBodRrP+fsExOAoIq7RYccBiJLzbaMso64kUVsXdSAwXQHlfnayMO
 ptqbNAjvxSXqgYejiO0xlbQLXVcqK3e5nQecsWfIl1hyPkPsteXE+GNqb
 izqK6BU/DgwlwAm4QEBSBkUa5U37AloIxhtbKNWv5vxv8zpLaG7WOE74v
 waagbBug+jMLW3nb38FI/yA+VMRDb+Jiln1hQCRsj3mTv4fcMxlgkeXlZ g==;
X-CSE-ConnectionGUID: ybQoH3scTbOKgsKqvs2X4A==
X-CSE-MsgGUID: Ami8Lnm2RaG1dyTb/E31YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="43666969"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="43666969"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 23:45:08 -0800
X-CSE-ConnectionGUID: LGAqyBh0QgS+y0HMd0lvGQ==
X-CSE-MsgGUID: 563o2wEZQo+Yb/sUzAzX8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135365266"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2025 23:45:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Feb 2025 23:44:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Feb 2025 23:44:39 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Feb 2025 23:44:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbrEW2oByqz0z7bv6m1HU1RLwNHg9T38mBJJ74OzesCl1E/enZDGWXtlH1Daz1uOdYObNp51Wh1ihyvNmzja9lKycSj8aTk9Tqbq9e8FPiIBQCGh4rk7Wi779mXVlNN65+xT4E4iW+QRIpv6pZRbEP/PITBRd/SJf7cRzW3WJ56r8pQ1+B8laecYy98RzxmAvS4XKiA2evJeDlNURRnjZpwQXHl35Z8a0rAW5UfdN07lpdd+NTaE12UOZmS9vzwq+KJP+aXmU3hE1VcylSqNxbmXqojvB70/JkygMG1l1aWLlPgVm9bHC2nYZywKjKG6HnQcAkSGyGkkXrSMEpIrhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdY0pywlxpBUR48Y4w9wC6P7KTzHM8LFoF7Zdl7TogE=;
 b=bg3xi8k81QPYhaV2dWApVMtXKmW9vT0lsBtO9BnOCF0s3yRMwH36oDdwYzE14tgpuoyobUuTP80ANR/LDbe0Jmeu9rpnBL3j51+3ewVe2NlRgvRPDR8uXPSUPrHuCJRklNbxYWKJEqRVgeGyuKq87Urfv6QoObWZd/bwnvNMTQLA5op6NQzKTpn6ZbbtLRNTkYkeuWGJ1rgc5/ZNuS+ePklN92oAHgueSwqA5k/R6zIy99PfAaMtgL1Qiq3nDKc2cYrgk1cgd4J0ZIhe6oJ6DNuYcw2kjIYWoV25dp+PHYynCZL80XRapZOO8WLo+iZWU0fj2LnufXz8pu1no/R+UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by LV8PR11MB8559.namprd11.prod.outlook.com (2603:10b6:408:1e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 07:43:49 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 07:43:48 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Winiarski, Michal"
 <michal.winiarski@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v4 1/1] drm/xe/pf: Use an explicit check to see if the
 device has LMTT
Thread-Topic: [PATCH v4 1/1] drm/xe/pf: Use an explicit check to see if the
 device has LMTT
Thread-Index: AQHbeVPXB7AbBQWH1Ei9XbKzc0GZcbNALBxg
Date: Mon, 10 Feb 2025 07:43:48 +0000
Message-ID: <LV3PR11MB8695FD0BF0B73A6BBEE91B94F9F22@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250207113111.853821-1-piotr.piorkowski@intel.com>
 <20250207113111.853821-2-piotr.piorkowski@intel.com>
In-Reply-To: <20250207113111.853821-2-piotr.piorkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|LV8PR11MB8559:EE_
x-ms-office365-filtering-correlation-id: c6f1c889-1469-4ba4-4cfe-08dd49a6a7dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RVpadk9zblpoZDVTbjdnVU5UcFpHV1hTQmFTVEVwejZDM1VWaTFmWTM3K1Rs?=
 =?utf-8?B?STRFak9jaW5hVGxtYkVVdFppZkFiYVkrNlVMY1lHZCtLNTV2S01TQ2dxLys3?=
 =?utf-8?B?TEprZ2xRUTE3U3BSekEyenkveWRLV25jYVBVWHdPbDdqWHEveU9Ed2tlbVdo?=
 =?utf-8?B?d3lKcE5Hbnh5S0R1bG9FN2ZnWVFNbVhZZ29EVkRKSDJkWDltZG5kUTdHRTBB?=
 =?utf-8?B?NDY4ZmRUb2hGVGtod1R1aG5WU2NQaUdDc0dRcDQ1WG5uczFieFpSNFFNVWVL?=
 =?utf-8?B?cTEzMlltWUlJVFdKZzJNZkFocWdKeWcyWVR1MVdhZ01YdThMVDMrRzRITXgx?=
 =?utf-8?B?a05MQTRYRVRFNGFRbnpkb3IwRXBrVTkwSzArYUN5Q3NKQmNPRWdDSVhGS3pJ?=
 =?utf-8?B?Mm5OWlFGWjNLVUpFdytuNkMyZVBLUklobFp2dmgrQ2JhU3pyUXphRUU3OEVZ?=
 =?utf-8?B?RjQwdjdOQ1B2Mk1nK0JJTDdpRUc0a3lubFJ3dmt6NituWnRZeXM0TWdlZndV?=
 =?utf-8?B?RExiaVBQVFovdnlBSVdqeVdsKzZrM3hMdFNCblhheCszcTJQek9UU1dwZldn?=
 =?utf-8?B?dUN2Wk5MZGRJMWpBT09NWk1Rb0x5NWIwUjBZcXkxcWYvV3Y0V1lBYkp2QjV1?=
 =?utf-8?B?azBmaytXMnpUYm9vRHJicnJFUGQ2M1hyQnJhamEwdlJiNUZxK1NHa2c0Y3BW?=
 =?utf-8?B?RWg2WjJiNmNIMVgwcXIwQUVoK3BtdDhEL2xIaktSOTAraUxqL2FEdGt0c3ZP?=
 =?utf-8?B?bi9vdDI0ZWk4KzRUblFrYVg4Y3pZYWtUSUpuRUpZL2QvUFZwZkk5ZDJxRzU0?=
 =?utf-8?B?RkJuWWp4K2lDYWVTbGhZWlRJckg3MjJSeks5TzdDMFdIc2ZXSzM2SkEzMjlH?=
 =?utf-8?B?ZTY1UkIyYU9uSkRIcDdCVEZsYzk5VXJ3ZDhNS296OWg3bklrd25CcjNzeGtS?=
 =?utf-8?B?V0NjaXhzaWt3dlNEV3Brbmh4MVA1SUM3UU9KWGFoVStrV3R6WENSc1ZKK2Q1?=
 =?utf-8?B?eDR5OWdnVmppdFRSMXdQRytGbllNTnh3ZDg0SnNTSDRDWWYya2FPem0weEFY?=
 =?utf-8?B?Zk1vL0tKQzNVdUovMzBsMVQ2ZmdTOFQ3bGZocHJkZmFtTVk1aU1GNnRVMU9r?=
 =?utf-8?B?NzRYZXc2M2lvTDI4dGtQME9jcVJkV0tZWTQyU0pNdUkvU1FVeGxkbk5ySTFZ?=
 =?utf-8?B?VU10VHF0VndNdXNBWTUrSVpQSUdOME1qeU9yRHN1bjl3Sm5CUDFibCt2L2Jy?=
 =?utf-8?B?Sm50cHRnR1RwVDVab0F5ejZpM2ozWFVWNHRSQ2JBK1pZN1hvaDFZb3RqbUVo?=
 =?utf-8?B?V2twbG1NVkhFd1BJaklQU1pYdWpPUnBrRFVhSzNwUVRUZWM2Y0xyRkZTM2Z6?=
 =?utf-8?B?V2xTMzVpK2gwTFNmaWU0bzhjNFNRYjRRczJZNjhrcHhkYTl3cWVVOVhDVS9p?=
 =?utf-8?B?TW83enQzdnpOZG9kVFlvOW9wb0JrNUNTOVVzZHIxRDgyUXhzSnRob3pLS21O?=
 =?utf-8?B?b2UvTGo2Y0VnNVloMTJrS3hMT0FrVVl6RU4yNnlSMDVZbmNLRlBBOG4zRmhZ?=
 =?utf-8?B?c053NmkvSERDNjdjcU5ITUMvN2dBQzZiczhBczlLZjlzYnBVL0xicUZ1YXhK?=
 =?utf-8?B?d2Z4RzdBbkd3L3NXZTdETmEyUC8zbjRseU9mdG5qZjdRbG9DbHhWNXN3aEhj?=
 =?utf-8?B?WkM2dG5oNWkzQWpZSmppYnlBVnhUN1VsWFVKSXBONzZIbmM0VnY0WU85ODBi?=
 =?utf-8?B?b1lSTFlYcXlIUnF3TDYrRHlHcVRHQmo0RGpXMlhhNGNCZlRYeUVZbzRKQW90?=
 =?utf-8?B?aFFjVW5YMG9peDkzVG5yVlJhSHorUEs1dWxWZGlEeXN0cW5kd0NieVdIUVhx?=
 =?utf-8?B?dHg5YXRDRGJhejBwY1RjR2NXNi9VbkZFeFZrRkJLenp4ZFFrTmFTMU9vK2di?=
 =?utf-8?Q?6VKZu1V5F9z5xk/t8NhDEgADlCtIxUoK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXd0aDV3c096Q0xkVG9ncUlNTDl3SFN6WUl3MVdrZzFDYS9xWVdWd0Fscndk?=
 =?utf-8?B?a2lFUkhQVjE5dm1yTlRrS2pwaFJvQlpnM1NlWlFIeXNPMW90bVJBQTJtcDV1?=
 =?utf-8?B?Q0dtSXdTOXBkd3dDMHZFRWdJSHdBQ3hmdDNiZHRadERUWnNKbFNkK2ltU2ow?=
 =?utf-8?B?SU1qNzRjYnhVdGtTU0x1bVR0U1lPem8zb3lHc2RYVUJmSG5VUDd6bjhscE5L?=
 =?utf-8?B?U3ozOWkzUExsamRQUzN6czM1Zkcxanc0WndBc1V2YzNPaENqcUtRSENmZ0gw?=
 =?utf-8?B?eDNZVCttVlo3bjA4TU5hK1JDbVREdVVoeW11MEVuZlRnejUrbnFpSFhWTmp1?=
 =?utf-8?B?SDZOdXdPb0ZyVW1iYW40eXB2RkkwTGFBa2hUUVBnODVZWnQ4aW1PblVDdEw5?=
 =?utf-8?B?TkNDNGdkbkd6ckVBSGJNdjVjeUMxTlNNejZMNEVxU1YxTmVkVk1vTHlFbklM?=
 =?utf-8?B?T05RZWt2eWVvOStWNHRqVmozS0FRZ05VMDBFQVlmUGU2MERqRVJ3VXFUM2NX?=
 =?utf-8?B?cGZRZ3l2N1V5WFF4em5yNk1tZnlEVm1OYUs1UTJtcXFlUjVVVjVsM1AwbUI4?=
 =?utf-8?B?alVLNkRGL2d6eFJ1dGtuTXdZMnpTWnZZdzBvdlhOVTFRampLTnluOHM4U0dn?=
 =?utf-8?B?VVA2NW1CRE1CVkZ6M0xMbjdjcU1CVkpHNWVHR3BzNmxrSDlULzkyU0Q2TFo4?=
 =?utf-8?B?VDZyMXhDcWR2TW1uVU5NdnZFRFl5ektWQ3RRT3Z3Nll3bUNDdUYwMG1vYlVS?=
 =?utf-8?B?VE1zVVRQZDNwQ0s4ZmI3eXp1ZXRRajNXaXVpaExUb0Vzd1hseFYwK29NWHBW?=
 =?utf-8?B?VGN3aHdUNGpGT25PVWd5Kys2SDlTdVdEc1I3aHQvNVRYQ2VUb2xQeWlBQnVL?=
 =?utf-8?B?Z1YyUUh0bEgyL0FEN3dteGdhRXVvOUNNWEJMdGlER0NQcFlwemhZOXo2NEhj?=
 =?utf-8?B?am9ZMnl2ZnRFR1lZMEZmRnFzUVdnNjFsM1lxVnAxeTkzOVRya2FNYldOWDJv?=
 =?utf-8?B?MmI1RUkxVGtER3gwRDY2Q290bjBnbFE2Y2ZmcUV0NmNGd1h0NTlrbnFxNjFH?=
 =?utf-8?B?V1BLTUJVTXBZQXhBeEQxdFF3Nk9OeXhzRTlUa1NaRXgwaXJRdEtnZHJLZm5x?=
 =?utf-8?B?REMvNWJoV2NCNVNDM2J3azhRaGxna0lobHgvb1pQRHdrL0o0cnhDNWxxdDM1?=
 =?utf-8?B?bzNzWk5UbGd4THBNRnUwVTNxbXY4R3dwQW9rOWRkbUY1SDZOQkEyNHpPYlhC?=
 =?utf-8?B?UjdtaFVjc29zV1NpSWVabHQxSmJyU3hBS3RCUThZZDU3TitLWWNjUDVUOExz?=
 =?utf-8?B?N3Q5dUtWZkZNUjM3Y2Ezdlh5ckMvbTR3amR2d0dtaEc1YktlMkhYVGRwSktr?=
 =?utf-8?B?QmpXQnNyMVE1SytXaEpWS0hyQSs5OG03ZjZJTXdHQzYwd29tRmNUdjVRN3Va?=
 =?utf-8?B?dGRWeUlDcWxqRXFzb3dzZmxRY1BpazFYYUVFUWNhU09uNGpCL25jQUpQVUVN?=
 =?utf-8?B?bjE1Y1VqRVljdU83R3BWT2R1aktiQUFod1lwN0hXT2ZtYmtkR0s4Y3o2cThE?=
 =?utf-8?B?OERPZ0R2TXZNTUx4Z0J0cTdJck0wN2gwOWo4djVUcWRmckFCdjlDcHF5L01o?=
 =?utf-8?B?MkZLOVpneCsxc1dyWXRRNW1OVndMMTJrYStvM3hVNlZsM24yalFSSDlwUFR0?=
 =?utf-8?B?V3RMVm54dmxYVEhxRzg1c2Qwc3RhRXY0eElyMmJrUzJkbW04QWh5YnNFTEpP?=
 =?utf-8?B?Y1l5NE5aVTJzaTVsSCtxMzlxbHlJRXZlVHJmaytEeU5wcjVraWtQV3JDVGxR?=
 =?utf-8?B?blBFU29rdUlVZVIwRTUyVFQ2dlZKczBoU1FtTTQ1NXdLSFgyZEtGUG5JUmp6?=
 =?utf-8?B?RXh2Vm5OYTYrZ3RtWmJKaUI5QkQrWXlEOGV2RG9WeG9xeFFMWDZOWlV4RDc1?=
 =?utf-8?B?Y1hHNFVaRHRRZXJMQ1pqaWcvU1lkdUxpdFJGU0RyM3piVjd6VWNLZkZqYnVp?=
 =?utf-8?B?WUhxSVVBYkVUQzYxYkUvRHZCWlFNd3B1ZUg5QzcrWXJPSytlZUE3aGVwYm1N?=
 =?utf-8?B?ajNjdjZvYnVQQWRXNFR0dHNKTkNhLzFadmV5UndQZnhNbTRuQUV5bjBLU28w?=
 =?utf-8?B?am84cHZZTmp5TGpPMCtCUTBuVUY2ZWZGWGFXNW5xOW9zZGZqVkpTaHlIbGhk?=
 =?utf-8?B?U2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f1c889-1469-4ba4-4cfe-08dd49a6a7dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 07:43:48.5519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6UG9zXJR5wPNAWbETGbWnMKJByUPgJBU16f5tk3oieUNUtrKtyitmFmG6jca+tCsGMisOqn3v7SMkRCPTld2o/dMxssmvMO7Ogjmuy0VDTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8559
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

SGkNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGlvcmtvd3NraSwgUGlv
dHIgPHBpb3RyLnBpb3Jrb3dza2lAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5
IDcsIDIwMjUgNTowMSBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBQaW9ya293c2tpLCBQaW90ciA8cGlvdHIucGlvcmtvd3NraUBpbnRlbC5jb20+OyBXYWpk
ZWN6a28sIE1pY2hhbA0KPiA8TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+OyBXaW5pYXJza2ks
IE1pY2hhbA0KPiA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+OyBLIFYgUCwgU2F0eWFuYXJh
eWFuYQ0KPiA8c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRD
SCB2NCAxLzFdIGRybS94ZS9wZjogVXNlIGFuIGV4cGxpY2l0IGNoZWNrIHRvIHNlZSBpZiB0aGUg
ZGV2aWNlDQo+IGhhcyBMTVRUDQo+IA0KPiBGcm9tOiBQaW90ciBQacOzcmtvd3NraSA8cGlvdHIu
cGlvcmtvd3NraUBpbnRlbC5jb20+DQo+IA0KPiBTbyBmYXIsIHRoZSBtYWluIGNvbmRpdGlvbiBm
b3IgdXNpbmcgTE1UVCBoYXMgYmVlbiB0byBjaGVjayB0aGF0DQo+IHRoZSBkZXZpY2UgaXMgYSBk
aXNjcmV0ZSBnZnguDQo+IExldCdzIGFkZCBhIGRlZGljYXRlZCBmdW5jdGlvbiB0byBjaGVjayBp
ZiB0aGUgZGV2aWNlIHN1cHBvcnRzIExNVFQNCj4gYXMgbm90IGFsbCBmdXR1cmUgZGlzY3JldGUg
R1BVIHBsYXRmb3JtcyB3aWxsIHJlcXVpcmUgTE1UVC4NCj4gDQo+IHYyOg0KPiAgLSB1c2UgeGVf
aGFzX2RldmljZV9sbXR0IG9ubHkgd2hlbiBuZWNlc3NhcnkgLSBsZWF2ZSBJU19ER0ZYIGZvciBv
dGhlcg0KPiAgICB0aGluZ3MgcmVsYXRlZCB0byBMTUVNIHByb3Zpc2lvbmluZw0KPiB2MzoNCj4g
IC0gcmVtb3ZlIElTX1NSSU9WX1BGIGNvbmRpdGlvbiBmcm9tIHhlX2RldmljZV9oYXNfbG10dCAo
TWljaGFsDQo+ICAgIFdhamRlY3prbykNCj4gIC0ga2VlcCBJU19TUklPVl9QRiBhc3NlcnRzIGlu
IExNVFQtcmVsYXRlZCBjb2RlIChNaWNoYWwgV2FqZGVjemtvKQ0KPiB2NDoNCj4gIC0gdXBkYXRl
IGNvbW1pdCBkZXNjcmlwdGlvbg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGlvdHIgUGnDs3Jrb3dz
a2kgPHBpb3RyLnBpb3Jrb3dza2lAaW50ZWwuY29tPg0KPiBDYzogTWljaGFsIFdhamRlY3prbyA8
bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+DQo+IENjOiBNaWNoYcWCIFdpbmlhcnNraSA8bWlj
aGFsLndpbmlhcnNraUBpbnRlbC5jb20+DQo+IENjOiBTYXR5YW5hcmF5YW5hIEsgViBQIDxzYXR5
YW5hcmF5YW5hLmsudi5wQGludGVsLmNvbT4NCj4gLS0tDQpMR1RNLg0KUmV2aWV3ZWQtYnk6IFNh
dHlhbmFyYXlhbmEgSyBWIFAgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oICAgICAgICAgICAgIHwgIDUgKysrKysNCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zcmlvdl9wZl9jb25maWcuYyB8IDIxICsrKysrKysrKysr
KystLS0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xtdHQuYyAgICAgICAgICAgICAg
IHwgIDQgKystLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
LmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gaW5kZXggZmMzYzJhZjNm
YjdmLi4wYmMzYmM4ZTY4MDMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZpY2UuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gQEAgLTE3
MCw2ICsxNzAsMTEgQEAgc3RhdGljIGlubGluZSBib29sIHhlX2RldmljZV91c2VzX21lbWlycShz
dHJ1Y3QNCj4geGVfZGV2aWNlICp4ZSkNCj4gIAlyZXR1cm4geGVfZGV2aWNlX2hhc19tZW1pcnEo
eGUpICYmIChJU19TUklPVl9WRih4ZSkgfHwNCj4geGVfZGV2aWNlX2hhc19tc2l4KHhlKSk7DQo+
ICB9DQo+IA0KPiArc3RhdGljIGlubGluZSBib29sIHhlX2RldmljZV9oYXNfbG10dChzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSkNCj4gK3sNCj4gKwlyZXR1cm4gSVNfREdGWCh4ZSk7DQo+ICt9DQo+ICsN
Cj4gIHUzMiB4ZV9kZXZpY2VfY2NzX2J5dGVzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQgc2l6
ZSk7DQo+IA0KPiAgdm9pZCB4ZV9kZXZpY2Vfc25hcHNob3RfcHJpbnQoc3RydWN0IHhlX2Rldmlj
ZSAqeGUsIHN0cnVjdCBkcm1fcHJpbnRlciAqcCk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfY29uZmlnLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3Rfc3Jpb3ZfcGZfY29uZmlnLmMNCj4gaW5kZXggYjFkOTk0ZDY1NTg5Li41YzNlOWU1YmQw
NTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zcmlvdl9wZl9jb25m
aWcuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfY29uZmlnLmMN
Cj4gQEAgLTEzMzYsNyArMTMzNiw3IEBAIHN0YXRpYyB2b2lkIHBmX3Jlc2V0X3ZmX2xtdHQoc3Ry
dWN0IHhlX2RldmljZSAqeGUsDQo+IHVuc2lnbmVkIGludCB2ZmlkKQ0KPiAgCXN0cnVjdCB4ZV90
aWxlICp0aWxlOw0KPiAgCXVuc2lnbmVkIGludCB0aWQ7DQo+IA0KPiAtCXhlX2Fzc2VydCh4ZSwg
SVNfREdGWCh4ZSkpOw0KPiArCXhlX2Fzc2VydCh4ZSwgeGVfZGV2aWNlX2hhc19sbXR0KHhlKSk7
DQo+ICAJeGVfYXNzZXJ0KHhlLCBJU19TUklPVl9QRih4ZSkpOw0KPiANCj4gIAlmb3JfZWFjaF90
aWxlKHRpbGUsIHhlLCB0aWQpIHsNCj4gQEAgLTEzNTcsNyArMTM1Nyw3IEBAIHN0YXRpYyBpbnQg
cGZfdXBkYXRlX3ZmX2xtdHQoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+IHVuc2lnbmVkIGludCB2
ZmlkKQ0KPiAgCXVuc2lnbmVkIGludCB0aWQ7DQo+ICAJaW50IGVycjsNCj4gDQo+IC0JeGVfYXNz
ZXJ0KHhlLCBJU19ER0ZYKHhlKSk7DQo+ICsJeGVfYXNzZXJ0KHhlLCB4ZV9kZXZpY2VfaGFzX2xt
dHQoeGUpKTsNCj4gIAl4ZV9hc3NlcnQoeGUsIElTX1NSSU9WX1BGKHhlKSk7DQo+IA0KPiAgCXRv
dGFsID0gMDsNCj4gQEAgLTE0MzQsNyArMTQzNCw4IEBAIHN0YXRpYyBpbnQgcGZfcHJvdmlzaW9u
X3ZmX2xtZW0oc3RydWN0IHhlX2d0ICpndCwNCj4gdW5zaWduZWQgaW50IHZmaWQsIHU2NCBzaXpl
KQ0KPiAgCQlpZiAodW5saWtlbHkoZXJyKSkNCj4gIAkJCXJldHVybiBlcnI7DQo+IA0KPiAtCQlw
Zl9yZXNldF92Zl9sbXR0KHhlLCB2ZmlkKTsNCj4gKwkJaWYgKHhlX2RldmljZV9oYXNfbG10dCh4
ZSkpDQo+ICsJCQlwZl9yZXNldF92Zl9sbXR0KHhlLCB2ZmlkKTsNCj4gIAkJcGZfcmVsZWFzZV92
Zl9jb25maWdfbG1lbShndCwgY29uZmlnKTsNCj4gIAl9DQo+ICAJeGVfZ3RfYXNzZXJ0KGd0LCAh
Y29uZmlnLT5sbWVtX29iaik7DQo+IEBAIC0xNDU0LDkgKzE0NTUsMTEgQEAgc3RhdGljIGludCBw
Zl9wcm92aXNpb25fdmZfbG1lbShzdHJ1Y3QgeGVfZ3QgKmd0LA0KPiB1bnNpZ25lZCBpbnQgdmZp
ZCwgdTY0IHNpemUpDQo+IA0KPiAgCWNvbmZpZy0+bG1lbV9vYmogPSBibzsNCj4gDQo+IC0JZXJy
ID0gcGZfdXBkYXRlX3ZmX2xtdHQoeGUsIHZmaWQpOw0KPiAtCWlmICh1bmxpa2VseShlcnIpKQ0K
PiAtCQlnb3RvIHJlbGVhc2U7DQo+ICsJaWYgKHhlX2RldmljZV9oYXNfbG10dCh4ZSkpIHsNCj4g
KwkJZXJyID0gcGZfdXBkYXRlX3ZmX2xtdHQoeGUsIHZmaWQpOw0KPiArCQlpZiAodW5saWtlbHko
ZXJyKSkNCj4gKwkJCWdvdG8gcmVsZWFzZTsNCj4gKwl9DQo+IA0KPiAgCWVyciA9IHBmX3B1c2hf
dmZfY2ZnX2xtZW0oZ3QsIHZmaWQsIGJvLT5zaXplKTsNCj4gIAlpZiAodW5saWtlbHkoZXJyKSkN
Cj4gQEAgLTE0NjcsNyArMTQ3MCw4IEBAIHN0YXRpYyBpbnQgcGZfcHJvdmlzaW9uX3ZmX2xtZW0o
c3RydWN0IHhlX2d0ICpndCwNCj4gdW5zaWduZWQgaW50IHZmaWQsIHU2NCBzaXplKQ0KPiAgCXJl
dHVybiAwOw0KPiANCj4gIHJlc2V0X2xtdHQ6DQo+IC0JcGZfcmVzZXRfdmZfbG10dCh4ZSwgdmZp
ZCk7DQo+ICsJaWYgKHhlX2RldmljZV9oYXNfbG10dCh4ZSkpDQo+ICsJCXBmX3Jlc2V0X3ZmX2xt
dHQoeGUsIHZmaWQpOw0KPiAgcmVsZWFzZToNCj4gIAlwZl9yZWxlYXNlX3ZmX2NvbmZpZ19sbWVt
KGd0LCBjb25maWcpOw0KPiAgCXJldHVybiBlcnI7DQo+IEBAIC0xOTgxLDcgKzE5ODUsOCBAQCBz
dGF0aWMgdm9pZCBwZl9yZWxlYXNlX3ZmX2NvbmZpZyhzdHJ1Y3QgeGVfZ3QgKmd0LA0KPiB1bnNp
Z25lZCBpbnQgdmZpZCkNCj4gIAkJcGZfcmVsZWFzZV92Zl9jb25maWdfZ2d0dChndCwgY29uZmln
KTsNCj4gIAkJaWYgKElTX0RHRlgoeGUpKSB7DQo+ICAJCQlwZl9yZWxlYXNlX3ZmX2NvbmZpZ19s
bWVtKGd0LCBjb25maWcpOw0KPiAtCQkJcGZfdXBkYXRlX3ZmX2xtdHQoeGUsIHZmaWQpOw0KPiAr
CQkJaWYgKHhlX2RldmljZV9oYXNfbG10dCh4ZSkpDQo+ICsJCQkJcGZfdXBkYXRlX3ZmX2xtdHQo
eGUsIHZmaWQpOw0KPiAgCQl9DQo+ICAJfQ0KPiAgCXBmX3JlbGVhc2VfY29uZmlnX2N0eHMoZ3Qs
IGNvbmZpZyk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbG10dC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xtdHQuYw0KPiBpbmRleCBhNjBjZWFlNGM2ZGQuLjg5Mzkz
ZGNiNTNkOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xtdHQuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbG10dC5jDQo+IEBAIC0xNjQsNyArMTY0LDcgQEAg
aW50IHhlX2xtdHRfaW5pdChzdHJ1Y3QgeGVfbG10dCAqbG10dCkNCj4gIAlsbXR0X2Fzc2VydChs
bXR0LCBJU19TUklPVl9QRih4ZSkpOw0KPiAgCWxtdHRfYXNzZXJ0KGxtdHQsICFsbXR0LT5vcHMp
Ow0KPiANCj4gLQlpZiAoIUlTX0RHRlgoeGUpKQ0KPiArCWlmICgheGVfZGV2aWNlX2hhc19sbXR0
KHhlKSkNCj4gIAkJcmV0dXJuIDA7DQo+IA0KPiAgCWlmICh4ZV9oYXNfbXVsdGlfbGV2ZWxfbG10
dCh4ZSkpDQo+IEBAIC00ODYsNyArNDg2LDcgQEAgdTY0IHhlX2xtdHRfZXN0aW1hdGVfcHRfc2l6
ZShzdHJ1Y3QgeGVfbG10dCAqbG10dCwNCj4gdTY0IHNpemUpDQo+ICAJdTY0IHB0X3NpemU7DQo+
IA0KPiAgCWxtdHRfYXNzZXJ0KGxtdHQsIElTX1NSSU9WX1BGKGxtdHRfdG9feGUobG10dCkpKTsN
Cj4gLQlsbXR0X2Fzc2VydChsbXR0LCBJU19ER0ZYKGxtdHRfdG9feGUobG10dCkpKTsNCj4gKwls
bXR0X2Fzc2VydChsbXR0LCB4ZV9kZXZpY2VfaGFzX2xtdHQobG10dF90b194ZShsbXR0KSkpOw0K
PiAgCWxtdHRfYXNzZXJ0KGxtdHQsIGxtdHQtPm9wcyk7DQo+IA0KPiAgCXB0X3NpemUgPSBQQUdF
X0FMSUdOKGxtdHQtPm9wcy0+bG10dF9wdGVfc2l6ZShsZXZlbCkgKg0KPiAtLQ0KPiAyLjM0LjEN
Cg0K
