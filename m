Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25998C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 19:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C009A10E605;
	Mon, 15 Apr 2024 19:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VHRFiF8F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1412E10E605
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 19:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713209092; x=1744745092;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Gk3pba490if6qOpXcvHZYBNaIA52B5KbHIB7fsY3qKQ=;
 b=VHRFiF8FiMJ/VEdn6/b6iOeeS2nULP/HH5NTJLm53cJLWWfT/MsSTune
 CSSqkjVxR7rqYw2H8FT1nUYmUEcayMwijyYwFkamleEv9npdyVVnHmhoY
 jCU4VqLHgoC5BbtcMQe1QlYD0+IPYL+RA9uOqJrVSk7MD6Rm2cXNLO9V8
 1I/tWlKFtWBGanyJ0zxiCv00dAEoriHtFFaKrsU6Khyt2gQPTWhX5NWp4
 Fmoh6/h9R2aE58M6lxZC/8hJUzCLlNG7sK1Sgwn7mPByopP+jloTgG28a
 sPpPZwhGkBd56wz0GokfF1XzXFexRTH+W2AkWYLK9F1RS3LEUPVzHzXgi g==;
X-CSE-ConnectionGUID: TNqp2QcjTHWPzFlEXw0Rtw==
X-CSE-MsgGUID: D8fS3LZcTG6vqf8UmkVUNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="20009105"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="20009105"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 12:24:33 -0700
X-CSE-ConnectionGUID: f9I7HksMRCiYF++N/prrQw==
X-CSE-MsgGUID: ewUUTWCwTcmQsc7ZK6ZpDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22438963"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 12:24:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 12:24:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 12:24:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 12:24:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HABmZeuMfI8y1/zNz8s9RLUI4ngRGfwqh41st2DiRKkO3ETerkAGyA3baIOZI4gs2OD+sOQnJtDX9VOhoy9L1Qgr4GzlKXZaxvzo45Qq6dNFx1aRpOkhsmfjVngoHsPI+5MsXektcCOCiEzA1JMhNPmJxG5uP7Cc1GU559IWr5Siql9B4XQYL9rF2JxWFYkUJcB7ReYEUajcIAjfzyUXdLS2esSCNVDsg1VaR6vdSpMFKD6d3Z8MtbQippCj+4TT3z/YZyNCxtlWfY4+e/zBY2nf3WJ2UtZKZTY1RJyyUe687sw79L1A9svejQ6ODxJIizuPl0kpDJ1/p8RbOnDvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gk3pba490if6qOpXcvHZYBNaIA52B5KbHIB7fsY3qKQ=;
 b=VRYPBFR3Qv0j12RTcJ5Mz/U/hmhXovHuRl2dMC287/MirJDgGDB37B3KTFnLzwUPHcJdR+WuGiKKSyGghzxUqTMgjB8oaYB+io7Ejk3YSIyN6Z5bn4zBADdIvHrYv1hwUMDj4kQv86opCAtfbTzW5pmpMHhVYHWEqs3Og6INbqNcCytZfdz0nxqz2n36E7XpC+wyQb9A6s1hp7HSvuL9AaDTy3AjAhSsdT/S1LjMMUy6TJh6y7ulIGNGCD9MbIOmg1BIhtfC2Ox0jTVe5qDjsvccsmkT4KW9uSlb5dwUL9po+rLSWg3Z7oI+vE5Ua2Ft1RYoOsV7jFAoGG5OrSlk8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB6833.namprd11.prod.outlook.com (2603:10b6:510:1ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Mon, 15 Apr
 2024 19:24:30 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf%6]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 19:24:30 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [PATCH v5 3/4] drm/xe/xe_guc_submit: Allow lr exec queues to be
 banned
Thread-Topic: [PATCH v5 3/4] drm/xe/xe_guc_submit: Allow lr exec queues to be
 banned
Thread-Index: AQHaj2d0DPWAykO2cUaoaR9gLFbzAbFptkCA
Date: Mon, 15 Apr 2024 19:24:29 +0000
Message-ID: <0bbe9c140b92f01db55d08dcd8bf6c6819dacb98.camel@intel.com>
References: <20240415184608.2918959-1-jonathan.cavitt@intel.com>
 <20240415184608.2918959-3-jonathan.cavitt@intel.com>
In-Reply-To: <20240415184608.2918959-3-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB6833:EE_
x-ms-office365-filtering-correlation-id: 3d537d2a-b7f4-414d-9e74-08dc5d81ac21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BHaLwWXEzZFhvySxWBkACtbmgcXKJg2mgpLwDCWnPdE7qGjZH9VDR2utHq+sFzFjdwyDOT0zWWFcLiOjxYKI2V4DQ/w4DB6z7XZwD3nnpopeyB7qH7SedTV4o21wh+BFcKYyuge8aET3NKoC8afR1iT+YFX6Txn7DT40Vs9uwCMGXGrvTK2dBHzY7oE5FcPks8B7oAW7W51+opbQ2yhFwX5jwgrs0coHtXE4kQ0BtEU9yMZmZYst4yPBjZJYxHz4c0PuTB/oSOpwlE/1HaFGtsvc69GGAuHkKuUOYPB9btWdFrHgqrXVqdIZbxWerZ0nmw7vlrkx+L0UGZ3CHgvPLqaD2VGmXvCHfJbGUDhnDfuI+MWcwJ0rLe+MYcxBI3J7vZQ/6JTLxFR+7MVp8XYj+loCCY4B+uWXs+Vf810KPh3qZKntyaQ6UPUxEub6HHTSa+DmXwvwrq4ZtrNQS1tR6VSnE5EIYOHyEbBY86x2BX++m9/rHGT3qzIq4mkY+fjjHKSndutBIa1zlDWhkIt5zOQd39ctT7qiq0l3oBRH5PAXR2ilT9SfIUKrS9VWnNBysy1+2eeAllxaz+ct2zhGFbxHUqGfg/aFxpuhVMDTThaFkv8VKqjbrX2wsERl+7uN3AkeMHs+fm3lmufxfh4cJBZNhMCqr234UqQRwqjToRPUgkDlvsjfq0Sp28rTowfVdshWsshnYxWdMJodXlhH5yLipjGZLgy6ELCiwp1TG1M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVZXb0hHWmVTTlBVODBueWxUZGpxUkZkbnNaN0NHNEdBWkJacmU3SkF3U3ox?=
 =?utf-8?B?WVdLclZrblV1djR3d0UyWUNMSVY1WCt1UENTVk9Uc0dYNy9pS3pmTHJuQ0p4?=
 =?utf-8?B?QllhNFNPR3Q3QjkxWWJoR09KVEV0NEZ6OUxsTDNsUTZPRkcxb0FZSFZIL2NQ?=
 =?utf-8?B?SytIZU5wK0tjNkhHRjJkNWlGSms0YUR0Y1R5WlhwMGlBOHJwR0dvWVJ3R1g0?=
 =?utf-8?B?cXRjTGZsanYyMjlzdU5XZjFTbHpZUlhybWUwZUVFbHNEeDBqVzg3ZlYrR2NU?=
 =?utf-8?B?bXl1RnplS2I5NERWaElRd0wremdvSGdoTFhlUkZxNjl4ampEbWJFODhBbi9Y?=
 =?utf-8?B?c1VmRDE5dzZYRkF6RkhHbFpNdTJ5dnRQSTUxd05EQUlzaDhxNkxnZ3JzNThu?=
 =?utf-8?B?SmN3eWlSWTR5d1RlQkNRc0xINUo2clZNbFptRzRZRnUxWnVDTzJkdGszN0t3?=
 =?utf-8?B?MlM3K0NBVGRONkxNUjlBbW5hT3UxeDBaVGNwY0twVzZ2bFdwZFc4OGNqNUc4?=
 =?utf-8?B?aUxnVnNYdTQvUVdKQ3ZUUklqSVlCbUpHQ2craWQ3R1gxemcxY0cwSnZDYW5K?=
 =?utf-8?B?L2Q4ZnppeDlGTGQxSlZzeU9obTVnZjRpeE16UFBWUm1GS1IxMkJoUkw5QlpZ?=
 =?utf-8?B?Z3k0M2ZCeS9mRU85QmNCSkdIU1RVQWJMM1Rpb0JEQ3JSdlNuMzdXLzZ1eG5M?=
 =?utf-8?B?QWRzRitjMnRCZ25sbW5IdlZnWUc4T2JLUjlwV0VTSUFqMXUyVmJiMHlkRStK?=
 =?utf-8?B?MXBSN00xMGsreEpuY2JacE9IeGUxbE95UVBCV0VjU1B2bm01ejZPdi9wTUFm?=
 =?utf-8?B?d20rQmtuc3c5ZjZ5bk5hT0hIaVVkMlNMNEVsSkxXZzhwcEdFOGl4bGhuRCtH?=
 =?utf-8?B?SHkxbnZZR2JOd09qOHJCN0JxRUhONUdVOHNlRzVIUko1eEtGQms5QkErVkFw?=
 =?utf-8?B?T3VSQnpueHArc0EyVk1KaUdVWkt6eitYeDFWWDkwUVRrdVRIeWdFdXRLS3FE?=
 =?utf-8?B?MjNWeTZ4Z2lKZWRmU1hYc3dQNmVoMVhkZmZXMmpWMUdXYVp2UU1iUnY0U2wr?=
 =?utf-8?B?UllaNHZIRHlpbTVQcHcrWEZVREx3TjJTZDdzclhiMEFRd05OTHVMUStlRGJR?=
 =?utf-8?B?TjM1R0IrRjJhaGdKMEZUcUxpZ01kRVFQZTE5bnBlWnRMb2RjKzNZYnBjMmdx?=
 =?utf-8?B?MUdENXlqNmZsYllUOXdjSy9TYVNzTzEwaHVNdUNqNjFBQVZ3ZnhjczNzR3pW?=
 =?utf-8?B?cTBURnBndzRoOU5FZzVzaXBpQjhYZk11SXJRRmZPelZQOEJQMzJQUmtmSW9w?=
 =?utf-8?B?Mkl1ck4zN0tldzFiUndveHBITGJmTjBvYW9Zdk12VEpMRkZNTHRuZVVVY3BV?=
 =?utf-8?B?cjBuQ3ZFQ0k5NExSeldmaWt0eENVK3NjVWxWWlhPTlJUL2NQdi9FUnZxUHU4?=
 =?utf-8?B?VzFBbUdmT2RqT3BNdEV5N1JrUEt5dnRkS2xTZndydFBrY1lPK0xxQStTdkc5?=
 =?utf-8?B?SmtocmNNL1dONnlXUldkc2ZnNXVKazFldjI1NjdCajlvSUtUbXZjSURNb1ln?=
 =?utf-8?B?eFVMSElhR3JEMGZJNFhFcFYwazdxRmdtMEowbTU3RDZnYkpMZUk1NE5uMk8x?=
 =?utf-8?B?dDBXQ0RxNU45SGw2MDE1a3FnUzltNUJqQS9EZTVVbTFVWDA2S1V1TW5TTkxY?=
 =?utf-8?B?UmFGQWJmMVh4bG5wcGdMRXl0eXpBaGFFc25GTTlSVEE3YzdReGZUQlJzeGJS?=
 =?utf-8?B?UStHd0p5SVJ1VEVBcFBmZGRwY00wR3pWV2FwTjV6Zll2UVR3dW9GMzQzSXRQ?=
 =?utf-8?B?WkNtVEg2NCtHS3RHTzh2SHlIbHVPL1dKc05RazExSHF1T0xMY0lHaExOS2hm?=
 =?utf-8?B?cWhQSVp6RmVwWTlGejBWYmQ3NGhZUGhLbmkzYjB6MDdhV21RY01ZVkVuWll1?=
 =?utf-8?B?dDc0a1BzSkpRVTZ4YlI1cjNBaStQaWxYRkMwS1FJbGVZVzVUdE8zMEQxZG92?=
 =?utf-8?B?VU1TMGFLUmszbGZiYWJNOGJabFN5TDhZdnBXd3lrZWl0MTBQZU1tQ2VuSXkr?=
 =?utf-8?B?MXcrQzNGYzRMaFEyZ1d0cnVwOVVXUXlrRjZNaWE2emFNRWJSU3orT3ZNa1ZN?=
 =?utf-8?B?RU50bVlXaEhLVEx4QnlaV1dOdG12N3pQUE1pRmZsa015a0pOVDBKekp1UW5H?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <233F6B2C9088B84EB5E4818DA8355D3F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d537d2a-b7f4-414d-9e74-08dc5d81ac21
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 19:24:29.9666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Or0yFBHAs3wUa0mu93yxALLTHRO5fs9bNCV0hcy7pFhj9sQdYMiK8t4t8r5uC+2MMiUyqWyju6hQBr/f9dq5WEaKwqCJuapxSljkFlReak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6833
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

T24gTW9uLCAyMDI0LTA0LTE1IGF0IDExOjQ2IC0wNzAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6
Cj4gTFIgcXVldWVzIGN1cnJlbnRseSBkb24ndCBnZXQgYmFubmVkIGR1cmluZyBhIEdUL0d1QyBy
ZXNldCBiZWNhdXNlCj4gdGhleQo+IGxhY2sgYSBqb2IuwqAgVGhvdWdoIHRoZXkgZG9uJ3QgaGF2
ZSBhIGpvYiB0byBkZXRlY3QgdGhlIHJlc2V0IHN0YXR1cwo+IG9mLAo+IGl0J3Mgc3RpbGwgcG9z
c2libGUgdG8gdGVsbCB3aGVuIHRoZXkgc2hvdWxkIGJlIGJhbm5lZCBieSBsb29raW5nIGF0Cj4g
dGhlCj4gTFJDOiBpZiB0aGUgTFJDIGhlYWQgYW5kIHRhaWwgZG9uJ3QgbWF0Y2gsIHRoZW4gdGhl
IGV4ZWMgcXVldWUgc2hvdWxkCj4gYmUKPiBiYW5uZWQgYW5kIGNsZWFuZWQgdXAuCj4gCj4gVGhp
cyBhbHNvIHJlcXVpcmVzIHN3YXBwaW5nIHRoZSB1c2FnZSBvZiB4ZV9zY2hlZF90ZHJfcXVldWVf
aW1tIHdpdGgKPiB4ZV9ndWNfZXhlY19xdWV1ZV90cmlnZ2VyX2NsZWFudXAsIGFzIHRoZSBmb3Jt
ZXIgaXMgc3BlY2lmaWMgdG8gbm9uLQo+IGxyCj4gZXhlYyBxdWV1ZXMuCj4gCj4gU3VnZ2VzdGVk
LWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+Cj4gUmV2aWV3
ZWQtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPgo+IC0tLQo+IAo+
IHYyOgo+IC0gRml4IFN1YmplY3QgbGluZQo+IC0gTW9kaWZ5IGNoYW5nZSBzbGlnaHRseSB0byBy
ZW1vdmUgbmVlZCBmb3IgImJhbiIgYm9vbGVhbgo+IAo+IHYzOiBSZXZlcnQgY2hhbmdlIGludm9s
dmluZyAiYmFuIiBib29sZWFuIHRvIHZlcnNpb24gMQo+IAo+IHY0OiBBZGQgbWlzc2luZyBzZW1p
Y29sb24gYW5kIHJlbW92ZSB3aGl0ZXNwYWNlCj4gCj4gdjU6IFVzZSBuZXcgeGVfbHJjX3Jpbmdf
dGFpbCBmdW5jdGlvbgo+IAo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYyB8
IDEyICsrKysrKysrKystLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
c3VibWl0LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMKPiBpbmRleCA3
YjZjMDMzYTU0OTZiLi44MjQwNjYzN2M2YzVhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfc3VibWl0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1
Ym1pdC5jCj4gQEAgLTE0MjIsMTUgKzE0MjIsMjMgQEAgc3RhdGljIHZvaWQgZ3VjX2V4ZWNfcXVl
dWVfc3RvcChzdHJ1Y3QgeGVfZ3VjCj4gKmd1Yywgc3RydWN0IHhlX2V4ZWNfcXVldWUgKnEpCj4g
wqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIShxLT5mbGFncyAmIChF
WEVDX1FVRVVFX0ZMQUdfS0VSTkVMIHwKPiBFWEVDX1FVRVVFX0ZMQUdfVk0pKSkgewo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3NjaGVkX2pvYiAqam9iID0KPiB4
ZV9zY2hlZF9maXJzdF9wZW5kaW5nX2pvYihzY2hlZCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGJvb2wgYmFuID0gZmFsc2U7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlmIChqb2IpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAoKHhlX3NjaGVkX2pvYl9zdGFydGVkKGpvYikgJiYKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIXhlX3NjaGVk
X2pvYl9jb21wbGV0ZWQoam9iKSkgfHwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfc2NoZWRfaW52YWxpZGF0ZV9qb2Ioam9iLCAyKSkg
ewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB0cmFjZV94ZV9zY2hlZF9qb2JfYmFuKGpvYik7Cj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2V0X2V4ZWNf
cXVldWVfYmFubmVkKHEpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3NjaGVkX3Rkcl9xdWV1ZV9pbW0oJnEtPmd1Yy0K
PiA+c2NoZWQpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGJhbiA9IHRydWU7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB9IGVsc2UgaWYgKHhlX2V4ZWNfcXVldWVfaXNfbHIocSkgJiYKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHhlX2xyY19yaW5nX2hlYWQocS0+
bHJjKSAhPQo+IHhlX2xyY19yaW5nX3RhaWwocS0+bHJjKSkpIHsKClJldmlld2VkLWJ5OiBTdHVh
cnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJhbiA9IHRydWU7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoH0KPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGlmIChiYW4pIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHNldF9leGVjX3F1ZXVlX2Jhbm5lZChxKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d1Y19leGVjX3F1ZXVlX3RyaWdnZXJfY2xlYW51cChx
KTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoMKgwqDCoMKgwqDCoMKg
fQo+IMKgfQoK
