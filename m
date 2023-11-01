Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47438C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 11:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D82C10E6CE;
	Wed,  1 Nov 2023 11:45:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F81310E6CE
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 11:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698839132; x=1730375132;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ncFd/KiJFFo5OHNH6r9jDyyXKXRFj33uKBfVTXwv7DM=;
 b=A1PO+vXcy+jknU9teEk5HobivjRrvsqkNf0BIuwBrAq869cGfJol0U7B
 wDiqB8mHji9T8Ua1DXNhmKJz5gFurcQTVlxJclbHxOxFgTihO39q8/inO
 VoSN8UsJG+m33OLB0g9+xmKpy7MYFFqPF7YgGeMVsJXFYbHv7dAhaIh2l
 VeJWcGLGXC1baLh7NswXdg9w2tQdZI2kZVuFSu4WXcxFgzNDpxeZnSYAv
 clb9sOymOINM6FFaV4QthAM4wk3rYdly8r1ezgbQT8+sFunbNxu1eEfFU
 DDY3Hi4+ws5VmMQboKHarPjR90LNH6HrrLwbqH8vOt/t6zfwVA82jgaPd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="387363493"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="387363493"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 04:45:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="2064110"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2023 04:45:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 04:45:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 04:45:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 04:45:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 1 Nov 2023 04:45:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=My/H2664Hip+JxMvqPCBLiiTMUWOQtoPtnLxB0gnpAIb8HCkAZZMmS0sPo6534qaBSlUl3ksaZmPozc8VLMEo1aeb5dBNU2MxoZC7mnyQKwxiOW/26IEIOMtjUSxqWCRzPSFsF0hWcCHvkLnluU8EMyuxT2ZN1SmeZRq+JbswHEMmG53lHH9e1M9Kggs2AJfYrkVKMQqcEYSnhL2tua1pv6cE5+K7fOxwKFykEN2T3kT2ol1HZiHt8Enk8TQUYkOYFexCEIhclHJC/XrMCLt2ViKWc3gtLJbuB6nrux06tlYA/NaXYTEjshcZMmT9a0opJX+BaF9/nFXLUNWoxqUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncFd/KiJFFo5OHNH6r9jDyyXKXRFj33uKBfVTXwv7DM=;
 b=UhstE7AB6vE7WhnZpGJ4r31DboTBq9QgUW6/cnj/nGfOCjmUCC8ZWl1AJ6RBtqpMeDO85o7yvpXBsEaWC9TPNABV24oouUnWVfxVYHQiyXYSd5r0A94G66gxjGyHtbPms/+sSSEEyk3+Si/2ve94moRXQ4a6fWngPYUUbiXt/rbTxFZNzAej0K65V3XUTy5mG7cIC9SzA4Vs96rmXMt7z1C84mULti6MrXiFZhSXkrkAIKZVPK8sBj3RffURzc0NqfqD3ZeAdoY8WU/pW0CwcFMazus/qTzSpR/L1Uzwk2mj1PXT9XE+1Qv5qj4iHtOr9XmXUPRUKPR44OfNA0bjQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19; Wed, 1 Nov 2023 11:45:27 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6933.024; Wed, 1 Nov 2023
 11:45:27 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH 0/9] Cleaned up revert of remaining changes.
Thread-Index: AQHaDLjoZ7Yu+39TK0yl9tn3k7PGrQ==
Date: Wed, 1 Nov 2023 11:45:27 +0000
Message-ID: <122156991261aa88cc360d0e11e2e6ed2f79aefa.camel@intel.com>
References: <20231027113453.117020-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231027113453.117020-1-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CY8PR11MB7036:EE_
x-ms-office365-filtering-correlation-id: 11156f7e-1cd9-4322-87ff-08dbdad00aca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qsCtdTeWhmLI5M1tonzrn7aL4oO3rhTqQlj8HbJWjsN+sLDDsatdEih16SoDzcZh0ZNfZCeXQE0BWybxnhEZDKBkxs9clWbXZlDAncbDE0ouWw65fSbgRXExOYb/kp+EYSqJV/OnECglVXkDKrsnnglPlB7OiDkpplbHTGoJCroJqWPmFPMqNkh0RxG9hq8FoT5NDYVfAqMJWgzSWxYFXMbmAywuKW4fHPseWtYtczAeOQxRuXPcIhCDygua6mcA5tphGdhHltf6DYF5/HgfPyD283IQB/cYp+kWotMFLhgqHu2wzVDUIF377zzjVOrep12JWRH5MI34dB8/+eRziC66vQEGThnS+WzEZhNiQA4aHeJU8cV9j2Y+M5Z338h/fnsGSRJzreLOTxJ/Cqxw+ixl5PUHMvDh1ns6MMNWtiCD42d99JKIjzajEJHPnFEObVBOU/0lzx4hES0dkeCQHaTEpUhZdhQOsGwCutD8ALBUnc1O6QqhjVtrhbFXuLLjbL1OhMXZrWmWv1WNGQA+RcssAmbv6Uoev1Q2FpW5fR/v4SW/X0WVcrVfqKWAIywfr1/kulWFagF7gfBv3KnLZZ/TUz37LMhSow8M/OXVkxo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(39860400002)(136003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(4326008)(5660300002)(41300700001)(8936002)(8676002)(91956017)(64756008)(66476007)(66556008)(66446008)(66946007)(110136005)(76116006)(316002)(6486002)(966005)(2906002)(71200400001)(478600001)(6512007)(83380400001)(82960400001)(36756003)(6506007)(86362001)(26005)(66574015)(4001150100001)(2616005)(38100700002)(122000001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmxxSXNPNTVsWWsvLytNNENCSHgrZ0U4N2orRlN3UW1ZSjBFOVFHMEw0SzA4?=
 =?utf-8?B?RzZ1cGJ3MW56WGFmN2I5R3pqTFoxeHV5cjU2Z0V4Ny85YUxHV3dhbDZYL0hv?=
 =?utf-8?B?eXpLSlB5bnNKOWNtUlZ1RUFHY0pyOHZlZWNTQkI5VmN6RG1YSVlCWXQ5YUNm?=
 =?utf-8?B?RXE3R3Fsc3lPVnBKVzlORTJVWlpDeENyS1hmbWw4MlVuTUdyQmFUV2hGdVNL?=
 =?utf-8?B?UWpiZEpHVTlxOHhDKytjSXJjUjdJTzdKUElsbW9zeGVlTHQzMHQ3MXFNSUpr?=
 =?utf-8?B?STNpVDFEbWJIUlBhVS9Sb2VsbDh0MlZ2ZEhpWFMwYVI5Y2EzUEJjM09FaW0r?=
 =?utf-8?B?Y3htVDBzQ2hyNEVqSnNhMlFUUkt3SE96Wjlkek5sYlYwb0dwVWFhY0VpbW80?=
 =?utf-8?B?KzJQWEsweWNoNFF6UXF4cmJCMDhjRnphblVFSyszbkUvNVd0dGNOQU1pZEJt?=
 =?utf-8?B?TFJWZ0ZMalljODFNeGtPUjNzeE5MUTVvNEZqS2UrelVOM014N3BoQWJZOGhy?=
 =?utf-8?B?VDlHMlJhWFVCckQ0RnZCNkRxRm9XR0pWK0k1SGpNODgrYy9zVlI5Z2VkMllY?=
 =?utf-8?B?V0g0QmFaNVlobVJybGExSkR0emgwL2E0U3pMM1pEQ3ZURk9XQlltZ0QycHIw?=
 =?utf-8?B?OUIwUkZiRkVRMDVkb25QZVlNdHFVczltcmx3THJpalFKRmVpcUh1OUkzYUI5?=
 =?utf-8?B?dU43MWY0ZTZQbVJRR3kzeWJRVVVzYklaTjNyY3lkMEhlUkhFQ1hXN2l2c2or?=
 =?utf-8?B?cDhla2FqTU84VHVnQmhqNndCMTlHUWI0ME9LcjV6dVJBVUttQ3p5ZE5QaW5v?=
 =?utf-8?B?b0pjbnZrYWd2amlybEhxNURjd2FZQWxEZURFS1dsWThIcFpQa0s1MXREckY5?=
 =?utf-8?B?Q05MQ0RpTE9WRTJtcURBeDMrR0VobG5EbGtKWEhnREpwSHdhUnZrQkdFRS9V?=
 =?utf-8?B?d2pJL1NLM2xpQm40NWo4NTROTVRuOHBNV3l4QmxjMGxGU01OTkhUbmhOc01h?=
 =?utf-8?B?STFJejQ2RVVGTGgvclJabS82ZS9MMWo4WThFdzdwOFZ5OUFPZHVCdE96V2tk?=
 =?utf-8?B?c3V0emZsQ0Jja215SmJnWmRtUTRPajFLRnJMeTlFNk9PWnY1QUZoeUhOYTdm?=
 =?utf-8?B?K3BMY1p0R1B5VVhzWTlWbkk3UkhrZlRtTXF6ZEh4dnJoamlYWWQvUmwrd0Qz?=
 =?utf-8?B?SzA5Mk9RczJGUmhjLzJnNDFXUXNZbnJzTnVrOVRveXQyV3FQQ05paFJ3N05k?=
 =?utf-8?B?TVlzN1F3Tkt4MDcvU082VENHTVJ3L1BMV0ZSUzFpQkVLMUpaYU5JMGNRUy8r?=
 =?utf-8?B?Q0trU3NIQmwrcGdtNkFVTVJmajZHeVpad1RZckQwdXZodnV6ejFydzcxWUdr?=
 =?utf-8?B?bDdsWmZyMDlsZ3RsUG8rSmMxSnBEUEpPdkpFZDIyM1ByQmI4NWxEODNFVXlD?=
 =?utf-8?B?WFl5OFBLVEIxWW9JNTZmTHQrQmFRVlQ5cEZ0QTg4NEIwK016S09Ed0dyRHZh?=
 =?utf-8?B?b1NOTmE1alRoVUdxTlhBVFRKU0I5T05JNTRDcVFwTTdmRFh1ZGpNdXVxNlQ3?=
 =?utf-8?B?cFFyZVNuamJKeU1jMnUrM0tJd3g2QkhHMWdyMnl3dW13Y3FKWDRtUU5CL2hU?=
 =?utf-8?B?dEVyQSs1L0Y1eFNqR25KdDZQQXZCcFBlWGZyd2phNXRRUnRVQ3dURmhCVnlV?=
 =?utf-8?B?dm5rM29mbDFZNzFaa1J4TkFvYTFTS2dHRXdNYkswNjNLUjNqUFBhaWQrTnFQ?=
 =?utf-8?B?ZTVWRFozYlF6RDFRcCtzL2oxRUs0U3doakIxYTd0ZGV0bEJCNzVTYnlRbWhp?=
 =?utf-8?B?cFIzNkJSd1hqY1g4OU9hMXFYMFdxcFpDNUg1dDRMZk1xbmlYQ21yTmxUd21r?=
 =?utf-8?B?Smh4a0RsUlpESWt4SVZrU2JwK1p4TkpDOTZZTDhGQjhheVQwQUljM2ZIMkxN?=
 =?utf-8?B?ZUJCSEZiVUQ5K0JKNU9XM2QrWS9ZbWg4RStuY0VxRUZzRU5DcUlTMjV4by9t?=
 =?utf-8?B?eHlxc0JBMHZ0ZFRVbmNPWkc5NFRuTndEeVk0OUQ0OTJ4ZncrSUZJRHI5bmw3?=
 =?utf-8?B?cFczcHNLRjdXR3ZFU2JQSkJSMVgwT1ZlTmpxam91a01abWNlWnIrOUJURnM1?=
 =?utf-8?B?amoweWlNQjJ2WGw0dzFLMWcwR0h0R2hpUit0eVcvajZUbW5zOGZ4c3BzZmVu?=
 =?utf-8?B?aVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7E752E76BA0474CA00973F9FE483E75@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11156f7e-1cd9-4322-87ff-08dbdad00aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 11:45:27.2050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7QMyA0CT0OVKsK6Vz0Kfqun73EF1gQlrxYmseYUkVc1WUbUXiwSpzJAu4ipdGLfH33MTUFRxgHYnwbj3OrG3VdKeTwlNDhrxe3nFNMIklyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7036
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/9] Cleaned up revert of remaining changes.
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTEwLTI3IGF0IDEzOjM0ICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gRnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPGRldkBsYW5raG9yc3Quc2U+DQo+IA0KPiBB
bGwgcmV2ZXJ0cyBhcmUgbWFkZSBzaW1wbGVyLCBhbmQgdGhlIGhlYWRlciB1cGRhdGVzIGFyZSBz
cXVhc2hlZCB0bw0KPiBhDQo+IHNpbmdsZSBjb21taXQuDQo+IA0KPiBUaGlzIG1ha2VzIHJldmll
d2luZyBhIGxvdCBlYXNpZXIuDQoNCkkgdG9vayBvdmVydmlldyBvZiBwYXRjaGVzIDQsIDUgYW5k
IDYuIEl0IHNlZW1zIHlvdXIgYXBwcm9hY2ggd2lsbCB0YWtlDQpjYXJlIG9mIGk5MTVfZ2VtX2Zl
bmNlX3dhaXRfcHJpb3JpdHkuIFRoZXNlIHRocmVlIHBhdGNoZXMgc2hvdWxkIGJlDQpzZW50IHRv
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgKGF0IGxlYXN0IHBhdGNoIDQpIGFuZA0K
aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZy4gSSB0aGluayB3ZSBjb3VsZCB1c2UgdGhl
bSBpbiBkcm0teGUtDQpuZXh0IHdoaWxlIHdhaXRpbmcgZm9yIHJldmlldyB0byBjb21wbGV0ZS4g
SSB3aWxsIHNvb24gc3RhcnQNCmJhY2twb3J0aW5nIHRoaXMgZnJvbSBkcm0taW50ZWwtbmV4dDoN
Cg0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMjUxNjAvDQoNClN0
aWxsIHdhaXRpbmcgZm9yIENJIHJlc3VsdHMgdGhlcmUgYmVmb3JlIG1lcmdpbmcgaW50byBkcm0t
aW50ZWwtbmV4dC4NCkkgd2FzIG9yaWdpbmFsbHkgcGxhbm5pbmcgdG8gdXNlIGk5MTVfY29tcGF0
IGhlYWRlcnMgZm9yDQppOTE1X2dlbV9mZW5jZV93YWl0X3ByaW9yaXR5LiBJIHRoaW5rIHlvdXIg
YXBwcm9hY2ggaXMgYmV0dGVyLiBTbyBpZg0KaXQncyBvayB0byB5b3UgSSBjb3VsZCBzZW50IHRo
ZXNlIHRocmVlIHBhdGNoZXMgdG9nZXRoZXIgd2l0aCBteQ0KYmFja3BvcnQgKGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI1MTYwLykgaW50byBpbnRlbC0NCnhlIG1h
aWxpbmcgbGlzdC4gd2hhdCBkbyB5b3UgdGhpbms/DQoNCkdlbmVyYWxseSBzcGVha2luZyBJIGZv
dW5kIHRoaXMgcGF0Y2ggc2V0IGJlaW5nIGhhcmQgdG8gZm9sbG93IGFuZA0KcmV2aWV3LiBJIHdv
dWxkIGV4cGVjdMKgDQoNCjEuICJmaXh1cCEgRklYTUU6IGRybS9pOTE1L2Rpc3BsYXk6IFJlbWFp
bmluZyBjaGFuZ2VzIHRvIG1ha2UgeGUgICAgDQpjb21waWxlIg0KDQoyLiBGSVhNRTogPG5hbWUg
Zm9yIGNoYW5nZXMgc3BsaXQgb3V0Pg0KDQp3aGVyZToNCg0KMS4gcmVtb3ZpbmcgY2hhbmdlcyBm
cm9tIEZJWE1FOiBkcm0vaTkxNS9kaXNwbGF5OiBSZW1haW5pbmcgY2hhbmdlcyB0bw0KbWFrZSB4
ZSBjb21waWxlIiBhbmQgMi4gaW50cm9kdWNpbmcgc2FtZSBjaGFuZ2VzIGFzIGEgc2VwYXJhdGUg
RklYTUUNCnBhdGNoLg0KDQpCUiwNCg0KSm91bmkgSMO2Z2FuZGVyDQoNCg0KPiBNYWFydGVuIExh
bmtob3JzdCAoOSk6DQo+IMKgIGRybS9pOTE1L2Rpc3BsYXk6IFJldmVydCBhbGwgYmVmb3JlIHJl
bWFpbmluZyBjaGFuZ2VzIHRvIG1ha2UgeGUNCj4gwqDCoMKgIGNvbXBpbGUNCj4gwqAgZHJtL2k5
MTUvZGlzcGxheTogUmV2ZXJ0IHJlbWFpbmluZyBjaGFuZ2VzIHRvIG1ha2UgeGUgY29tcGlsZQ0K
PiDCoCBkcm0veGU6IFVwZGF0ZSBoZWFkZXJzIHRvIGJlIG1vcmUgY29tcGF0aWJsZSB3aXRoIGk5
MTUNCj4gwqAgZHJtL2F0b21pYzogQWRkIGRybV9hdG9taWNfaGVscGVyX3NldF9mZW5jZV9kZWFk
bGluZSgpIGZ1bmN0aW9uDQo+IMKgIGRybS9pOTE1OiBJbXBsZW1lbnQgZmVuY2UtPnNldF9kZWFk
bGluZS4NCj4gwqAgRklYTUUgZHJtL2k5MTUvZGlzcGxheTogVXNlIGZlbmNlLT5zZXRfZGVhZGxp
bmUgdG8gYm9vc3QgcmVxdWVzdHMNCj4gwqAgZHJtL2k5MTUvZGlzcGxheTogVXNlIGk5MTVfZ2Vt
X29iamVjdF9nZXRfZG1hX2FkZHJlc3MgdG8gZ2V0IGRtYQ0KPiDCoMKgwqAgYWRkcmVzcw0KPiDC
oCBGSVhNRSBkcm0vaTkxNS9kaXNwbGF5OiBNaW5pbWFsIGNoYW5nZXMgdG8gZmJkZXYgdG8gbWFr
ZSB4ZSB3b3JrDQo+IMKgIEZJWE1FIGRybS9pOTE1L2Rpc3BsYXk6IE1ha2UgaW50ZWxfZmIuYyBj
b2RlIGNvbXBhdGlibGUgd2l0aCB4ZQ0KPiANCj4gwqBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21p
Y19oZWxwZXIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNSArKy0NCj4gwqAuLi4vZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMgfMKgIDcwICsrKy0tLS0tLS0tLQ0K
PiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3Vyc29yLmPCoMKgIHzCoCAx
MiArLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuY8Kg
IHzCoCAzNyArLS0tLS0tDQo+IMKgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90
eXBlcy5owqDCoMKgIHzCoMKgIDQgLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZmIuY8KgwqDCoMKgwqDCoCB8wqAgODkgKysrKysrLS0tLS0tLS0tLQ0KPiDCoGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmPCoMKgwqDCoMKgIHzCoCAxMyArKy0N
Cj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmPCoMKgwqAgfCAx
MDAgKysrKysrLS0tLS0tLS0tLQ0KPiAtLQ0KPiDCoC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9mcm9udGJ1ZmZlci5jwqAgfMKgwqAgNyArLQ0KPiDCoC4uLi9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9mcm9udGJ1ZmZlci5owqAgfMKgwqAgNCAtDQo+IMKgLi4uL2RybS9pOTE1L2Rp
c3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jwqDCoMKgIHzCoMKgIDQgLQ0KPiDCoGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfcmVxdWVzdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgOSAr
Kw0KPiDCoC4uLi9jb21wYXQtaTkxNS1oZWFkZXJzL2dlbS9pOTE1X2dlbV9sbWVtLmjCoMKgIHzC
oMKgIDIgKw0KPiDCoC4uLi9jb21wYXQtaTkxNS1oZWFkZXJzL2dlbS9pOTE1X2dlbV9tbWFuLmjC
oMKgIHzCoCAxNyArKysNCj4gwqAuLi4vY29tcGF0LWk5MTUtaGVhZGVycy9nZW0vaTkxNV9nZW1f
b2JqZWN0LmggfMKgIDc2ICsrKysrKysrKysrKysNCj4gwqAuLi4vZ2VtL2k5MTVfZ2VtX29iamVj
dF9mcm9udGJ1ZmZlci5owqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstDQo+IMKgLi4uL2dwdS9k
cm0veGUvY29tcGF0LWk5MTUtaGVhZGVycy9pOTE1X2Rydi5oIHzCoMKgIDEgKw0KPiDCoC4uLi94
ZS9jb21wYXQtaTkxNS1oZWFkZXJzL2k5MTVfZ2VtX3N0b2xlbi5owqAgfMKgIDEzICsrLQ0KPiDC
oC4uLi9ncHUvZHJtL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMvaTkxNV92bWEuaCB8wqDCoCA2ICsr
DQo+IMKgaW5jbHVkZS9kcm0vZHJtX2F0b21pY19oZWxwZXIuaMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqAgMyArLQ0KPiDCoDIwIGZpbGVzIGNoYW5nZWQsIDIzNCBpbnNlcnRpb25z
KCspLCAyNTIgZGVsZXRpb25zKC0pDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS94ZS9jb21wYXQtaTkxNS0NCj4gaGVhZGVycy9nZW0vaTkxNV9nZW1fbG1lbS5oDQo+IMKg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS9jb21wYXQtaTkxNS0NCj4gaGVh
ZGVycy9nZW0vaTkxNV9nZW1fbW1hbi5oDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS94ZS9jb21wYXQtaTkxNS0NCj4gaGVhZGVycy9nZW0vaTkxNV9nZW1fb2JqZWN0LmgN
Cj4gDQoNCg==
