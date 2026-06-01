Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3856ACD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 13:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC2C113324;
	Mon,  1 Jun 2026 13:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1KjWaDJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30743113323
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 13:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780319270; x=1811855270;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=onesvrc7j7EYfOigTD0fuQ/GHvuoWcvDy+U4g2B4M+M=;
 b=W1KjWaDJTOIlfddNtXCyHwDdPf/moN5G1Tix0RzO+TV9H/F+OaVOJph6
 9w8XtqZAzJVr+iSTaxvKN7CfqHl5XfpFIGVU8XDywPGLU4qLpw4mZy+0q
 8ppwhQ34G5ls5pPRTGyo7WZIdzEHTM5AT6lor9uP1bvMnSXKkfFnaQB/V
 U4gsH7yfNT7XXmQLUkYGUwRGn4Cbf1AX8IlQcSwKRkfqdL85HJLllcoHO
 U0Em215go1TGmqOfjMmMrAXTOioSC7dNSbIbQ2kym3sX/ckUrO+Skgx5X
 tIskV2K54R/dTvk+ngt3tDIjZkDZgblrckdpaEZg4DF9tmh5hz3qA37wh A==;
X-CSE-ConnectionGUID: TD0cI+xCQ9KHgLpyVHjpUQ==
X-CSE-MsgGUID: u2HG41T5TPiKIR8ApItEhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="91756508"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="91756508"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 06:07:50 -0700
X-CSE-ConnectionGUID: 86G626F1QKSpjQmNvZ0HAQ==
X-CSE-MsgGUID: 2i3JgVYYRyyPp0vAuAY+Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="248491496"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 06:07:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 06:07:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 06:07:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 06:07:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6JKH5bCaJE7lnR3er7lnrk3dC6fbOODuvFpLCLgvbFYBgVcA65QD4hEpT+KNWCv9a+peF5j+XFJcOz9Z3zY8xEDnqrzuKlPvUyJqDsdtcfLem2NJsCxFqYlETM7W3qtf+N+6IHGZRxyNarvklpQpZX+YzJWjxsuR854Vl0ocdtJvoFADO7PZY+6CvYR6UXkjiZWNULeCCZ6nFWJy2UT8PUiGIsxQIEhfkTwtepZHC/v3ztKGcsPJQ0ha6qR6yi4lThLBFQ592z0lRVceQNG5m/62VBYjwMIsU26VDgobwYW13Xbly7FYoUe6fTtpscZQ+2RRBdsdVRRckaJhdqNjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onesvrc7j7EYfOigTD0fuQ/GHvuoWcvDy+U4g2B4M+M=;
 b=ZLhjVDm401XgXb4XVCwl9g1dyNrjZz79LlGZRBEr4w4VHnjcJRiStYVF5qFb6deQ8YzIhjjxq97D2fyR7wsX3WxFmeP0juvz3Ls6UwWg8o4M0K9u3+mfFcRDLjmLJdkEQYjeXTfjjDyictV4u6sO/TLrcAvVgln7d8n1SAZ3L4kwKWMckQQSfnQDYxC7LEdMRlDUWu+2X3mWBkLVzfl55gkTISAtId7UQid320F5IFPWqi13G8VZQx5QmMTMF7buQ0yonTwHMfEpcLSExlTsWqvdxmhRrfZ0+dRS1fMJSE6SMjgHOJGb3t4XDMvQ69BYtJ5QA7mc2A7UExDoJXkM5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DS0PR11MB7506.namprd11.prod.outlook.com (2603:10b6:8:151::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Mon, 1 Jun 2026 13:07:47 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%4]) with mapi id 15.21.0071.011; Mon, 1 Jun 2026
 13:07:47 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>, "Nguyen,
 Brian3" <brian3.nguyen@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Wang, X" <x.wang@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: explcit TLB flush for context based tlb
 invalidation
Thread-Topic: [PATCH 3/3] drm/xe: explcit TLB flush for context based tlb
 invalidation
Thread-Index: AQHc7p+2AeT0UGEKT0yR2ITzPW1L3rYpsgcA
Date: Mon, 1 Jun 2026 13:07:47 +0000
Message-ID: <e2a8085eb12e850e35cd4d19b1c27b9a81b92b59.camel@intel.com>
References: <20260528124340.1864215-1-tilak.tirumalesh.tangudu@intel.com>
 <20260528124340.1864215-4-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260528124340.1864215-4-tilak.tirumalesh.tangudu@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DS0PR11MB7506:EE_
x-ms-office365-filtering-correlation-id: a3406b7d-60fc-4a87-2865-08debfdec6d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|921020|4143699003|11063799006|18002099003|22082099003|38070700021|56012099006;
x-microsoft-antispam-message-info: iaoYkEmNsLAIpnQB4eUfkLl3BVZA4taB31fpIwUG0hd+s6Tf4kW1q6i97rx92TM+EKwmaXHxdJMg/DFrqk/kGwd7uQdwlF4pLYQ2movEaVvxD5B2Y1VTMU40XyHP+8UPi0MMbJhRmGp8WJejkpJ9O5nY9dl9wAyb2EHMMXYLxOhAsMK00Vm/qYbh3LZ8nwVFhRDKsrIMYROQEdKvAqBu7BshoVk0vuBJraMrr2lv/5+vJcXcXqqRpfgj6+ddBTb+16nmiiLkQrdckR0BeO4B0uXoT6GWEJRb0vfE6If4en15AQFXakQFJpHWi5+1q8bEKrmwaeyILoKLW15UgI/7he28xmemsdTy3Fkk+el6di5+cn0XZdtyzmRep300FNFI5rD7QzXKWmN81JN05KjxabsQa3oWsoFrmgkM0xDbSgLY9mxBQ62r2ZpI+RHawRDVGbeyD4hWyLOC1eUpy0641T18p4P3qVeINgHfE2rcCvT9yY9ZI1GkLML7aCHCc31R8dnB5X/vrW+81cQLakq0/yM4RiK6zIUR3HVDDTl7X93OFJXkDStlzX2gzxn4Wo8Lc/oWv67aOGmxlp0ZYLh5jyEWyXVXOFgbenVpNocXhQLumu4qYZo77JotYSB0+a2XBS2/CAX+xh4ztKeqJDESHoAGJP2skJq2DXvuk7AC0imwm3SGhAetfV4pz9iUvPpxZIxXBfKtPB1/n+DEA5DgfItfyQPIxDj/HfynFvRLQEh4qGk0YVAZpugwT7pb00f8+xYC+flw9X6Q585KE7nQVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(921020)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QThMT2lELzZlNTFEbmdaY3BUbWQ4NnRxZjZLNlJmWkxZdFhNd2tJNkJZbW9D?=
 =?utf-8?B?T3ViRnZSTHhUZHBOaDNveXFQNDNXSnJwZ2thSU14bEVaNlJYM0FTSCtPQmVC?=
 =?utf-8?B?YnhjSHFPWTliY2VSK042TndBZG9qVGdyTXdxdXprdVFXdmNhOUJCZUc3Y01W?=
 =?utf-8?B?cm96N1ZUaGtJRHpCVlFYMmJLNE9kWE8ydHF1Ym1ieHFxRVFRVDhpQWZsTjFp?=
 =?utf-8?B?MkJYTFovVm9veWhKVlVuY09FdTZvajlQM0JkOEhYQ3pKT0Z6UVdTZFRYYzhQ?=
 =?utf-8?B?aytWUnNPZ2F5SGN4MGhNYkV6R0lTbmhkK2hLMG41SVpDOEtIVktyOWZ0Tktm?=
 =?utf-8?B?WFlxdXBLR0JJUnpYU1FMMmlvUVh1S1RIYWxkZUtpdENOY0Y0amxpaytra1Fx?=
 =?utf-8?B?ZnhGU0c5WituYmpNVUdYaFhYM0xia2l6bGlSTXBsYW1URFJtUy9IeDN4MXpp?=
 =?utf-8?B?OURLTm5XaW03ZkpzSjlyODJVMFBTcjJuVmpYT3lvSTNCVS9qQnExUTdhQlNE?=
 =?utf-8?B?TlhkSnR3MCtDVmo1S09USjBnS2VIWmdIMXlzajdxV3NSYVpqSmxaMjJoS0Zi?=
 =?utf-8?B?QnVVcVZIYnhVdm1XSHNTK2VSbjNBcTB0M2F4Ym5sZk9zWTV1bEgzOXp4S3Jq?=
 =?utf-8?B?dUVpSFdhVWMxY1IxYXRTUjBzd2R4bDgyRmNQbzkweG5XbEpLVFYwZG43aGpy?=
 =?utf-8?B?QmtvWmVINHFGZHFPWHFpclk0UzNxeVVtVHhNN05sOUp2NUZuMWphZ3ZMbGdl?=
 =?utf-8?B?VGk2M2o2cERmSjFOZWVNTUtxMU9HbFFVSVFreGtrYStERGNiMzJneE9ZZ1Jt?=
 =?utf-8?B?dmhZbmU0V1oyYm5lcHNBMkh4R0thbm0wSGt3aXVrTkRsNEFMaU5qRFlkL25x?=
 =?utf-8?B?RjBoZE5LYlVjcDZrb05YWDlOeW9VUEFUVUpRbEZvaWF0NityVW5xOHVCbTlx?=
 =?utf-8?B?NnhodXU5ZHgvZ1VXZWM4SEQ5Q1Z1NFFDb0QyYzJkaDVXMUNEanVOTVpBYisx?=
 =?utf-8?B?YkpzZ0JnQ1UvMHhXY3BBWW9ySk5aRVQrb2pDZmtVTDl6T1k0VWp3aHd0a2Q2?=
 =?utf-8?B?R3RERmgrNmUyM3MrZVpaMWJ5VjcydUI2RmRnOGFUWHlBWnZTaUFEUUlEOVhE?=
 =?utf-8?B?RktQOUJ3eGxSazZ3eS9GUXQwQ1hFME9RS2M4eVdtZDI2MU5ZZHk3ZnZFbjZM?=
 =?utf-8?B?blpUYlFYMlJ5MUtydVJSc3FXMDhWOXJ3VjF5eXplYXpKV0xSUk9hOWZubnZh?=
 =?utf-8?B?MCtpMWxVRzEyK3kwUmNqbSsyNkdoWlhqRm41VFFtRzlvVTFmVDNhOXlRZU1a?=
 =?utf-8?B?NlgyMmxncnZySXJ5Nk04bXpkTUUzTG55UHFTdHcyNU1FWHZUcEJpM3R4NCtw?=
 =?utf-8?B?NmlJeHlWWFJ5NmVobEN4b01HVkc3NW9seXBmcW9YMEJIVWI1T1FwZ0RUMUo5?=
 =?utf-8?B?ckZjQk1DVGZpbXlURG5PWjNpVlN0NkFkSWR1YTJjblduYmpnUDBEK3ZtN2hz?=
 =?utf-8?B?blplRWg4ekYzT29SclRRTzFqbzNGVDJwVEJ1VnpaUzIxMGRKUEo2ZnRWYzMw?=
 =?utf-8?B?aG1ZdVY4OXpOVVRMd3dDM1NqYXlCZlhYcG5rS0p6Mmw0d29HVit6S0hweEFG?=
 =?utf-8?B?VEpmaFdRbVpkUnRsY24xcFJSVTRNcGo2S2RWT3ZxMUhXSkVzWVYyK3I1TlpX?=
 =?utf-8?B?YTgvUUp5bFV3TUhyak4vNnNKMUZIS1FKYVp3TDM1cm9TR01FdTYzWDNMei9r?=
 =?utf-8?B?MHQxZHhZdjloYVNhRHlhZVM4Sm42UXE4WGlCVmxSd1lhVm5yZFpnbTRJWWZI?=
 =?utf-8?B?QUQvUVVCU05JMWFZRUhiTUNzemxpcFU5U3lVaSswV2JjOTZHUXFNYWxSRzVj?=
 =?utf-8?B?TW5iNXg3Uk1KMy9EZFRFS0tvbUU0TEErd29vbWY0R2xzVWd4OWNYRXdrZ1hO?=
 =?utf-8?B?L0NMS1VWVlQ0ZGtxSW9VcUhzeTJBMjhZQXBIOTgzWC95UVR3TTN6N3IzUHQ3?=
 =?utf-8?B?R0JBVDh4VkpNL0FjWEVSa2k2Tldkb1ZLQ1p2OU5LaWJiTHJCdkdwaDVXUzZt?=
 =?utf-8?B?b1dBZDJBYnVaVmYyWTBhai94a09nMVFudG1ySHh0WVMyTnhFTkpnTGl3NHI0?=
 =?utf-8?B?OTQ2SHNKMEYyVE55VWpiM3pTQUozVmh1QU9zMkVTSzI0N1p3S3NkMWpua2kv?=
 =?utf-8?B?b1YvRzg0Y240ajNzaXM3cDdlcXVITVFXb3dNSTVuM3RiaVQ5NW5SWE5CYVJa?=
 =?utf-8?B?cmpWbisxYTN0a0Z0NXpSZnI3RHUzcGwvbEszY0VUT0RHOWVLSmprVzUrOUc3?=
 =?utf-8?B?ZEdUNkdKM2hNMnd0SjhKdU5pR1JrWjBHQ1o0bEdGcC8wendvc1VhZ2JSclRi?=
 =?utf-8?Q?QLaet1eIzmKgtQnVVE5OtIV02kjsI/cXZ83sCrovyZuNc?=
x-ms-exchange-antispam-messagedata-1: 99qEjX2m/MmxKQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B051CC691125F49849C7B4B358AA3E0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qP7ortSPp+hCVR3bBHAWHpEV0WLFMDZRRanJkg4l+loPJ1Oa9Lsl05a53IS2pREpNfnmvByimoVfARhmA4LHIIDGuLf12dk8U2OXtvHIGbFbVh3GfUK5zqoAtu+KZpWY1cUi+mxqPtf89lZpEFxROCAVd4AIUL6EqLY61a/TGPFuYoADQkbfqV4l3nenT9UyLeTbhLTmFKc51MlX++Nqbv7c2JqHORv287wyOKI1x2ejDTYNlp+Ayfj0IBt/owDjQSrqzKMcnGTszZ6WZ/gPiXEZJ1UCaSwJKQ12qUhX1heQC+g5Djo2JMblDGuitBA6c+ZFhh6boVMbNTXedy8SNg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3406b7d-60fc-4a87-2865-08debfdec6d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 13:07:47.2813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ob3HkuO1cs1TY2xQjP/Tdaui2zTTl0GQocBeP12MWu5hRXcXGCVkgxU3u9fIWYBfGOn3A5+Afhv9P4rC/rf/0Zv7hzQY8QeYDfHreQOiqRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7506
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

T24gVGh1LCAyMDI2LTA1LTI4IGF0IDE4OjEzICswNTMwLCB0aWxhay50aXJ1bWFsZXNoLnRhbmd1
ZHVAaW50ZWwuY29tDQp3cm90ZToNCj4gRnJvbTogVGFuZ3VkdSBUaWxhayBUaXJ1bWFsZXNoIDx0
aWxhay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29tPg0KPiANCj4gSW4gTFIgcHJlZW1wdC1m
ZW5jZSBtb2RlLCBvbiBkZXZpY2VzIHdpdGggY29udGV4dCBiYXNlZA0KPiBUTEIgSW52YWxpZGF0
aW9uLCByZWJpbmQgb3BlcmF0aW9ucyBmb3IgVk1BcyByZXF1aXJlDQo+IGFuIGV4cGxpY2l0IGlu
dmFsaWRhdGlvbiByZXF1ZXN0Lg0KPiANCj4gUmVxdWVzdCBleHBsaWNpdCBUTEIgSW52YWxpZGF0
aW9uIGluIG5vdGlmaWVyIHBhdGgNCj4gYW5kIGluIFBUIHBhdGguDQo+IA0KPiBVc2VycHRyIFZN
QXMgYXJlIGV4Y2x1ZGVkIGluIFBUIHBhdGggc2luY2UgdGhlIG5vdGlmaWVyIHBhdGgNCj4gYWxy
ZWFkeSBzdWJtaXRzIGludmFsaWRhdGlvbiwgcHJldmVudGluZyBkdXBsaWNhdGUNCj4gcmVxdWVz
dHMgZm9yIHRoZSBzYW1lIHJlYmluZCB3aW5kb3cuDQo+IA0KPiB2MjogUmVtb3ZlIGV4cGxpY2l0
IFRMQiBJbnZhbGlkYXRpb24gaW4gbm90aWZpZXIgcGF0aCBhcw0KPiBQVCBwYXRoIGlzIHN1ZmZp
Y2llbnQuDQo+IFJlZmFjdG9yIG9mIGFib3ZlIHRvIHJlbW92ZSBleGNsdXNpb24gb2YgdXNlcnB0
ciBWTUFzIG4NCj4gUFQgcGF0aC4tIFRob21hcw0KPiANCj4gQXNzaXN0ZWQtYnk6IENsYXVkZTpj
bGF1ZGUtb3B1cy00LjYNCj4gU2lnbmVkLW9mZi1ieTogVGFuZ3VkdSBUaWxhayBUaXJ1bWFsZXNo
DQo+IDx0aWxhay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfcHQuY8KgwqDCoMKgwqAgfCA2ICsrKysrKw0KPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV91c2VycHRyLmMgfCAyICstDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+IGluZGV4IDI2
NjlmZjVlZTc0Ny4uMTVjZTc3Y2U3NzkzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcHQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYw0KPiBAQCAtMjAx
MCw2ICsyMDEwLDkgQEAgc3RhdGljIGludCBiaW5kX29wX3ByZXBhcmUoc3RydWN0IHhlX3ZtICp2
bSwNCj4gc3RydWN0IHhlX3RpbGUgKnRpbGUsDQo+IMKgCQkgKiBhdXRvbWF0aWNhbGx5IHdoZW4g
dGhlIGNvbnRleHQgaXMgcmUtZW5hYmxlZCBieQ0KPiB0aGUgcmViaW5kIHdvcmtlciwNCj4gwqAJ
CSAqIG9yIGluIGZhdWx0IG1vZGUgaXQgd2FzIGludmFsaWRhdGVkIG9uIFBURQ0KPiB6YXBwaW5n
Lg0KPiDCoAkJICoNCj4gKwkJICogSWYgcmViaW5kLCB3ZSBoYXZlIHRvIGludmFsaWRhdGUgVExC
IG9uIGNvbnRleHQNCj4gYmFzZWQgVExCIGludmFsaWRhdGlvbg0KPiArCQkgKiBMUiB2bXMsIGFz
IHRoZXkgY2Fubm90IGJlIHJlbGllZCBvbiBjb250ZXh0IHJlLQ0KPiBlbmFibGUuDQo+ICsJCSAq
DQo+IMKgCQkgKiBJZiAhcmViaW5kLCBhbmQgc2NyYXRjaCBlbmFibGVkIFZNcywgdGhlcmUgaXMg
YQ0KPiBjaGFuY2UgdGhlIHNjcmF0Y2gNCj4gwqAJCSAqIFBURSBpcyBhbHJlYWR5IGNhY2hlZCBp
biB0aGUgVExCIHNvIGl0IG5lZWRzIHRvDQo+IGJlIGludmFsaWRhdGVkLg0KPiDCoAkJICogT24g
IUxSIFZNcyB0aGlzIGlzIGRvbmUgaW4gdGhlIHJpbmcgb3BzIHByZWNlZGluZw0KPiBhIGJhdGNo
LCBidXQgb24NCj4gQEAgLTIwMTksNiArMjAyMiw5IEBAIHN0YXRpYyBpbnQgYmluZF9vcF9wcmVw
YXJlKHN0cnVjdCB4ZV92bSAqdm0sDQo+IHN0cnVjdCB4ZV90aWxlICp0aWxlLA0KPiDCoAkJaWYg
KCghcHRfb3AtPnJlYmluZCAmJiB4ZV92bV9oYXNfc2NyYXRjaCh2bSkgJiYNCj4gwqAJCcKgwqDC
oMKgIHhlX3ZtX2luX2xyX21vZGUodm0pKSkNCj4gwqAJCQlwdF91cGRhdGVfb3BzLT5uZWVkc19p
bnZhbGlkYXRpb24gPSB0cnVlOw0KPiArCQllbHNlIGlmIChwdF9vcC0+cmViaW5kICYmDQo+IHhl
X3ZtX2luX3ByZWVtcHRfZmVuY2VfbW9kZSh2bSkgJiYNCj4gKwkJCSB2bS0+eGUtPmluZm8uaGFz
X2N0eF90bGJfaW52YWwpDQo+ICsJCQlwdF91cGRhdGVfb3BzLT5uZWVkc19pbnZhbGlkYXRpb24g
PSB0cnVlOw0KPiDCoAkJZWxzZSBpZiAocHRfb3AtPnJlYmluZCAmJiAheGVfdm1faW5fbHJfbW9k
ZSh2bSkpDQo+IMKgCQkJLyogV2UgYnVtcCBhbHNvIGlmIGJhdGNoX2ludmFsaWRhdGVfdGxiIGlz
DQo+IHRydWUgKi8NCj4gwqAJCQl2bS0+dGxiX2ZsdXNoX3NlcW5vKys7DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdXNlcnB0ci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3VzZXJwdHIuYw0KPiBpbmRleCA2NzYxMDA1YzBiOTAuLjc4ZjliNTIwNDkyYiAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VzZXJwdHIuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfdXNlcnB0ci5jDQo+IEBAIC0xMDIsNyArMTAyLDcgQEAgeGVfdm1hX3Vz
ZXJwdHJfZG9faW52YWwoc3RydWN0IHhlX3ZtICp2bSwgc3RydWN0DQo+IHhlX3VzZXJwdHJfdm1h
ICp1dm1hLCBib29sIGlzX2QNCj4gwqAJCQkJwqDCoMKgIGZhbHNlLCBNQVhfU0NIRURVTEVfVElN
RU9VVCk7DQo+IMKgCVhFX1dBUk5fT04oZXJyIDw9IDApOw0KPiDCoA0KPiAtCWlmICh4ZV92bV9p
bl9mYXVsdF9tb2RlKHZtKSAmJiB1c2VycHRyLT5pbml0aWFsX2JpbmQpIHsNCj4gKwlpZiAoKHhl
X3ZtX2luX2ZhdWx0X21vZGUodm0pICYmIHVzZXJwdHItPmluaXRpYWxfYmluZCkpIHsNCg0KVW5y
ZWxhdGVkIGNoYW5nZT8NCg0KT3RoZXJ3aXNlIExHVE0uDQoNCg0KPiDCoAkJaWYgKCF1c2VycHRy
LT5maW5pc2hfaW51c2UpIHsNCj4gwqAJCQkvKg0KPiDCoAkJCSAqIERlZmVyIHRoZSBUTEIgd2Fp
dCB0byBhbiBleHRyYSBwYXNzIHNvDQo+IHRoZSBjYWxsZXINCg==
