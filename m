Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE50C4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 09:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3E410F260;
	Thu, 16 Jul 2026 09:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJkeWwAP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2608C10F260;
 Thu, 16 Jul 2026 09:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784195236; x=1815731236;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=h8eSQkpvlNa0fBPEdoXmxfmIEPzFGqAM3KyNmF2zito=;
 b=eJkeWwAPbn8MsL+2IWLsk/Ak2s5Ter2f4fcbb64icihBizgdOtGWc5E0
 dl46GIWliz0PRA1l2gmcqiDm+UddOUNPmd8SLccVPLFl88PcFyIXh035P
 kL2A2QWvIeKPSD+1mMV7G1K0wNbZMU07Czfr8eg9+dZYUZ7ImxnVwqGWN
 hzCjLqTAtBqu+D1PN43C9fi4e2ExgaIb97Qyar2NwvL8ExsmilSvYY3JT
 7BP0lsaGQ8zdc5h11zqjmIeKlWOwvXNr1uO/UAPuB1UHXhjrHdxFEVO0C
 9oLb1vfY2F9Y4csajf3TgmIUOz9qQ75hOKSGVCmOT6nRxq3jKnjDJc4M+ A==;
X-CSE-ConnectionGUID: jr8v1YrBQ2ulJlYap4HxIQ==
X-CSE-MsgGUID: HRvhmczKTqaKYmcGpeY+PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="87393544"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="87393544"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 02:47:16 -0700
X-CSE-ConnectionGUID: lf679H8nTJ6vZKkkYBZjIA==
X-CSE-MsgGUID: fvihbOiQSdKShBlVt8HLkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="253045000"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 02:47:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 02:47:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 02:47:15 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 02:47:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w40kGy8Fw/LEoM4UUo7YcX3XOsTjFKCQjUv4CToYUJs+CIeuA6qpdJVDMN9i/CZxqXvfwCW6f6H7l4XchJdiRDXQQAeS8cM62vDalbSUV0cTyIJIa6VhUBIHnHg/5qVZn5PSzpom4adNizf4G5fT0r50DEihRpJE1xK6nVclExDHKGqsiryGTa1opVPB5GvUUVw97e5em4gEtJ8YZO4+z3FGKQg3jC9AikdpHVdVgk7JHLZTcjhaWr9R/gk5Gisip61CWECkzz6reFyjR2ykNASiF0MP1h2KMw/J5+GperQFxodhbzA9Qs+ypbViMKP+gQ/53f8d3wx74LchGh9V3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8eSQkpvlNa0fBPEdoXmxfmIEPzFGqAM3KyNmF2zito=;
 b=CyALhjMEjIUeLN7MJQD6eR68nyNJRNWWn87ZXDMFh/OvF8u2mYfEPA5EP1TOb6pnwNXJe4b13evZ9aNqjZsZr+Yi4bQ9AStKu/ozFB0yi45bSHDySxxvuLxDj6V25DODO1TQctV54gUQecImcBoA568Ddyes5Gt5Zs+/EeAO/ELWG1DSgSvayhm+bDiYLqOA9TxOtj6c+cg6JMfP166kAboykL3hdls28LF1BnriF4jGijDUH/AoYTgVuqzqP8GK/Z7zj7qSQj/+rUraSvnDzHyDyKqQz48UoFGLFdrvzJfN44UDdig8kRrHnJq3k/WqmDK6X+GrNgulWAaSdtM5YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by DSWPR11MB9715.namprd11.prod.outlook.com (2603:10b6:8:355::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Thu, 16 Jul
 2026 09:47:13 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 09:47:13 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: Re: [v3 1/2] drm/i915/xe3p/dram: Interpret 0xF populated-channel
 count as 16
Thread-Topic: [v3 1/2] drm/i915/xe3p/dram: Interpret 0xF populated-channel
 count as 16
Thread-Index: AQHdFGQq2IJL3RToNk6bO73gPpVrrrZv514A
Date: Thu, 16 Jul 2026 09:47:13 +0000
Message-ID: <53a9b3b84a7723f75ee83cbd91728a354e76e727.camel@intel.com>
References: <20260715143243.4141208-1-uma.shankar@intel.com>
 <20260715143243.4141208-2-uma.shankar@intel.com>
In-Reply-To: <20260715143243.4141208-2-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|DSWPR11MB9715:EE_
x-ms-office365-filtering-correlation-id: e9bfcb11-915c-4d89-497a-08dee31f36a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10070799003|38070700021|10067099003|11063799006|4143699003|6133799003|22082099003|56012099006|18002099003;
x-microsoft-antispam-message-info: vFZqrqDslHFpqXEzIIng+JM+bZh3JNcKFfopdN73O+2B2474whDjxC48SBeLS/TNB97OfOHzpgjZwwYLJGUfptkb7mubiX3WPJl3WBkNjz0rc+WGI68DLDS0NH5SwQE08dZmt4L5cUYwWFL4j5b7fX19sovBuSDPM8K8KzD1xNOFEL7YIjKsLBbpDxIiJIAnmKfMvLPLBhYq+e1ieELk0RcaqqMP7NLRlTssvMEU2LMzYSg04mupNJd0drCfc0Arabk3kVTHUEYfJ+1KjCXcU+IjCb8TcU2FIeWqa/N04aGLBI58ZsmC1Lu2BnOumdRaCrW8wJOXWmEa6HTsvHrEPvRI8ebLhmZtrqqvRC3EE1k7GR0sPtfHDNMRA41ifWJVBXThnPSPmSxCSl/TGnthcx7oieUqC41VtQUtaiHOddYG+4p+UaWhqBLdaRV1Po0yZZDDCip14VSDSyPPfNFth3pRHnNG6I1x+2fUDzjhRCCORWALpYl84hKvOmYCSsH+DAqYtACwJ2x3XkyqSYOY4f2x5jNbD5+TqQy4BfVN5XlE5++1/mYbeyHEqPgNpgwJL9dtRqYS9wIt45Gs+VSN6YSCDwt5AAHe0fl4sryf/TFIdMTCQINomppzUq93VAId/u5HMylec/NZnvjSNWRy13xyHcESx/7mHziE1+1zmQC9TK2esbrXeI9+JwlMi7ExDofn+llzhv4gTcTBKX/6vvLEw5jHJK8W4G7ZT0EIVpY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(38070700021)(10067099003)(11063799006)(4143699003)(6133799003)(22082099003)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bCtwWGxEWFVlaEFDUVU0MnhScmUvQlFOK1MvYzBRYVdyRlh0bm96THBBWDlF?=
 =?utf-8?B?bzBvTG1oZDVhNFBTZVlITjJueDVDRTF2UXlDZEFhelUxMWVHSy9KUW5nUlhT?=
 =?utf-8?B?S0pRbEE5YXRrUkZCWVlFUzFQbkJjTFhXcFN3aUh3c3hDdmFWck9RM2FxcHFh?=
 =?utf-8?B?aCt3UDkvT3g3TkFkRC9aR3RHSEpxL3Z5SVNpVmhNMHNzYnl1UG1hUm0wNTUr?=
 =?utf-8?B?LzRrUHltMlRjc2pPbVAvZ1pHeUtpUUxwbzZ0b0pvVTZzVVRWZCt2OU1Kc0RT?=
 =?utf-8?B?REU4VkZoOWRhRmcwbURQak5XTEVrak1JVHNna0plRHlldWg5MXdjRDBnckt3?=
 =?utf-8?B?YzZ4QjB1cVNneHkvdXZZZVMzNDJHaU1rdTJTMnVubTJWazlDbzk2WmhYZWpC?=
 =?utf-8?B?MDg1ak55N3UzUGcvMStpQytybllGaFdTZHNDM2ZMUVNPRTMyMFNEdU5KUlkx?=
 =?utf-8?B?VVdCeENxblZxd1ZTelBVa0FxelpBeDIwZkx4WGJBdmlsYmpRS2I2aVp6NUFj?=
 =?utf-8?B?bUV3dnlZbC9yQ2ludkxpanRSQTFGRkdWN1RzdDFsWFlTR0t1dE1CRlluSUdZ?=
 =?utf-8?B?UE1oUE5TM1A0QTlKTURvN1BjU3dWamo0eDFpY2lRWk91eHY2WWJVbk5UbmJO?=
 =?utf-8?B?ZzRhUGp0OUZmSFlvRm1DSEk4akxpNGdSbUh4S3h1RWs2YmFyU0hObXc4MlFF?=
 =?utf-8?B?eFRTTHRVNVJjSEZTVUJqK2w1ckRCMjdpTjNwOHVmV0ttVnBoSmVzeC9nNFJi?=
 =?utf-8?B?MHcyZFZaMDRCNCt0bU5XcGZiUzdTQ0IvRW94NGVyY0NmdDJHdjVWU2hqTHFl?=
 =?utf-8?B?YzJNb2VHSGhQVHZ1UTYzVEw5ZnhleUdHNDltZDNRT2hQazZYelhIZXM0Q1I0?=
 =?utf-8?B?L1kzY3U5TjJhdXBLQzE1WUd1ajZDM0hVN2ROVUxpNVZacFNLbjIvZi9FY01n?=
 =?utf-8?B?ZVB3dEFvbjFsVEVpbmdwem4zNEUyMHo5bEVnNlJiQmlhK0x5STBuKzdvcTVx?=
 =?utf-8?B?SGs3RWk5a0xVTVJjbWc4UUFlamlWYUVrckdaTXlNRllVSk1ZNkk1STF2dWZ0?=
 =?utf-8?B?THhiSFlKaTQ4aFpOYkozQnN3bXlpdFdJVzRvWHc1c1Y2L2p0YmdQSTI5bnZm?=
 =?utf-8?B?VE5lTlF3aHB6ZVFhdHdmMk9HZGFQdEMyaUs0NEdNYlU2ak1jcE1PdGpuQnhU?=
 =?utf-8?B?TTUvdHBIV0pqSlV4dTA2ZmxnUUQ3RDV4aHpZdkFFRXd3WXhYeUo5QlJ3WHJn?=
 =?utf-8?B?T1JmaGxnVGRkVmVYR2Q5WXVIZVlDajFUdUd3SmNQbXFLZnVoMkVVOGJKRUs0?=
 =?utf-8?B?ZktEeENzSnhzR2M4TkgzN2k3NDlGeFp5bmVLeXJvaytRd3pBTUc0TzZPQXNL?=
 =?utf-8?B?OGxPRGFkanM1bzNoK0lOS2c3Rk1VYXk0b1l0VUE4bGhhZG9NS2V6cVdJWU0x?=
 =?utf-8?B?Vm5JQk9kaktUZjN0YVRvdSs1VC95eXdjSXpMU3AzSFk2MTRZSXBqcVc3TnRy?=
 =?utf-8?B?SFdqZEtnMUU5dllnRWtFY3B2cGhubE1yVSsyUDM4cEpKd3lSL3hvaHZYanJ1?=
 =?utf-8?B?anFXZjUxcVIvZE40NXoweHljbXNyamxSRzRNSlNHUEJwNWMwTDhXSWxSMERw?=
 =?utf-8?B?Vml3MkxNRldLZjU3TWZiakUzaUtuV29ZNURDYlFPUjA0VFZqaEZPdmkyOXF0?=
 =?utf-8?B?bE91eVdFOGt4b1E1Q2p3czduT0hNcmE0a1FMTGpPQVZTcmVoMHhzN3hIYkJM?=
 =?utf-8?B?RStQQ3puSVZibTVKaXhZdXI5cDN1WFZ2WTVXaTRrUGdWelBYSHkxc082ZVhF?=
 =?utf-8?B?eCttVUFobWZISlFIZGpQUHU5UkVYWW5sZGZuNGxGZjBaNGxmbnJpYXJ3Wmd4?=
 =?utf-8?B?OXlkMkdVTllacVBoOVlYM0Yvd0ZVbmpncW5scmtaVUVubUVrSlA2OVZVL2Vm?=
 =?utf-8?B?cWoySHl6U0ZEU1VVWnQzR0NhempMTDVHYWd6R2F0YUd2VDVESTN3RE1ucGY5?=
 =?utf-8?B?TTNNY3R0VzlPVlhFcjdleWJtSWtNczAySTV2ZzVvRkN4OUxwZHpqSVhvcXdz?=
 =?utf-8?B?cnYwVUgrWllYTE9PcDZtaHVyVmF0SmQwTVR3NVhSazJkQzlHc3FyOGVWbmJ3?=
 =?utf-8?B?dU5oc016QnhsMGt1dWttazdpVFA2WVNVK0crRVpNUWxpRVM1RWxxREtvY0N3?=
 =?utf-8?B?RnUvNUYzekV2K0x5NlRYMzdrLzFpK1hBclcwOGR4NHpiYTJYdWFEcHd5cUd1?=
 =?utf-8?B?QUxENGkvd1pqUzNoQWR2U1IwcnlPdEZWaDVLeC9za2RjbkFzOURsZmtWOVJp?=
 =?utf-8?B?Z2F2SEFka3R1aXg0UE5JOCtJdmErS1hNUTNLVm5KNE9BVi9ha3docHZrRDg1?=
 =?utf-8?Q?BUiaBS3ATegHZfRrRd8rRL1Je4HI67qbXYK5+lUlk0gEd?=
x-ms-exchange-antispam-messagedata-1: pDlT8kTpiUjQ+oql9pEB4e9F2MGpYlvL9e3ybrtpsobIBt2RGt4N2jA5
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F9BD6A8A6F8F34CBD21ED0E0CF78B43@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rFIVzinFv6pHKnKcpMOya8dyeWRv9UOJhTcteYNgOHFZgtoJ7NYdVFSlZiCvZYmUUQM1EYWXyTE9T1Q6EiaUyQtwfZ4YZXj/Ucdph5cha3JYkn/6Ugd0KC8CZMTDQ6ltXyNbvjnmCFJtEZ3BblMRXNLST01L8BkRIngLLvaKlE84uje1y+r9S/MuiFpgMA30HwWK8QN0gQX7gA63oC8umfvI5BT6HWpzWFn39ArtfIEVH0Xft5UgJ8xc10rB+aAefqkM3Qwux6FwfCr/bQuzNFlBV/trV/expTTisJjFdL7xy+nDqrxPdn1a7ihG+HGeokZXhTrvAx+yEu2aqYl+WA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9bfcb11-915c-4d89-497a-08dee31f36a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 09:47:13.3336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eGUpF3Ij2WYsoeuzbEie//w4u3RdM8ugKfokp9MUjCGTcNPrX76W8Jpy3gSymwijN3ZXjUhQ6xjuC3fsqASsmUYUzLR3A122gJqLlNz36os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9715
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

T24gV2VkLCAyMDI2LTA3LTE1IGF0IDIwOjAyICswNTMwLCBVbWEgU2hhbmthciB3cm90ZToNCj4g
V2FfMTYwMzA4NjIxNTc6DQo+IEludGVycHJldCAweEYgcG9wdWxhdGVkLWNoYW5uZWwgY291bnQg
YXMgMTYNCj4gVGhlIHJlZ2lzdGVyIE1FTV9TU19JTkZPX0dMT0JBTCBbTnVtYmVyIG9mIHBvcHVs
YXRlZCBjaGFubmVsc10gZmllbGQNCj4gZGVmaW5pdGlvbiBpcyB1cGRhdGVkIHdpdGggYW4gZW5j
b2RpbmcgZm9yIDE2IGNoYW5uZWxzLg0KPiANCj4gRm9yIDE2LWNoYW5uZWwgY29uZmlndXJhdGlv
biwgcHJvZ3JhbSAxMTExYi4gQSBwcm9ncmFtbWVkIHZhbHVlIG9mDQo+IDExMTFiDQo+IG11c3Qg
YmUgaW50ZXJwcmV0ZWQgYXMgMTYgY2hhbm5lbHMgZm9yIG1lbW9yeSBiYW5kd2lkdGggY2FsY3Vs
YXRpb25zLg0KPiANCj4gVGhlIE1FTV9TU19JTkZPX0dMT0JBTCBwb3B1bGF0ZWQtY2hhbm5lbCBm
aWVsZCBpcyBvbmx5IDQgYml0cyBhbmQNCj4gY2Fubm90DQo+IGVuY29kZSAxNiwgc28gb24gWGUz
cCB0aGUgQklPUyBwcm9ncmFtcyB0aGUgc2F0dXJhdGVkIGZpZWxkIHZhbHVlDQo+ICgweGYpDQo+
IHRvIGluZGljYXRlIHRoZSBmdWxseS1wb3B1bGF0ZWQgMTYtY2hhbm5lbCBjb25maWcgKDQgbWVt
b3J5DQo+IGNvbnRyb2xsZXJzDQo+IHggNCBjaGFubmVscykuIEludGVycHJldCBpdCBhcyAxNiBh
bmQgbGV0IHRoZSBiYW5kd2lkdGggbWF0aCBoYW5kbGUNCj4gdGhlDQo+IGxhcmdlciBjaGFubmVs
IGNvdW50Lg0KPiANCj4gdjI6IExpbWl0IHRoZSBXQSBvbmx5IHRpbGwgTlZMIChTdXJhaikNCj4g
wqDCoMKgIExvZ2ljYWwgc2VwYXJhdGlvbiBvZiBXQSAoVmlub2QpDQo+IA0KPiBXQTogMTYwMzA4
NjIxNTcsIDE2MDMwODc1MjIzDQo+IEJzcGVjOiA2OTEzMSwgNzk0ODINCj4gDQo+IEFzc2lzdGVk
LWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNC04DQo+IFNpZ25lZC1vZmYtYnk6IFVtYSBTaGFua2Fy
IDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV93YS5jIHzCoCAyICsrDQo+IMKgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3dhLmggfMKgIDEgKw0KPiDCoGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHJhbS5jwqDCoMKgwqDCoMKgIHwgMTQgKysrKysrKysr
KysrKy0NCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gDQpwbHMgaGF2ZSBhIGxvb2sgYXQgdGhlIHBhdGNoIHN1YmplY3QvZGVzY3JpcHRpb24g
Zm9ybWF0IGNoYW5nZXMNCnN1Z2dlc3RlZCBieSBTdXJhaiBPdGhlcndpc2UgTEdUTQ0KDQpSZXZp
ZXdlZC1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRlbC5j
b20+DQoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheV93YS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNw
bGF5X3dhLmMNCj4gaW5kZXggYjRjNDk4MTZmN2ViLi4zNjYyZTBmMTdjNjkgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV93YS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV93YS5jDQo+IEBA
IC0xNDAsNiArMTQwLDggQEAgYm9vbCBfX2ludGVsX2Rpc3BsYXlfd2Eoc3RydWN0IGludGVsX2Rp
c3BsYXkNCj4gKmRpc3BsYXksIGVudW0gaW50ZWxfZGlzcGxheV93YSB3YSwNCj4gwqAJCQkJCQlT
VEVQX0EwLCBTVEVQX0IwKTsNCj4gwqAJY2FzZSBJTlRFTF9ESVNQTEFZX1dBXzE2MDI5MDI0MDg4
Og0KPiDCoAkJcmV0dXJuIERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDM1Ow0KPiArCWNhc2UgSU5U
RUxfRElTUExBWV9XQV8xNjAzMDg2MjE1NzoNCj4gKwkJcmV0dXJuIERJU1BMQVlfVkVSKGRpc3Bs
YXkpID09IDM1Ow0KPiDCoAljYXNlIElOVEVMX0RJU1BMQVlfV0FfMTgwMzQzNDM3NTg6DQo+IMKg
CQlyZXR1cm4gRElTUExBWV9WRVIoZGlzcGxheSkgPT0gMjAgfHwNCj4gwqAJCQkoZGlzcGxheS0+
cGxhdGZvcm0ucGFudGhlcmxha2UgJiYNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV93YS5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X3dhLmgNCj4gaW5kZXggOTJiMzk4MGJlYTg0Li4zMzhiMzJl
NDE2MmQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheV93YS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheV93YS5oDQo+IEBAIC01NCw2ICs1NCw3IEBAIGVudW0gaW50ZWxfZGlzcGxheV93YSB7
DQo+IMKgCUlOVEVMX0RJU1BMQVlfV0FfMTYwMjU1NzM1NzUsDQo+IMKgCUlOVEVMX0RJU1BMQVlf
V0FfMTYwMjU1OTY2NDcsDQo+IMKgCUlOVEVMX0RJU1BMQVlfV0FfMTYwMjkwMjQwODgsDQo+ICsJ
SU5URUxfRElTUExBWV9XQV8xNjAzMDg2MjE1NywNCj4gwqAJSU5URUxfRElTUExBWV9XQV8xODAz
NDM0Mzc1OCwNCj4gwqAJSU5URUxfRElTUExBWV9XQV8yMjAxMDE3ODI1OSwNCj4gwqAJSU5URUxf
RElTUExBWV9XQV8yMjAxMDk0NzM1OCwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZHJhbS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcmFtLmMNCj4gaW5kZXggZjEwM2Y3Y2JhMDE4Li4wNzYzZDBiZmQ5OGUgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHJhbS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHJhbS5jDQo+IEBAIC0xMyw2
ICsxMyw3IEBADQo+IMKgI2luY2x1ZGUgImludGVsX2Rpc3BsYXlfY29yZS5oIg0KPiDCoCNpbmNs
dWRlICJpbnRlbF9kaXNwbGF5X3V0aWxzLmgiDQo+IMKgI2luY2x1ZGUgImludGVsX2Rpc3BsYXlf
cmVncy5oIg0KPiArI2luY2x1ZGUgImludGVsX2Rpc3BsYXlfd2EuaCINCj4gwqAjaW5jbHVkZSAi
aW50ZWxfZHJhbS5oIg0KPiDCoCNpbmNsdWRlICJpbnRlbF9tY2hiYXIuaCINCj4gwqAjaW5jbHVk
ZSAiaW50ZWxfcGFyZW50LmgiDQo+IEBAIC03OTQsNyArNzk1LDE4IEBAIHN0YXRpYyBpbnQgeGVs
cGRwX2dldF9kcmFtX2luZm8oc3RydWN0DQo+IGludGVsX2Rpc3BsYXkgKmRpc3BsYXksIHN0cnVj
dCBkcmFtX2luZm8NCj4gwqANCj4gwqAJZHJhbV9pbmZvLT5udW1fY2hhbm5lbHMgPQ0KPiBSRUdf
RklFTERfR0VUKE1UTF9OX09GX1BPUFVMQVRFRF9DSF9NQVNLLCB2YWwpOw0KPiDCoAlkcmFtX2lu
Zm8tPm51bV9xZ3ZfcG9pbnRzID0NCj4gUkVHX0ZJRUxEX0dFVChNVExfTl9PRl9FTkFCTEVEX1FH
Vl9QT0lOVFNfTUFTSywgdmFsKTsNCj4gLQkvKiBQU0YgR1YgcG9pbnRzIG5vdCBzdXBwb3J0ZWQg
aW4gRDE0KyAqLw0KPiArDQo+ICsJLyoNCj4gKwkgKiBXYV8xNjAzMDg2MjE1Nw0KPiArCSAqIE1F
TV9TU19JTkZPX0dMT0JBTCBwb3B1bGF0ZWQtY2hhbm5lbCBmaWVsZCBpcyBvbmx5IDQgYml0cw0K
PiBhbmQNCj4gKwkgKiBjYW5ub3QgZW5jb2RlIDE2LCBzbyBvbiBYZTNwIHRoZSBCSU9TIHByb2dy
YW1zIHRoZQ0KPiBzYXR1cmF0ZWQgZmllbGQNCj4gKwkgKiB2YWx1ZSAoMHhmKSB0byBpbmRpY2F0
ZSB0aGUgZnVsbHktcG9wdWxhdGVkIDE2LWNoYW5uZWwNCj4gY29uZmlnICg0DQo+ICsJICogbWVt
b3J5IGNvbnRyb2xsZXJzIHggNCBjaGFubmVscykuIEludGVycHJldCBpdCBhcyAxNi4NCj4gKwkg
Ki8NCj4gKw0KPiArCWlmIChpbnRlbF9kaXNwbGF5X3dhKGRpc3BsYXksIElOVEVMX0RJU1BMQVlf
V0FfMTYwMzA4NjIxNTcpDQo+ICYmDQo+ICsJwqDCoMKgIGRyYW1faW5mby0+bnVtX2NoYW5uZWxz
ID09DQo+IFJFR19GSUVMRF9NQVgoTVRMX05fT0ZfUE9QVUxBVEVEX0NIX01BU0spKQ0KPiArCQlk
cmFtX2luZm8tPm51bV9jaGFubmVscyA9IDE2Ow0KPiDCoA0KPiDCoAlpZiAoRElTUExBWV9WRVIo
ZGlzcGxheSkgPj0gMzUpDQo+IMKgCQlkcmFtX2luZm8tPmVjY19pbXBhY3RpbmdfZGVfYncgPQ0K
PiBSRUdfRklFTERfR0VUKFhFM1BfRUNDX0lNUEFDVElOR19ERSwgdmFsKTsNCg0K
