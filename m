Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81032CD3427
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 17:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449D410E7D2;
	Mon,  4 May 2026 17:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dle2m2Nc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3A710E7D2
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 17:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777916777; x=1809452777;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CoCSBE69oYZC5Wjeb2l9iydnYjvfSShaI2RILEy1zow=;
 b=Dle2m2Nco3SqlwhRGYUgA+3wyxQdci4HQuLwHHubU73WsoRZ/+XYqErT
 mp20XuyGJ5FfvQ/m91yTm/ls3NNhciAkp0euSY9oUAxuWudVxHFLqsJRb
 a8CA2aMZm2YW80X+DV6o/QFIvmItLd2NNaikxnx8dnrucsOyuiPVNPJUM
 EOKxQg3yX+2tM2VkDV579x+YDuvbN8xvFANua3NjVTPw911dSh6fZP9Qn
 g0nAziFejcZ7dv21BYyLFqr+ylpgolqri9YtjdVlem0ZroGfzsQbb3q3J
 S4BlJhdHqi6Kvts0hsOVBtA2NbGz3jdwSnCc/g7HrM7SR1FryEgr5hhJM A==;
X-CSE-ConnectionGUID: WSxmoDCFRrK/p2mMJ5kwhg==
X-CSE-MsgGUID: upbHNhFnT9uxgG+elfE8Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="66310990"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="66310990"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 10:44:21 -0700
X-CSE-ConnectionGUID: rWwdBr/jRgWGlxSaNPD2Bg==
X-CSE-MsgGUID: x7k0RRA2RrGCeb/pGiV7kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="235449101"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 10:44:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 10:44:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 10:44:20 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 10:44:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6Sfm6A+9VOOaJn3NdiBuYdkNak3kzMeD6dl0zySJP4IvJvk6ndC1A5XJRM8bGpOqVwJvG7rAudg6PTZ/SWewkWkQiCpZjwL9Gtl7t7gzrFaJnCjf7Dg4Qv4y6vmHggix5ePTDzAuL5+VbZLHNTFGMCykgovNodzbvFqPbcT0+IcsIce1jJwaqOxbY4XTF+PiT+vVMpxTzYrcCLYhW7qREd4Kj0ddo79ZPLhxr7WGRoHbuR6lST7MccJZkSwVJTCppDaOjDuluqRZstMU1lG/9aom6JbwADhXkx3LXs9OdgkDMy177dbiA438IAH+2FZUPq0HfrUG1mRYxON+P44Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoCSBE69oYZC5Wjeb2l9iydnYjvfSShaI2RILEy1zow=;
 b=AuqfPOwG89W4Li2TO6Bf60qmMOK4JDxZlMhGGYH2AF31OiodyVEhS7lbSlUMZwlHTFa3Ju1s7ZZEMKJAJuvk64SQ8QN/+qTdvmo0CYJPaj4bc5xtxoPDHeguY/SRWltDTdJ2O50eVxwGsYujSCdeDxW7xYFz04mmVTImPCPbAY/v2JsoCdKAZX9dFSisQvOBenI3UIFxBo4WWmbVKAmb1eWGH1ykyQZv3ZkcxgXOA9KMetEoi3aM//SCIF8OEypNCrgJ4AG0S6R5jGsOmRMikPfZkdTNnfM3XKF8jnvse+6RaLVIr/SZXzfOkb0JiIsb70WpAOw+ONOCwz0qEAsEKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB7110.namprd11.prod.outlook.com (2603:10b6:806:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 17:44:15 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 17:44:15 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 4/9] drm/xe: Add a new debug focused configfs group
Thread-Topic: [PATCH 4/9] drm/xe: Add a new debug focused configfs group
Thread-Index: AQHc24CiQo5s8b+4uE6kK9lOFblYaLX+Ai2AgAACSwCAABuCgIAABEAA
Date: Mon, 4 May 2026 17:44:15 +0000
Message-ID: <dede21f05cac6e683c4f001a8cc31b883ba2810c.camel@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
 <20260504044348.209625-5-stuart.summers@intel.com>
 <875x53dvvo.fsf@intel.com>
 <0579da16c8a003849b608d29ea37b3f86a9ddc17.camel@intel.com>
 <873407dqxw.fsf@intel.com>
In-Reply-To: <873407dqxw.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB7110:EE_
x-ms-office365-filtering-correlation-id: 7afd8097-3412-44ca-812e-08deaa04c272
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: RBX9PmLiprXU6HaB8EWiZB0MrYdMAs9YLOpwGGghgrhbxym7LCPEC/0ult92X80tvBNTZP/hmaIDHoCcgjNi+s6Icq7Y31fzFTICtVvsKQykaeBED/jp1F//WKZGfX5rk16wDX7p94+rIYlYKHsJeHY9tO3ryQZzw9D/yg6GxN1BaoHrtzMcIrXj+oE4vvruksAObSLDa4Rj6W4TlzEhNTcnZVZDMP5lkdEKYW+RT4sM+Axr2uGY2raYJHimDt7jqzxAK823yfSGehXV6MdQsghVx+qNR84rlNbiyR1kFEcPjXP950Z1gBK0VkjkqVm3x5Kl4FHtjs2ALQ+3Moj5/IYz1FkRTWFyYbDZdrkp3OH0Oa0AUuQZPZNfz2CFtmFCdrEoCkQBwUtvTzEURWkS6+XIowq5/EDw+ZraeYtQui9sri8fJfbvU0Wri4k3SIn0WsGuQcn1/yInT+kQEMzOxVrThTaRANgJfbl/7IsyyJ48wo8LWHsxcp0707bHxs4f6nAs1wLkWav3SeaTtlM6h5Aqc0UB9fqgTxy4BasSU2nCpq0/2tDgEm8rddFu+HYZwjmbI2bMqkAH9uUucJ2YfulH6TGVvb4KO0vQ5B2hmDY3AlmUJFMboHyHbmu3Z4Lyqz6iqYPrS0O42q8nyotAvtWTK/+eISV5wGcFaANEf9wlZUEwWMyYzae+rtZukddXCBZn1dMjdXRQGp57ceRfOu9z1W2WVunprrQlrFSW6stCC83oGjLPABCrfQ7af64P
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TU1nUERBTmcwOUd4SFUycEkyaC94aC9XcVp2RGJVRWxybXJ5WGZvZjAzVXQy?=
 =?utf-8?B?UVRWdmR3ZWNuaU5WcEZqUFRVNHIxUkZzN0crdllTeHppVSs2ZEJ3ZHhyMmh4?=
 =?utf-8?B?NUwyLy93R3pjZmp1VjMvZmhyYXhBZU5KbHlUaWVRR0VHSy9IZUJJQ2YxcENS?=
 =?utf-8?B?MnpwbFlMNjhQaFlxMHlwRXJpQnlSWXBTeXdPUTRBbS84NEhaWWRtdkRsVmJa?=
 =?utf-8?B?M3p3RkZuZW8rOUlDUFErOGFIM2VZOVJnWll3Ry9NZ09VSTJFN3NEVFR0eGRV?=
 =?utf-8?B?ZW1lbzdYWVlFQ0wwdUhEdWZuVGVzQVdhTjlpN0dMbXV4T3VIVWNFMW90eGVa?=
 =?utf-8?B?T0hFMW9tL3RNcStMUUdzT2xyT3ZGYWFGc3M2VWRQRC96UUFNWE1adElJNGNB?=
 =?utf-8?B?a3hJd25xTDJ6Tm9oMk03Und6REczN2RJSFJRa21MTjF5N1RrK2JiWUVIQk1L?=
 =?utf-8?B?YldXMjlFYWI5dFJQb2lyb2l1cXB5NWZ4RTB3bEs1eWV5OS83NDZOdWx2a2kr?=
 =?utf-8?B?eE5yVHhUU0V2ektPRkZSUXRsU1ErRVJ6NzNMT3g0K1FHY285WU55djNSQnJm?=
 =?utf-8?B?dTErdXhoWnNsR3FBQzVuMnkyaTJhL2FZT0kwVHBkQnhyY0Z2YzB0SHUrMkFK?=
 =?utf-8?B?anZCZzdsRSs1T2duWllIbkVIUjB3WFdiekRFMjNZZHZjN3FTbnFOOUxibW15?=
 =?utf-8?B?NzZrNEowNTYxTHdjL1Qvc0d1Uk5vdEsvbWVpOWtZbFZMQ00zYXpGYzhCQzhi?=
 =?utf-8?B?cUtOMDA4M284a0pMQnFWNHdTU3lyRjlZVi80Mzc2ZGorTU5KU2tqU3Z6clFo?=
 =?utf-8?B?VDJBb2wva1N6Mmd4SU0rREsxZWZjZFAxekZrd0NCQ1NzYVp3M1pSUlJpTmIz?=
 =?utf-8?B?ZS92WGd6eE9ZanRmQkVFS2NWS25DYWpJdVoveklrcjJvbzNpMWQxK01LVzZo?=
 =?utf-8?B?SVBCMm84RWQ5Nityc1piaC9TelFBV2RHazNoeHNpM2hiaGFwK1JPQkp4cEsr?=
 =?utf-8?B?dVJDNUtoTnRGZDBLQUtrY3JmcmhSLzcyS1pmNUpYMTdSaU1XZGtVSmg3K3Ra?=
 =?utf-8?B?UTQ0bGN5SmhIM0ZOdGdXRlREUWIrSFlmV3VVMmFuYnNScm95NFZWbkphNmVz?=
 =?utf-8?B?cDMvdjJMeVIrcnh3TVRwZTkxcHFjOVdKblNlQlJzV1J4ZFBHMzY5Ui8rZHRB?=
 =?utf-8?B?aDlscHNtbUhobU9zbEg0Si9rTUtBU0tzVG1PT2t4a0NyTHhUQ2xLOHFROVJM?=
 =?utf-8?B?TkxLNVIrRXJCYkplLzZpdU9yTHZ6SVBaZ1NPV0hoYVJpZjQ1dVlZM1N2UkM5?=
 =?utf-8?B?ZC9ER0JpdG9MbzF0Y2R2NVVKTjNYVGU0NzljcnVBK2oyK2lzZjJKdXpjRHpy?=
 =?utf-8?B?dWJJWmlMYm1QdG9TdXRjb1dxZkF2WW5VNmF3QjNPMVVZL2RRSmVKQnZNMXpy?=
 =?utf-8?B?N1ZDQXFGajVOQmxURlk2OFlzdDNQQ3NSYldnS2dlcGVrbGcxZlhvT2N4MUQ0?=
 =?utf-8?B?V21Sd0dHYVI2T2dwZVFXZ00xaHY4d2tmd2NEcHdPa29rZjRTRXNpUElSNTM5?=
 =?utf-8?B?blRkNk03VjNseG1UMDc1blYrYlVzRWE5aVpIeDRJS2tiWEZRYkxCZmIvYUpO?=
 =?utf-8?B?dDZQQisxN2lLV0N3dm1uK2dLaGRqUVVOSU9ENTBkS1FQV04wQnBwbzRzdEQ1?=
 =?utf-8?B?ZEkxTE5YcllDN1ZGbDZaMWtwWDBiSEdXZlpacjRkdmdlVlR5RG5aY2Y3ekpa?=
 =?utf-8?B?cXUwUWlvTk9PQStOWGF3QkhEdnJaeGthelZhdTQ0MU1pYVNFZUVuQmNsQzg3?=
 =?utf-8?B?VUYydzJpOENabEdBM2NKT3pmOWlaR3AwNm1aUHVMUkh3QWV2eW9rNE43SUl6?=
 =?utf-8?B?K3FpYkhTMkdrS2dtV1liTytFQUUrRGJEaEhSNXA4RFdoRVBJSFA3dTI3TDRX?=
 =?utf-8?B?ZUN4TXdNNzZzR2MxNG5MV3BOQnIrSVVPNFViQVY0OW5aZHlsSmQ1amtPNlZZ?=
 =?utf-8?B?NXFwb01ybjkrUWFvVFJoYUJFZ2cyT2Y1UllLcUd4TGJvTGFIcyt1RitpQWFo?=
 =?utf-8?B?V2J1bm1LNWplaFc0L2JMVGtoWENRdzZHMWU4eUVieGxBMExEQmF2WHBOd1Yw?=
 =?utf-8?B?MTc0Rys4UmxWeEdjZDA0RXAvdHI4WGRVVjMzekcvTTBvQnBrb0U0TGZlOFkr?=
 =?utf-8?B?alRzNG9qN01adEJ1eTZLWjVlM29PQTNsWG1LOTZSN0tWQ0FKNmpHV3pCcDBY?=
 =?utf-8?B?MlU5bG1pS3JuVjhiaFBWTU9jSXRlaEE3UHFjNVhJbDcxV2tOK3JYWXlVb1N0?=
 =?utf-8?B?VGovVzlMTHRKS3YxbzBNemdjcHdGUnVVQVp1NFp0UWU1d1dwVkVtV1FyUUxm?=
 =?utf-8?Q?27pAyPzHyFWiwlJo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <347E940B4F7E26408C3C924D8B169A22@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vGOXARZOBgqiexSveQqNNQVBI4h9Kv69yDe5coWkqi2TUoPL9FIaKuQrr8UhdzzzA8NWyGgSiGBhv0QzTLujyrDdDW0WdvBShIAKu7DKW7uLc5kEIOO8Wd7NonMBQM3+wt9oY2IT9mSO0iuI59Q9S8AEc5nf0YWzembtP0k7BzN4hxhN8Y8v50iLiT14RV7VFrhqIRmS/lcK3LjeddetifGMYc5LOqq/SbB/GRHC/EIy9iVmPq/WbCK2kUDIAZ8SMm6gKwEy+iceuw0LQdtgytb2FvjFwChl7I1BEQFAZlCdVDEoYKuAqCtBUgxSVx9BWXZrW0Ge0mdXG++pw5RY0A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afd8097-3412-44ca-812e-08deaa04c272
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2026 17:44:15.1787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WSfANqIWAMlDRkago7hVlyewoBgxPud7sq6FjeHxlaEe8msArOJKaymOkKTn348yyaMvFdWNXuc8Po3CARe1DpmzgKKuk2vXht3FhCDePM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7110
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

T24gTW9uLCAyMDI2LTA1LTA0IGF0IDE0OjI4IC0wMzAwLCBHdXN0YXZvIFNvdXNhIHdyb3RlOg0K
PiAiU3VtbWVycywgU3R1YXJ0IiA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPiB3cml0ZXM6DQo+
IA0KPiA+IE9uIE1vbiwgMjAyNi0wNS0wNCBhdCAxMjo0MiAtMDMwMCwgR3VzdGF2byBTb3VzYSB3
cm90ZToNCj4gPiA+IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+IHdy
aXRlczoNCj4gPiA+IA0KPiA+ID4gPiBBZGQgdGhlIHNrZWxldG9uIGNvZGUgZm9yIGEgbmV3IGRl
YnVnIHNwZWNpZmljIGNvbmZpZ2ZzIGdyb3VwLg0KPiA+ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiA+ID4g
QXNzaXN0ZWQtYnk6IENvcGlsb3Q6Y2xhdWRlLW9wdXMtNC43DQo+ID4gPiA+IC0tLQ0KPiA+ID4g
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDIgKysNCj4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuY8KgwqDCoMKg
wqDCoCB8wqAgNCArKysrDQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2Zz
X2RlYnVnLmMgfCAxNCArKysrKysrKysrKysrKw0KPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9jb25maWdmc19kZWJ1Zy5oIHzCoCA4ICsrKysrKysrDQo+ID4gPiA+IMKgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX3R5cGVzLmggfMKgIDcgKysrKysrKw0KPiA+ID4gPiDCoDUg
ZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiDCoGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVidWcuYw0KPiA+ID4gPiDCoGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVidWcuaA0K
PiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmls
ZQ0KPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+ID4gPiBpbmRleCAw
OTY2MWYwNzlkMDMuLmI1ODY2N2IwYjE4ZSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL01ha2VmaWxlDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtl
ZmlsZQ0KPiA+ID4gPiBAQCAtMTYxLDYgKzE2MSw4IEBAIHhlLSQoQ09ORklHX0hXTU9OKSArPSB4
ZV9od21vbi5vDQo+ID4gPiA+IMKgDQo+ID4gPiA+IMKgeGUtJChDT05GSUdfUEVSRl9FVkVOVFMp
ICs9IHhlX3BtdS5vDQo+ID4gPiA+IMKgeGUtJChDT05GSUdfQ09ORklHRlNfRlMpICs9IHhlX2Nv
bmZpZ2ZzLm8NCj4gPiA+ID4gK3hlX2RlYnVnX2NvbmZpZ2ZzX29iai0kKENPTkZJR19EUk1fWEVf
REVCVUcpIDo9DQo+ID4gPiA+IHhlX2NvbmZpZ2ZzX2RlYnVnLm8NCj4gPiA+ID4gK3hlLSQoQ09O
RklHX0NPTkZJR0ZTX0ZTKSArPSAkKHhlX2RlYnVnX2NvbmZpZ2ZzX29iai15KQ0KPiA+ID4gDQo+
ID4gPiBXaGF0IGFyZSB0aGUgZG93bnNpZGVzIG9mIGtlZXBpbmcgdGhpcyBhdmFpbGFibGUgZm9y
IG5vbi1kZWJ1Zw0KPiA+ID4gYnVpbGRzPw0KPiA+ID4gDQo+ID4gPiBJIGltYWdpbmUgdGhhdCB0
aGUgZGVidWcgY29uZmlnZnMgY291bGQgYmUgdXNlZnVsIGZvciBzb21lb25lIG5vdA0KPiA+ID4g
aW52b2x2ZWQgaW4ga2VybmVsIGRldmVsb3BtZW50IHdvcmtpbmcgdG9nZXRoZXIgd2l0aCB0aGUN
Cj4gPiA+IGRldmVsb3BlcnMNCj4gPiA+IHRvDQo+ID4gPiBkZWJ1ZyBpc3N1ZXMgd2l0aG91dCBu
ZWVkaW5nIHRvIHJlYnVpbGQgdGhlaXIga2VybmVsLg0KPiA+IA0KPiA+IFNvIHRoZSBmb2NhbCBw
YXJhbWV0ZXIgd2UgaGFkIGluIGk5MTUgd2FzIGVuYWJsZV9yYzYuIFNvbWV0aGluZw0KPiA+IGxp
a2UNCj4gPiB0aGlzIGlzIHdoYXQgd2UgZXhwbGljaXRseSBkb24ndCB3YW50IHRvIGV4cG9zZSB0
byBhIGdlbmVyYWwgdXNlcg0KPiA+IGFzIGl0DQo+ID4gY2FuIGhhdmUgdW5mb3Jlc2VlbiBjb25z
ZXF1ZW5jZXMgKGxpa2UgaGF2aW5nIHZlcnkgaGlnaCBwb3dlcg0KPiA+IHVzYWdlKS4NCj4gPiBC
dXQsIGhhdmluZyB0aGUgYWJpbGl0eSB0byBkaXNhYmxlIHJjNiBmb3IgZGVidWcgcHVycG9zZXMg
YXMgYQ0KPiA+IGRldmVsb3BlciBpcyBleHRyZW1lbHkgdXNlZnVsIGF0IG5hcnJvd2luZyBkb3du
IGNlcnRhaW4gdHlwZXMgb2YNCj4gPiBidWdzDQo+ID4gYXQgdGhlIGhhcmR3YXJlL3NvZnR3YXJl
IGludGVyZmFjZS4NCj4gDQo+IFdlIGNvdWxkIHByb2JhYmx5IGtlZXAgdGhlIGRlYnVnIHN0dWZm
IGF2YWlsYWJsZSBidXQgY2F1c2UgYSB0YWludCBpZg0KPiB0aGV5IGV2ZXIgZ2V0IHVzZWQ/DQoN
ClNvIHRoZSB0YWludGluZyBpcyByZWFsbHkganVzdCBmb3Igb3VyIENJIEkgdGhpbmsuIFRoaXMg
d29uJ3QNCm5lY2Vzc2FyaWx5IGltcGFjdCBlbmQgdXNlcnMgLSBhdCBsZWFzdCBvbiB0aGUgY2xp
ZW50IHNpZGUgLSB3aG8gbWlnaHQNCmp1c3QgaWdub3JlIGl0IChvciBub3QgZXZlbiBub3RpY2Ug
aXQpLiANCg0KPiANCj4gVGhlIHNjZW5hcmlvIEkgaGFkIGluIG1pbmQgaXMgc29tZW9uZSB3aG8g
aXMgbm90IGZhbWlsaWFyIHdpdGgNCj4gYnVpbGRpbmcNCj4gdGhlaXIgb3duIGtlcm5lbCB3b3Jr
aW5nIHRvZ2V0aGVyIHdpdGggdGhlIGRldmVsb3BtZW50IGNvbW11bml0eSBvbiBhDQo+IGhhcmQt
dG8tcmVwcm9kdWNlIGlzc3VlIGFuZCBzb21lIG9mIHRoZSBkZWJ1ZyBjb25maWdmcyBhdHRyaWJ1
dGVzDQo+IGJlaW5nDQo+IHVzZWZ1bCB0byBnYXRoZXIgbW9yZSByZWxldmFudCBkYXRhLg0KDQpZ
ZWFoIGJ1dCBJTU8gd2UgcmVhbGx5IHNob3VsZCBiZSBhYmxlIHRvIGluc3RydWN0IHN1Y2ggYSB1
c2VyIGhvdyB0byBkbw0KdGhhdCAtIHRoZSBzdGVwcyB0aGVyZSBhcmVuJ3QgdG9vIGRpZmZpY3Vs
dCBpZiB0aGV5J3JlIGFscmVhZHkNCmluc3RhbGxpbmcga2VybmVscyBldGMuDQoNCkEgbG90IG9m
IG91ciBkZWJ1ZyBob29rcyBhcmUgYWxyZWFkeSBoZWxkIHVuZGVyIHZhcmlvdXMgS2NvbmZpZyBv
cHRpb25zDQphbnl3YXkgbGlrZSBEUk1fWEVfREVCVUcsIERSTV9YRV9ERUJVR19HVUMsIERSTV9Y
RV9ERUJVR19WTSwgZXRjLiBBbmQgYQ0KbG90IG9mIHRoZSBpbmZvcm1hdGlvbiB1bmRlciB0aG9z
ZSBLY29uZmlncyBhcmUgYWxzbyBjcml0aWNhbCBmb3INCmRpZmZlcmVudCBkZWJ1Z3MuDQoNCkkn
ZCByZWFsbHkgcHJlZmVyIHRvIGtlZXAgdGhlc2UgdW5kZXIgRFJNX1hFX0RFQlVHIChvciBzb21l
IG90aGVyDQpLY29uZmlnKSBpZiBwb3NzaWJsZSBzbyB3ZSBjYW4gbWF4aW1pemUgdGhlIGVhc2Ug
b2YgYWRkaW5nIG5ldw0KcGFyYW1ldGVycyBhcyBzcGVjaWZpYyBkZWJ1Z3MgY29tZSB1cC4NCg0K
VGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IC0tDQo+IEd1c3Rhdm8gU291c2ENCj4gDQo+ID4gDQo+
ID4gVGhhdCdzIGp1c3Qgb25lIGV4YW1wbGUsIGJ1dCB0aGVyZSBhcmUgYSBidW5jaCBvZiB0aGlu
Z3MgdGhhdCBjb3VsZA0KPiA+IGZpdA0KPiA+IHRoaXMgY2F0ZWdvcnkgYW5kIEkgZXhwZWN0IHdl
J2xsIGhhdmUgZXZlbiBtb3JlIHVzZSBjYXNlcyBvdmVyDQo+ID4gdGltZS7CoA0KPiA+IA0KPiA+
IFJpZ2h0IG5vdyB3ZSBoYXZlIHRvIGhvbGQgdGhlc2UgdHlwZXMgb2YgY2hhbmdlcyBpbiBhIHNp
ZGUgYnJhbmNoDQo+ID4gbm90DQo+ID4gZXhwb3NlZCBleHRlcm5hbGx5IGFuZCBJIHJlYWxseSB3
YW50IHRvIGNvbnZlcmdlIG91ciBwcm9jZXNzZXMgc28NCj4gPiB3ZQ0KPiA+IGNhbiBtb3JlIGVh
c2lseSBtYWtlIHRoZXNlIGtpbmRzIG9mIGNoYW5nZXMgYW5kIGxldCB1cyBkZWJ1Zw0KPiA+IGRp
cmVjdGx5DQo+ID4gb3V0IG9mIGRybS10aXAuDQo+ID4gDQo+ID4gPiANCj4gPiA+ID4gwqANCj4g
PiA+ID4gwqAjIGdyYXBoaWNzIHZpcnR1YWxpemF0aW9uIChTUi1JT1YpIHN1cHBvcnQNCj4gPiA+
ID4gwqB4ZS15ICs9IFwNCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9jb25maWdmcy5jDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmMN
Cj4gPiA+ID4gaW5kZXggMTJiN2ZlNjU0NDZkLi44NWRmOGNlNWNmMmEgMTAwNjQ0DQo+ID4gPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jDQo+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jDQo+ID4gPiA+IEBAIC0xMDA2LDYgKzEwMDYs
MTAgQEAgc3RhdGljIHN0cnVjdCBjb25maWdfZ3JvdXANCj4gPiA+ID4gKnhlX2NvbmZpZ19tYWtl
X2RldmljZV9ncm91cChzdHJ1Y3QgY29uZmlnX2dyb3VwICpncm8NCj4gPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb25maWdfZ3JvdXBfaW5pdF90eXBlX25hbWUoJmRldi0+
c3Jpb3YsDQo+ID4gPiA+ICJzcmlvdiIsDQo+ID4gPiA+ICZ4ZV9jb25maWdfc3Jpb3ZfdHlwZSk7
DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29uZmlnZnNfYWRkX2Rl
ZmF1bHRfZ3JvdXAoJmRldi0+c3Jpb3YsICZkZXYtDQo+ID4gPiA+ID4gZ3JvdXApOw0KPiA+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+ID4gPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9Y
RV9ERUJVRykNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgY29uZmlnX2dyb3VwX2luaXRfdHlwZV9u
YW1lKCZkZXYtPmRlYnVnLCAiZGVidWciLA0KPiA+ID4gPiAmeGVfY29uZmlnZnNfZGVidWdfdHlw
ZSk7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGNvbmZpZ2ZzX2FkZF9kZWZhdWx0X2dyb3VwKCZk
ZXYtPmRlYnVnLCAmZGV2LT5ncm91cCk7DQo+ID4gPiA+ICsjZW5kaWYNCj4gPiA+IA0KPiA+ID4g
SSBndWVzcyB0aGVyZSBpc24ndCBtdWNoIHdlIGNhbiBkbyBhYm91dCBpdCB0b2RheSwgYnV0LCBi
YXNlZCBvbg0KPiA+ID4gd2hhdA0KPiA+ID4gSQ0KPiA+ID4gcmVhZCBpbiBjb25maWdmcyBkb2N1
bWVudGF0aW9uIGEgd2hpbGUgYWdvLCBJIHN1c3BlY3QgaXQgd2Fzbid0DQo+ID4gPiByZWFsbHkN
Cj4gPiA+IGRlc2lnbmVkIHdpdGggYXJiaXRyYXJ5IGhpZXJhcmNoaWVzIG9mIGNvbmZpZyBpdGVt
cyBpbiBtaW5kLsKgIEl0DQo+ID4gPiB3b3VsZA0KPiA+ID4gYmUgbmljZSBpZiB0aGVyZSB3YXMg
YW4gQVBJIGZvciB0aGF0IHRob3VnaC4NCj4gPiA+IA0KPiA+ID4gQmFzaWNhbGx5LCBhIGNvbmZp
ZyBncm91cCBpcyBleHBlY3RlZCB0byBiZSBhIGRpcmVjdG9yeSB0bw0KPiA+ID4gY29udGFpbiBh
DQo+ID4gPiBzZXQNCj4gPiA+IG9mIGNvbmZpZyBpdGVtcyBvZiB0aGUgc2FtZSB0eXBlLCB3aGlj
aCBpcyBub3QgdGhlIGNhc2Ugb24gb3VyDQo+ID4gPiBjdXJyZW50DQo+ID4gPiB1c2FnZSAoaS5l
LiB0aGUgInNyaW92IiBhbmQgbm93IHRoZSAiZGVidWciIGdyb3VwKS4NCj4gPiA+IA0KPiA+ID4g
SSBndWVzcyB3ZSBhcmUgYWJsZSB0byBnZXQgb3VyIGRlc2lyZWQgYmVoYXZpb3IgKGJhc2ljYWxs
eSBqdXN0IGENCj4gPiA+IHN1YmRpcmVjdG9yeSBiZWhhdmluZyBhcyBhIGNvbmZpZyBpdGVtKSBi
eSBub3QgaW1wbGVtZW50aW5nIHRoZQ0KPiA+ID4gIm1ha2VfaXRlbSIgaG9vay7CoCBOb3Qgc3Vy
ZSBpZiB0aGF0J3MgYW4gZXhwZWN0ZWQgdXNlIG9mIHRoZSBBUEkNCj4gPiA+IG9yDQo+ID4gPiBp
Zg0KPiA+ID4gdGhhdCdzIG1vcmUgb2YgYSBoYWNrIG9uIG91ciBzaWRlIGFuZCBjb3VsZCBjb21l
IGJhY2sgdG8gYml0ZSB1cw0KPiA+ID4gaW4NCj4gPiA+IHRoZQ0KPiA+ID4gZnV0dXJlLg0KPiA+
IA0KPiA+IEhtLi4gb2sgdGhhdCdzIGdvb2QgZmVlZGJhY2suIEkgZG8gbGlrZSBidWNrZXRpbmcg
dGhlc2UgaW4gZ3JvdXBzDQo+ID4gYW5kDQo+ID4gc3ViZGlyZWN0b3JpZXMuIEl0IGFsc28gbWFr
ZXMgaXQgZWFzeSB0byBzaG93IG9yIG5vdCBzaG93IGJhc2VkIG9uDQo+ID4gdGhlDQo+ID4gS2Nv
bmZpZy4gQnV0IGxldCBtZSBnbyB0aHJvdWdoIGFuZCBtYWtlIHN1cmUgdGhlcmUgaXNuJ3Qgc29t
ZXRoaW5nDQo+ID4gbW9yZQ0KPiA+IHN1aXRlZCBoZXJlLiBIYXBweSB0byBoZWFyIGFueSBvdGhl
ciBmZWVkYmFjayBhcyB3ZWxsIGhlcmUuDQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IFN0dWFydA0K
PiA+IA0KPiA+ID4gDQo+ID4gPiAtLQ0KPiA+ID4gR3VzdGF2byBTb3VzYQ0KPiA+ID4gDQo+ID4g
PiA+IMKgDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBtdXRleF9pbml0KCZkZXYtPmxvY2spOw0K
PiA+ID4gPiDCoA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Nv
bmZpZ2ZzX2RlYnVnLmMNCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNf
ZGVidWcuYw0KPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLjQ1NjE3MjgyY2VjNQ0KPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5jDQo+ID4gPiA+IEBAIC0w
LDAgKzEsMTQgQEANCj4gPiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4g
PiA+ID4gKy8qDQo+ID4gPiA+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNiBJbnRlbCBDb3Jwb3JhdGlv
bg0KPiA+ID4gPiArICovDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9jb25m
aWdmcy5oPg0KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ID4gPiArDQo+
ID4gPiA+ICsjaW5jbHVkZSAieGVfY29uZmlnZnNfZGVidWcuaCINCj4gPiA+ID4gKyNpbmNsdWRl
ICJ4ZV9jb25maWdmc190eXBlcy5oIg0KPiA+ID4gPiArDQo+ID4gPiA+ICtjb25zdCBzdHJ1Y3Qg
Y29uZmlnX2l0ZW1fdHlwZSB4ZV9jb25maWdmc19kZWJ1Z190eXBlID0gew0KPiA+ID4gPiArwqDC
oMKgwqDCoMKgwqAuY3Rfb3duZXLCoMKgwqDCoMKgwqDCoD0gVEhJU19NT0RVTEUsDQo+ID4gPiA+
ICt9Ow0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2Zz
X2RlYnVnLmgNCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVidWcu
aA0KPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjAxMTcwZGMyZjk3ZQ0KPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5oDQo+ID4gPiA+IEBAIC0wLDAgKzEs
OCBAQA0KPiA+ID4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLw0KPiA+ID4g
PiArLyoNCj4gPiA+ID4gKyAqIENvcHlyaWdodCDCqSAyMDI2IEludGVsIENvcnBvcmF0aW9uDQo+
ID4gPiA+ICsgKi8NCj4gPiA+ID4gKyNpZm5kZWYgX1hFX0NPTkZJR0ZTX0RFQlVHX0hfDQo+ID4g
PiA+ICsjZGVmaW5lIF9YRV9DT05GSUdGU19ERUJVR19IXw0KPiA+ID4gPiArDQo+ID4gPiA+ICsj
ZW5kaWYgLyogX1hFX0NPTkZJR0ZTX0RFQlVHX0hfICovDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfdHlwZXMuaA0KPiA+ID4gPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9jb25maWdmc190eXBlcy5oDQo+ID4gPiA+IGluZGV4IDkzNTA5N2FhZmE5
Ni4uYzlkOTRhM2MyNmE3IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfY29uZmlnZnNfdHlwZXMuaA0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Y29uZmlnZnNfdHlwZXMuaA0KPiA+ID4gPiBAQCAtMjQsNiArMjQsOSBAQCBzdHJ1Y3Qgd2FfYmIg
ew0KPiA+ID4gPiDCoHN0cnVjdCB4ZV9jb25maWdfZ3JvdXBfZGV2aWNlIHsNCj4gPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoHN0cnVjdCBjb25maWdfZ3JvdXAgZ3JvdXA7DQo+ID4gPiA+IMKgwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgY29uZmlnX2dyb3VwIHNyaW92Ow0KPiA+ID4gPiArI2lmIElTX0VOQUJM
RUQoQ09ORklHX0RSTV9YRV9ERUJVRykNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGNv
bmZpZ19ncm91cCBkZWJ1ZzsNCj4gPiA+ID4gKyNlbmRpZg0KPiA+ID4gPiDCoA0KPiA+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2NvbmZpZ19kZXZpY2Ugew0KPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB3YV9iYg0KPiA+ID4gPiBjdHhfcmVzdG9y
ZV9taWRfYmJbWEVfRU5HSU5FX0NMQVNTX01BWF07DQo+ID4gPiA+IEBAIC01Niw0ICs1OSw4IEBA
IHN0YXRpYyBpbmxpbmUgc3RydWN0IHhlX2NvbmZpZ19kZXZpY2UNCj4gPiA+ID4gKnhlX2NvbmZp
Z2ZzX3RvX2RldmljZShzdHJ1Y3QgY29uZmlnX2l0ZW0NCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oHJldHVybiAmeGVfY29uZmlnZnNfdG9fZ3JvdXBfZGV2aWNlKGl0ZW0pLT5jb25maWc7DQo+ID4g
PiA+IMKgfQ0KPiA+ID4gPiDCoA0KPiA+ID4gPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9Y
RV9ERUJVRykNCj4gPiA+ID4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgY29uZmlnX2l0ZW1fdHlwZSB4
ZV9jb25maWdmc19kZWJ1Z190eXBlOw0KPiA+ID4gPiArI2VuZGlmDQo+ID4gPiA+ICsNCj4gPiA+
ID4gwqAjZW5kaWYgLyogX1hFX0NPTkZJR0ZTX1RZUEVTX0hfICovDQo+ID4gPiA+IC0tIA0KPiA+
ID4gPiAyLjQzLjANCg0K
