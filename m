Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C8EC77B7F
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 19:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9265710E15F;
	Wed,  3 May 2023 19:57:01 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F221810E15F
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 19:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683143820; x=1714679820;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wuyR21nREfihzLA7oxMGVmaOHWpjWMTigSzU7X7NxdY=;
 b=ca5EKbCzXgQmQwVtOMi/7OxNRUKFRT3+VaDdvC5WUkhXO7p+r5Vuj8RL
 C9/OyZpi1wcdO8KIaUsaqgP4uNpeUXVlK1jqsZpCo5Q5bs0E6Wdsi9B/9
 rnd4BhL25v4RadfPZMUimNvAqpUKFgnR48oH23vQl8brTDQG0YL5irznK
 Y15Swu6uIN2kzBFX8h23TsPCWv2EgdeqPQTFYZNtBO4mSl/fszs68QYqn
 daWWxGwo0gKnd6rfj+7/8OoaLvnIggreac65a9rjQY4qwv77J6vS+to8X
 dpdzdkDHlcEFayi9L9lnvvF4oJzTWyOrjkrWM8+/fNidjYN7P50Ns9Z/D A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="350831472"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="350831472"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 12:56:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="840810404"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="840810404"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 03 May 2023 12:56:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 12:56:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 12:56:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 12:56:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 12:56:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1f/b5dB7iXHWHincbJ7n/KMKI5+vYDdDM0C6SmHvC2vHCSPb2YQ6B3+k9TXZXIIxwo5fcv2fQRkyp3vhC7/F7+0D1J2RAaNh3IN4RmkobaO8sp7LF/7QoJQ6ECr+v5a9S+Dc8q465lbo8pJJkQlqZQOpuia5joKcLNfVHzgpQ7g6l4Y1GGo6PWAAAODr/88Vm37r48wnES94IfeJGT+LPLORFBXeQJrWkMvP7NGickV0nsaDdRKD4B6jZiTsOzc6BfbjHgVoYgPF8SbBmh/ayYtyOdewV4as/4L+9hYa/E3l9SPtCb6T8C7n8HHG+gTya/HDOaoyiEjwfOcgOkwRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuyR21nREfihzLA7oxMGVmaOHWpjWMTigSzU7X7NxdY=;
 b=JSu9K+/hYvK2keaO9d/uXA4XmmXjoC+c/VjC9Wpo7ajWHkg2OH7+WVi7mMSXmARXbFOwyZd50aMXUTYtidpiOnBteviN4x1GNV9KJPHNyfMKjsz6DVj8mG0fdd+uYxE+lnrG1jLZQ0RmVCbw/8pHG6QhY5OUmEjZr2ebIuzs9a3uykRkXCiP9sZpVLad9ka4Ilv2Dcwz2UUXM33Rid8PXup9ItWKFsKUrkBeZZ86rx0Dy9lrBX0GK6HtYOdcZj/dKCHgc4NX00M00U89pVBXxkKa261k+TVqUBKTwTdg517cb0o/w+w81zVzTpXNUYDf32Q6jOfx6ju+1xn0o8TzqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 PH0PR11MB7166.namprd11.prod.outlook.com (2603:10b6:510:1e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 19:56:50 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::8f6:8ec:1c7d:f166]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::8f6:8ec:1c7d:f166%7]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 19:56:50 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 1/4] drm/xe: Rework size helper to be a little more
 correct
Thread-Index: AQHZfCRLdFe+U8rdIkeMIkUpP2+/8a9IX0oAgAA5z+CAAAYeAIAAAbnwgAASWoCAAEQjwA==
Date: Wed, 3 May 2023 19:56:50 +0000
Message-ID: <DM5PR11MB1324E4410E724F41CB334547C16C9@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20230501115826.4191472-1-michael.j.ruhl@intel.com>
 <20230501115826.4191472-2-michael.j.ruhl@intel.com>
 <99f50c6f-3a8d-ee47-31f8-b54d94826289@intel.com>
 <DM5PR11MB13243086FBC7FC7CC5008F27C16C9@DM5PR11MB1324.namprd11.prod.outlook.com>
 <454307c4-6022-1016-61fb-93aad208a8d6@intel.com>
 <DM5PR11MB13246AAE5466673DE597B63DC16C9@DM5PR11MB1324.namprd11.prod.outlook.com>
 <220ced9d-3c49-6a2f-467c-9d02c55122fa@intel.com>
In-Reply-To: <220ced9d-3c49-6a2f-467c-9d02c55122fa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR11MB1324:EE_|PH0PR11MB7166:EE_
x-ms-office365-filtering-correlation-id: 64106e2a-687f-40ab-dc72-08db4c1088cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yc/J0HwjsQV4WQSCsQ3GHN7fj/yCc4eWdc7G0ysFyGyyslqTY8rY5kJV8C0LX89DZGjErvJ91uG8yIYORPDHuDC+U4uttmojh8dwWQvfYCqpK2L+5JJqKmMpE2L5b2uXcGxfaA7nzY9jMBR5Kx5A4+h3uMIuhvZqsye3KEzHh2tCUYwt4JdMaO4dlbTSpSHTRg32chQt8mMPhz4UEu3Ox5A6tbjndojPrCZbuqHez734B42gtCMJUMfCH/HSF7XXpsmvlga/HGWLXeR9bGkI+nuyb8TrSBMVpe7+sp4dMQOAbceTVauFxRM/WnngdCJ1z6Qov2ngLsrt1Os6vvkdHUJoC1PQVXAhUBUICC5FsOYHCBNpLIwbY3ry9FeTDuqrABsVjzptX5nMn1S3mIVBoygape09T/aAQj0BifXZq9gGurwSwQWA32TsUHU+fu+SZHX0FW7Dxti/w7MtHC3QaDQDPXh0PWWszCwRXx+xV00+gm+iSts1EerTcZwCPfa/kC8YacmbOSujAnYS/XCMN2Yh0+yV3N6eDMIfa7bBeJKWC42fHXrqmjSQKW1QC7itsD4kC2VwAv+BPC5dRhiyuHdf4S+ORP1YDac7m4eHrTrVRPhnLIq5c+uYejb3ajXM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199021)(107886003)(33656002)(9686003)(6506007)(4326008)(7696005)(76116006)(66946007)(316002)(66446008)(66476007)(66556008)(64756008)(55016003)(41300700001)(71200400001)(52536014)(5660300002)(186003)(26005)(8936002)(8676002)(38100700002)(82960400001)(38070700005)(83380400001)(110136005)(478600001)(122000001)(54906003)(2906002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGJhZGxUTCtRaWdac29IdDRMM3B4U2gzQWtqdzRnZGFTQzlJd2tLYThNM0xs?=
 =?utf-8?B?Z085TXBaNHZvcmg2VDN2R1VUWGhUaW5KNUJOY2o3M21ZbThMbXRJelg0MzZK?=
 =?utf-8?B?dVhHSHF6dDdXWW5BUi9MeE9QdjROUEtnRXFVZkFscjZEOE5ETDkrSjh2WVNE?=
 =?utf-8?B?dnM5dHZRV3AwTGtTYW1XSE51VEt0SVlvWU5WdnJMT01TK2ZYb3QvQ2VITTVO?=
 =?utf-8?B?a0R4Z2JOOWFXNU1jZ0VjeVBSVVR4bnV0cGExQkpNbjZsc3A4Lyt3ZkNxOTc3?=
 =?utf-8?B?ZjBRVFB3bW9zVkxQSmNCblJGd01SeThRSGFabE9mYVpKMDl0cDBEalpLN2VW?=
 =?utf-8?B?VWNRbngxdERiM0RzTFBRVmZnMVhySHZoaFltTWdTbjBOYmpiN3ZLQXhmWWxY?=
 =?utf-8?B?bmNhRTRqbzI0S00vM2NZRC8xOHNLaTk0WjNxdEpNdTdxT3ZZQ0FtWEJlRGJw?=
 =?utf-8?B?eVlIZS9mNFArVmFuOWlXT2pVTXl4ck1Ld3FhKzlFaXQ2K3VscFhtZGg5dkV5?=
 =?utf-8?B?UTRLcGx4ZEFWKzdZT1M2Q0VVT3c5TktBMlIyZDVCL3NhdE12UHd4czV5OWR2?=
 =?utf-8?B?bUdSSTZjSWpYTHV2Q2dGalJlNU1sTm50QlZ5NjNYQ3ZsUjIxblFLc2lJZlQ4?=
 =?utf-8?B?OWtVVjlkV1FaaU9RTjJ3UUIySHhiUUx4RDBlWHhhdGF1KzlCOHlGMHZqeFBD?=
 =?utf-8?B?WSt4TmY2aTJ2QUI1WmFnN3gxcllCWHV0U3Y2THREWHlORG1zdzRnWGhLY2pJ?=
 =?utf-8?B?TGpQNDV1MTdQT2RQaGM4ejh5em1EVVVzc0c5MDl3cTRXUEpESno1bForR1lB?=
 =?utf-8?B?bFhCT1RKeU5manNRbjYxaytoQ0svLzlWS3NQRFFPTUpsLzhTY0I3a2NlaU5u?=
 =?utf-8?B?emZic0t1MXdvclVwdnBMYlVBbU9pVVB4a0NyYWFyQTZxS3oyMmgwa0VyOGlw?=
 =?utf-8?B?QStNellYVFRSdE1aOFdTQWlPeW5PTVh2bzNQSGtLU0Y1eTU4RDhCcTFYa0Qv?=
 =?utf-8?B?dkZTdDJLK3JWL1hhS0xXY1l0YitJdFRCNCtvNEY3emQxVGRQWDYzTXJzTU1O?=
 =?utf-8?B?Y0V2bUJUSWlmWWl3N1RUVmk1RUQzUndBT3ZHMXhZZ1laRDJFNllaMFYrNWwv?=
 =?utf-8?B?YU1uTDY5ckN2NlRzL0huMnREeTluY2hFNGo5MUVXd0pNRHlQNzgxNEdJc0k1?=
 =?utf-8?B?dmhoSmNkTTg5RUZuZmppQkYwOXluVjBKbTMrcmVicjg2T3pwaTJlcGlLSEdV?=
 =?utf-8?B?VEN4V3dLZ1R5bk5JZXA1SjBzenM2WmpicHpUYUFJL0UrZWxCUnpEYmZ5WEZL?=
 =?utf-8?B?RG9BN2JDODZwb2NVV0cvWHd2UkJjVnFxUkYwRS9neElqbXgvYVNzMFhyTlJi?=
 =?utf-8?B?YnpFMUtscWVwOW5Qc1VUdkQ1OHNrdEltVGkzOXoxd3FWcExDZEZLRmFxYk5t?=
 =?utf-8?B?bkVSQU41ekRaNjhjeHpjVy92dmQ4YVVQWW1OWjNJZEpUbE5rVzlxVUFxREVs?=
 =?utf-8?B?VElJemRiMWdtWUVpM0VQYzF2amdHd3QzMlRtNWtzWjc2eXVxbENZNmNGaXY0?=
 =?utf-8?B?Y0JFYjRMYUlTWE94M3Q4NUZRRjVJMmVObjBVa1NwQjFXTkJoT05UL1pqcktT?=
 =?utf-8?B?S2JVOENTZXZpSkVkRy9ZdFBCY2R3dkhuZU9BZGVXYnY4Mk5xang3bkxuMDNP?=
 =?utf-8?B?RGVxSGJjb3hwMXR1UElhdmpLTkpTMko2L1lJcFlVNjlmMVE2UEFyaXhnNWNn?=
 =?utf-8?B?b3RtYWwraU1DN3BNcjVMNTlDYnJLVldZc3ZvV2tkWVF6VkdiZTBZNytXY3ha?=
 =?utf-8?B?SEl2dkg2QU0yRm11OU9aQ2xxWEQxU1ZuSVc0RjUrbVdVSGZLalVzd3AzZ1pS?=
 =?utf-8?B?em5vSVdtcmRvZ1k3cEJPWjNyV3RWYi80Z1dZNVVSQk43RENyUkd3bjRrb2dJ?=
 =?utf-8?B?dCtzZlZFRWRJMGRDZDh1VzFmT2ZtODkrNExPQ0lTWExzTUh5TU45c3pmVVBV?=
 =?utf-8?B?am04MDU2OW5WTzU3ZFBmNVdBcktoSWZra2dOREtkSWR0dTljMXlXdWpzYmZ3?=
 =?utf-8?B?RFoyZm44YkpaWDBWMThKUWJWcEk5Vk9YL2lZODJjZXhNZzhsNjRiUVBKaTht?=
 =?utf-8?Q?74kuT7xXnAyLilqrRZG8zKm7j?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64106e2a-687f-40ab-dc72-08db4c1088cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 19:56:50.1332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5BZL40Hub/Q1oZTTnkxEt5IiCaOs8/N54XkkpLn1srbaLcGnHDh6eKDajsBmL0pwVUiJ/POEEn4JUt1LdsK2CLftLtdoVIRFs/Gx8GvL4Js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7166
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Rework size helper to be a
 little more correct
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
Cc: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQXVsZCwgTWF0dGhldyA8bWF0dGhl
dy5hdWxkQGludGVsLmNvbT4NCj5TZW50OiBXZWRuZXNkYXksIE1heSAzLCAyMDIzIDExOjQyIEFN
DQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPjsgaW50ZWwt
DQo+eGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Q2M6IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3
LmJyb3N0QGludGVsLmNvbT47IEtlcnNobmVyLCBEYXZpZA0KPjxkYXZpZC5rZXJzaG5lckBpbnRl
bC5jb20+OyBHaGltaXJheSwgSGltYWwgUHJhc2FkDQo+PGhpbWFsLnByYXNhZC5naGltaXJheUBp
bnRlbC5jb20+OyBVcGFkaHlheSwgVGVqYXMNCj48dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0K
PlN1YmplY3Q6IFJlOiBbUEFUQ0ggMS80XSBkcm0veGU6IFJld29yayBzaXplIGhlbHBlciB0byBi
ZSBhIGxpdHRsZSBtb3JlDQo+Y29ycmVjdA0KDQo8c25pcD4NCg0KPj4+Pj4+ICAgICAJLyogVXNl
IERTTSBiYXNlIGFkZHJlc3MgaW5zdGVhZCBmb3Igc3RvbGVuIG1lbW9yeSAqLw0KPj4+Pj4+IC0J
bWdyLT5zdG9sZW5fYmFzZSA9IHhlX21taW9fcmVhZDY0KGd0LCBEU01CQVNFLnJlZykgJg0KPj4+
Pj4gQkRTTV9NQVNLOw0KPj4+Pj4+IC0JaWYgKGRybV9XQVJOX09OKCZ4ZS0+ZHJtLCB2cmFtX3Np
emUgPCBtZ3ItDQo+PnN0b2xlbl9iYXNlKSkNCj4+Pj4+PiArCW1nci0+c3RvbGVuX2Jhc2UgPSAo
eGVfbW1pb19yZWFkNjQoZ3QsIERTTUJBU0UucmVnKSAmDQo+Pj4+PiBCRFNNX01BU0spIC0gdGls
ZV9vZmZzZXQ7DQo+Pj4+Pj4gKwlpZiAoZHJtX1dBUk5fT04oJmd0LT54ZS0+ZHJtLCB0aWxlX3Np
emUgPCBtZ3ItDQo+PnN0b2xlbl9iYXNlKSkNCj4+Pj4+PiAgICAgCQlyZXR1cm4gMDsNCj4+Pj4+
Pg0KPj4+Pj4+IC0Jc3RvbGVuX3NpemUgPSB2cmFtX3NpemUgLSBtZ3ItPnN0b2xlbl9iYXNlOw0K
Pj4+Pj4+IC0JaWYgKG1nci0+c3RvbGVuX2Jhc2UgKyBzdG9sZW5fc2l6ZSA8PSBwY2lfcmVzb3Vy
Y2VfbGVuKHBkZXYsDQo+MikpDQo+Pj4+Pj4gLQkJbWdyLT5pb19iYXNlID0gcGNpX3Jlc291cmNl
X3N0YXJ0KHBkZXYsIDIpICsgbWdyLQ0KPj4+Pj4+IHN0b2xlbl9iYXNlOw0KPj4+Pj4+ICsJc3Rv
bGVuX3NpemUgPSB0aWxlX3NpemUgLSBtZ3ItPnN0b2xlbl9iYXNlOw0KPj4+Pj4+ICsNCj4+Pj4+
PiArCWlmIChtZ3ItPnN0b2xlbl9iYXNlICsgc3RvbGVuX3NpemUgPD0gdGlsZV9zaXplKQ0KPj4+
Pj4NCj4+Pj4+IEkgdGhpbmsgbmVlZHMgdG8gYmUgdGhlIHBjaV9sZW4oKSBoZXJlLg0KPj4+Pg0K
Pj4+PiBGb3IgYSBQVkMgdGhhdCB3b3VsZCBiZSAxMjhHQiBmb3IgbGVuZ3RoLiAgVGhhdCB3aWxs
IGVuY29tcGFzcyBib3RoIHRpbGVzLA0KPj4+IGFuZCBJIHRoaW5rIHRoYXQgdGhlDQo+Pj4+IHRo
aXMgd2lsbCBub3QgY2hlY2sgY29ycmVjdGx5Lg0KPj4+Pg0KPj4+PiB0aWxlX3NpemUgPT0gcGNp
X2xlbigpIGZvciBERzEuLi4NCj4+Pj4NCj4+Pj4gSXMgdGhhdCB5b3VyIGNvbmNlcm4/DQo+Pj4+
DQo+Pj4+IEkgdGhpbmsgdGhhdCBoZSAic3RvbGVuIiBhcmVhIGhhcyB0byBiZSBjb25zdHJhaW5l
ZCB0byB0aGUgdGlsZSBzaXplLCBub3QgdGhlDQo+Pj4gY29tcGxldGUgYXJlYS4NCj4+Pj4gQW0g
SSBtaXNzaW5nIHNvbWV0aGluZyBoZXJlPw0KPj4+DQo+Pj4gSnVzdCB0aGF0IHdlIHdhbnQgbWdy
LT5pb19iYXNlIGhlcmUgdG8gYmUgemVybyBvbiBzbWFsbC1iYXIsIHdoaWNoIHRoZW4NCj4+PiBz
aWduYWxzIHRoYXQgc3RvbGVuIGlzIG5vdCBkaXJlY3RseSBDUFUgYWNjZXNzaWJsZS4gQWxzbyB3
ZSBvbmx5IGNhcmUNCj4+PiBhYm91dCB0aGUgcm9vdCB0aWxlIGhlcmUuDQo+Pg0KPj4gQWhoLCBv
ay4NCj4+DQo+PiBVbW0sIHNvDQo+Pg0KPj4gc2l6ZSA9IG1pbihndC52cmFtLmlvX3NpemUsIHRp
bGVfc2l6ZSkNCj4NCj5JIHRoaW5rIGd0LT52cmFtLmlvX3NpemUgaXMgdGhlIHBlci1HVCBpb19z
aXplIGNsYW1wZWQgdG8gdGhlIHVzYWJsZQ0KPlZSQU0gc2l6ZSwgc28gaXMgYWx3YXlzIDwgdGls
ZV9zaXplLiBXZSB3YW50IHRoZSBlbnRpcmUgdGlsZSBiYXNlZA0KPmlvX3NpemUgd2hpY2ggd2Ug
ZG9uJ3Qgc2VlbSB0byB0cmFjaywgYnV0IHNpbmNlIHdlIG9ubHkgY2FyZSBhYm91dCByb290DQo+
dGlsZSBoZXJlIHdlIGNhbiBqdXN0IHVzZSBwY2lfbGVuKCkgSSB0aGluayAoYXMgcGVyIHRoZSBv
bGQgYmVoYXZpb3VyKS4NCg0KQWhoLCBvaywgc28gd2UgYXJlIHZlcmlmeWluZyB0aGF0IHRoZSBz
aXplIHdpbGwgZml0IGluIHRoZSByZXNvdXJjZSwgbm90IHRoYXQgdGhlDQpzaXplIGZpdHMgdGhl
IHRpbGUgY29ycmVjdGx5Lg0KDQpXaWxsIGdvIGJhY2sgdG8gdGhlIHBjaV9yZXNvdXJjZV9sZW4o
KSB1c2FnZS4NCg0KPj4NCj4+ID8NCj4+DQo+PiBUaGUgc3RvbGVuIGFyZWEgaXMgZGVmaW5lZCBw
ZXIgR1QsIHNvIEkgdXBkYXRlZCBmb3IgdGhlIHBvc3NpYmlsaXR5IG9mIG90aGVycy4uLg0KPlNo
b3VsZCB3ZQ0KPj4gcmVzdHJpY3QgaXQgZm9yIEdUMCBvbmx5Pw0KPg0KPlllYWgsIGV4aXN0aW5n
IGNvZGUgYXNzdW1lcyBHVDAgaXQgc2VlbXMuIElJUkMgc3RvbGVuIGlzIG1vc3RseSB1c2VkIGZv
cg0KPmRpc3BsYXkgc3R1ZmYgYW5kIG11bHRpLXRpbGUgdGVuZHMgdG8gbGFjayBkaXNwbGF5LiBO
b3Qgc3VyZSBpZiB3ZSBkaXRjaA0KPkRTTSBhbHRvZ2V0aGVyIGZvciBQVkMgbGlrZSBwbGF0Zm9y
bXM/DQoNCkl0IGlzIGluIHRoZSBtZW1vcnkgbWFwIGZvciBQVkMsIGFuZCB0aGUgY3VycmVudCBj
b2RlIGJhc2Ugd2Fsa3MgaXQuLi4NCg0KU2luY2UgdGhlIG1lbW9yeSBtYXAgaGFzIGl0IGZvciBl
YWNoIHRpbGUsIEkgdGhpbmsga2VlcGluZyB0aGUgR1Qgc3BlY2lmaWMNCmNvZGUgcGF0aCBpcyBy
ZWFzb25hYmxlLi4uYnV0IHdpbGwgZ28gYmFjayB0byB0aGUgeGUgb25seSBpZiB5b3UgdGhpbmsg
dGhhdCBpcw0KYmVzdC4NCg0KUmVnYXJkcywNCg0KTWlrZQ0KDQoNCj4+DQo+PiBNDQo+Pg0KPj4+
Pg0KPj4+PiBUaGFua3MNCj4+Pj4NCj4+Pj4gTWlrZQ0KPj4+Pg0KPj4+Pj4+ICsJCW1nci0+aW9f
YmFzZSA9IGd0LT5tZW0udnJhbS5pb19zdGFydCArIG1nci0NCj4+c3RvbGVuX2Jhc2U7DQo+Pj4+
Pj4NCj4+Pj4+PiAgICAgCS8qDQo+Pj4+Pj4gICAgIAkgKiBUaGVyZSBtYXkgYmUgZmV3IEtCIG9m
IHBsYXRmb3JtIGRlcGVuZGVudCByZXNlcnZlZA0KPm1lbW9yeSBhdA0KPj4+Pj4gdGhlIGVuZA0K
Pj4+Pj4+IEBAIC0xMzksNyArMTM5LDcgQEAgdm9pZCB4ZV90dG1fc3RvbGVuX21ncl9pbml0KHN0
cnVjdCB4ZV9kZXZpY2UNCj4+PiAqeGUpDQo+Pj4+Pj4gICAgIAlpbnQgZXJyOw0KPj4+Pj4+DQo+
Pj4+Pj4gICAgIAlpZiAoSVNfREdGWCh4ZSkpDQo+Pj4+Pj4gLQkJc3RvbGVuX3NpemUgPSBkZXRl
Y3RfYmFyMl9kZ2Z4KHhlLCBtZ3IpOw0KPj4+Pj4+ICsJCXN0b2xlbl9zaXplID0gZGV0ZWN0X2Jh
cjJfZGdmeCh0b19ndCh4ZSksIG1ncik7DQo+Pj4+Pj4gICAgIAllbHNlIGlmIChHUkFQSElDU19W
RVJ4MTAwKHhlKSA+PSAxMjcwKQ0KPj4+Pj4+ICAgICAJCXN0b2xlbl9zaXplID0gZGV0ZWN0X2Jh
cjJfaW50ZWdyYXRlZCh4ZSwgbWdyKTsNCj4+Pj4+PiAgICAgCWVsc2UNCg==
