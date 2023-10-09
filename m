Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C651CD613C
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 22:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B0710E082;
	Mon,  9 Oct 2023 22:03:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31C910E082;
 Mon,  9 Oct 2023 22:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696889034; x=1728425034;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cMr4Ks1C40cjwSCMPjmbkd6oiDo1b/riS0ZX3FR+cx8=;
 b=b9kuZ4i5wrMdIDq4Ae9Ij0qKNSYtR5qMhKzCiDiq0U1lz/hRLeHvt6Iw
 jIKcxZ6gpIu0dQTOl9/1eqtp5+jaxTEstoDYsbLMd4X2Vygwck5t7hZmb
 wuOvIivVRUXQNyQrCUd+BAl14x65Sr9y0BsYfyzQc2+/a7kv/dT8wN8Uj
 2rGLahjlVLzVNO63AQK/k8HGIyCf61tE3//X8Vk2Z2Upew6X6iqAFlDNz
 hRUf2kF1wpVG4WqBXfNrGJvB6ZERyG6q7nNXKIQhVD2CeKsGcaBCBe6b9
 K57E6hS/geDnryBbUq/KGGrU7Ugg3+KdPguYLxK/t7nszKts+jzk/xOxd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="2842238"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="2842238"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 15:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="843872365"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="843872365"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 15:03:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 15:03:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 15:03:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 15:03:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQWgd7aYEbe0L0udPzwYnSWwr8x/3UA3nE21Zi7YjnSbmoqLViqVdFokuDVJ0fNZuKxP9DFzcl1+bcDZsC402Z1nsy3WoHXc2JhHZ/pI/qpMpQwTunNFfoapnkNqG5zT2FE0qc73sACreiR5ZFEuIIfvJMsWAMFzFMR+4w0qMxly9Rxjsr+HKAkOVBIDfc/i7aOK9WSOn1mQAe2ofuu9JoxQ14zRqzcYpNjRKDZ/y+QdNqfkK5DO2gGRlp9qnl8GPd6mqTaMVJsb0S53O/AHKiWMKhq9SiURQUbvrnEYwjejh/bh66AjX7WZ4Xo/cbS48EoE23MLsI5O7X7kCfOkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMr4Ks1C40cjwSCMPjmbkd6oiDo1b/riS0ZX3FR+cx8=;
 b=jPIojJjxyfTsUmR0cl91IkvnZOTXcVVps0JGb8Y1bXLa97Y3QG9JxirlxvVFT7ZVz+gc2mb/HGbdyw/CGbIBWvzWai0oqdRzmXoFAvtEWMxxGynwnrxGewnLqfBw4cZWFSWxwKLUsT2ipRZ4XwT/HUlMtsKqz/pqeWGXbrOh6SB6XLggYw8vOX/Lc42Ms2ZfSHIhXh1Le7Jtn1zpllunF00XkkuxAP9mqmaXk4n5tdeEBlkCDan+W03u75QC/kHD+TGtl4CEsni1gsYh84aiUHZ3/nC/+jUDgkP0EcyD0vA77kzZUw6paRaU50+2pdgVXBoU4RR2velYwnaJPDkBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by SN7PR11MB7602.namprd11.prod.outlook.com (2603:10b6:806:348::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 22:03:44 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::fc2f:c7e1:8163:6c24]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::fc2f:c7e1:8163:6c24%4]) with mapi id 15.20.6838.033; Mon, 9 Oct 2023
 22:03:44 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Thread-Topic: [PATCH i-g-t 02/12] lib/igt_fb: mark buffers as SCANOUT
Thread-Index: AQHZ96EM3slcjGXWcEebTgIcJsUvL7BCCZhQ
Date: Mon, 9 Oct 2023 22:03:44 +0000
Message-ID: <PH0PR11MB5782CEDFA3CC59065DA9EFBC82CEA@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
 <20231005153116.452319-3-matthew.auld@intel.com>
In-Reply-To: <20231005153116.452319-3-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|SN7PR11MB7602:EE_
x-ms-office365-filtering-correlation-id: 9c4021aa-a0a8-4e7f-d77e-08dbc9139aed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /llnG+lAIfMK3ixz6gBYi/l3ezpKC5KiyN7iXU4taeQ9mi1MFFsrc7NJpLBaZFge57X6Cvo6MdSBMdfLG8AqDeDKwnEanfMYvDSoyB508cviTD03ahoYhwL7i8hXQYAgl38fDidHc9J60IynkT/Ol0jPaVGUtpmu53FHfFx3I/zXFQzKT1E8ZihVjOFcS4Ebi103O80B6xPMf93q9FrqeOcFXd9S9xAvJtMr9F/lTclUdChuJQfqL3sTTPvQe4dxr9n1xkn32r4mL4dijGmlBcpOAdR1VS4wCkV3ozHtvgll114wXR6tPcELjhYlMI4l07ClUwO6JKRABj5+E9sVzyWlVx4S7oVykM+fDFZw/s2qAHXlBHdNzVF6lQwfG42BzStuDec1iiXuekJd62BKZIyt48ugfdt1KalVGxuUSiw5CHqyDe30QtlPtxASR0U9PWBqAUpMcUAcunCd20U7TayBdtM4H9CHP1HDi6LFTs4u2bvv6uTndi2f0l4kcVGvGhKINzaZI2qEL8G0Gvu6+AjF1xPcqqzFdCbxflifPnrsNhxgH446Ga24wPOhAnUeN9O6KmObJSFCU4VulyjU7PsHamuMNpuwSDDxrTQ87lsnqjpr5ptH0XtOFuyl085/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2906002)(55016003)(76116006)(107886003)(83380400001)(26005)(316002)(110136005)(64756008)(66556008)(66476007)(66946007)(66446008)(450100002)(54906003)(4326008)(53546011)(52536014)(8936002)(5660300002)(41300700001)(7696005)(71200400001)(6506007)(9686003)(478600001)(8676002)(33656002)(82960400001)(86362001)(122000001)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2dURmpwcWd1MHNzbW9URUhwVUJUc3YxN2cyTFVUak53VW5TK1JYck5tYnZT?=
 =?utf-8?B?OUVlNUZwMnJ5amhja3ZSbUllMllqS2JrU3lsS1FSNTdXZzY0SmRrOEZaVzJk?=
 =?utf-8?B?bzMwSFYvR1RxOXZpSXBacW1vOFhQNXNBNlUxMXp3UzJZaGlweWk3Q1ZMZWVP?=
 =?utf-8?B?dEFtT0pPZzUyZ0FnWVBJNzkrdWN5V241blA3S0JYQ1pZeFFPQ0sxL01LQ1Fw?=
 =?utf-8?B?b3NhaE1HL21ISnVieW5hUnVNbVB1MDBIY1dwaW4zZ2ZXOVpoei9oK2NnU21r?=
 =?utf-8?B?QVREY1VTaUZsWVR1bkxxa3pCK2Q0bDIwYmtmM1M5V0NudVlTL0wzOSttbnZn?=
 =?utf-8?B?NmJpQmlwWlZIcHMzbDFuT1liSGt4dGt1K2JSNGNJYVdYd1ZUcW5Pc3dVZ0dP?=
 =?utf-8?B?TXdhUlgyaW4vSGNVNXcvczdUOXdHK0tnOExsaFJYaXZONzkxdWZQY3JxWHZz?=
 =?utf-8?B?eXlEY0s0UENITkRBYlVGRUlNaUNjbkF0UnhLM2MvM1I4T0tmN2JMZE5ITVcx?=
 =?utf-8?B?WnFsWUd6Vk9NY0FVMHBZcmQyeGxXVlppSkxIdUpHelJEb2srOG8wNW1DY0cr?=
 =?utf-8?B?Y0wxSitOenZWVDVyZ1hUeGc1V2FVZXdOeDFXbzlZTWdrbDRRZW83bVRSeU9Y?=
 =?utf-8?B?am5iVE1lYzRveStuaGhkNm1NSjFCRzN1NE5UZmRqWU56T0tmL3BwQm80SzBP?=
 =?utf-8?B?R2Z6RFdodklJZm1NUjlpaENlNDVFQ0VUYmx5VXU2dmdNT0FiTkQyeTlyaWdl?=
 =?utf-8?B?YzJ5Y3pwRUVNbjlPdmVYWDEwaHp1L1VtUHFZUkJ0aWNXQnAzQStXVEVTZEhK?=
 =?utf-8?B?THg5Q0cwbTlLeE1ZajNaQWlDb3BvMTc3TXF3Q29lZUJEb0NWbENabEp4T2FW?=
 =?utf-8?B?TGVjYzVodzV5eWtFL29LZUgxUWtwcGVpZnEvM1MvaFJOaStBYTQ5ZFZRZStJ?=
 =?utf-8?B?TUttWWlNQzdwTi8ydGVXMkM0a2E3ajlIcXM5Sjd3SVpmbUR1NXlDZXp6T2JM?=
 =?utf-8?B?ZnB3NTAzZzJtK0JBQXRkQjhpTEVPL0JTM1IxWlFWQ01VYWc5TWtBQWMxVDZE?=
 =?utf-8?B?alZlQXE2QjZtVk9TWk5ycyt1bUlqaVI4RU5IUzF1NWJlN1VZYVloaE1KdWZS?=
 =?utf-8?B?TkV4SHFUNkRmK3gwV29TYmN5S1JpRGlMRHh0NXhoMXBBL09USFcvbi9WcjJM?=
 =?utf-8?B?TkY2VkRxODVmQkl1RFp1a09tSStubXNEQzlUNjhzUkt1VHhOeGNwbFFPQVZR?=
 =?utf-8?B?dkI5NzgrQUtQY0p4aFZFdFMvY1NPOVE2dnhHSEw1TDhuTTc0Y2pmay9hN2RG?=
 =?utf-8?B?ay93TzFFVGFwalYxRGVsdjQ2MDZRZjdmUk9LK29jNW9qQXloS2ZRVHp1UnFW?=
 =?utf-8?B?cTI0NmpxemxoSEE2YXVZTU13MHJyZHJlZk8xTHFXUEtPaitVdXV3NjJQcmli?=
 =?utf-8?B?dEVRNGIwQmc3NkZjQlc2cXAvMDUwWUdvY0hrbVA1VHNNR3NkaFNjbTRNQ0Nu?=
 =?utf-8?B?Sk1YRlBUbURSb01DbHNBcUF6UzJoWWswYzZyczVlMDRUc3lFQVdIeUZiRTQy?=
 =?utf-8?B?VllGU3VsVVVsWnU1dm5wRWljazV3VnhyUmFkUTg3RlIvUkpYMFlyWnpPL3Y4?=
 =?utf-8?B?M0o3aTJja0lsK0pLRDNoc1k4NTU5NERKbEptY3Q0YWhtNVN3TGNDS3p6VkdF?=
 =?utf-8?B?bHpibUpqSXZDd1ZERTFBbHNBN0pDbWQ3ZHc0VUZhY0xZSWVmZDBPMTN3dTBL?=
 =?utf-8?B?Nys4b2p2YW1FK0RoRTNyekNLODc4ZnJNZmRlNW8rNHF0K2JVUlNudVFqZUUy?=
 =?utf-8?B?YlpqN2ErTFIvZGV1bnVTQlNZQ3lqQ0ZORzQxcUhyY1I2V3lmYWorTU5MSGgv?=
 =?utf-8?B?bi8vaE9nRkN5UDlXLzBZM2RJYzgzK0s4QnVsM2dwNmYyM1lnSEx3UU9PSFdu?=
 =?utf-8?B?c2phYXcySHlqVDJEcWVnOUs4Ry8rdFVUeEJkWThTS0g2WkFoZTF2U01iZExp?=
 =?utf-8?B?KzVtaFBhYnVhZDhEMUkySlRveDFLby95QTI3TGhMVW5zQ0MvZ3FmVzRFbXMw?=
 =?utf-8?B?cmFQYlFzcElIc3R6Z25GMGtJMUs4bDBVWk9Ja0p4QXgyY2JZcUZrbEZ6UnVv?=
 =?utf-8?Q?KezqNtfG17ib5wLg2/+y9xi0G?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4021aa-a0a8-4e7f-d77e-08dbc9139aed
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 22:03:44.3796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LhXwg7DmXmRjyXAPAFRk1iF4KNCDfLuJ7X/c1Sqv/4jaZtj/FzgNj0oaMI4OYGJCyelXoAjVuM+yzsSBDAl0eysXSbTlUGAkCrh6IyQdrxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7602
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 02/12] lib/igt_fb: mark buffers as
 SCANOUT
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgNSwgMjAy
MyA4OjMxIEFNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTb3V6YSwgSm9zZSA8am9zZS5zb3V6YUBpbnRl
bC5jb20+Ow0KPiBNaXNocmEsIFBhbGxhdmkgPHBhbGxhdmkubWlzaHJhQGludGVsLmNvbT4NCj4g
U3ViamVjdDogW1BBVENIIGktZy10IDAyLzEyXSBsaWIvaWd0X2ZiOiBtYXJrIGJ1ZmZlcnMgYXMg
U0NBTk9VVA0KPiANCj4gRGlzcGxheSBidWZmZXJzIGxpa2VseSB3aWxsIHdhbnQgV0MsIGluc3Rl
YWQgb2YgdGhlIGRlZmF1bHQgV0Igb24gdGhlIENQVSBzaWRlLA0KPiBnaXZlbiB0aGF0IGRpc3Bs
YXkgZW5naW5lIGlzIGluY29oZXJlbnQgd2l0aCBDUFUgY2FjaGVzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBDYzogSm9zw6kg
Um9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+IENjOiBQYWxsYXZpIE1p
c2hyYSA8cGFsbGF2aS5taXNocmFAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogUGFsbGF2aSBN
aXNocmEgPHBhbGxhdmkubWlzaHJhQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gIGxpYi9pZ3RfZmIu
YyB8IDMgKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5jIGluZGV4
IDU0YTY2ZWI2YS4uZjhhMGRiMjJjIDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X2ZiLmMNCj4gKysr
IGIvbGliL2lndF9mYi5jDQo+IEBAIC0xMjA2LDcgKzEyMDYsOCBAQCBzdGF0aWMgaW50IGNyZWF0
ZV9ib19mb3JfZmIoc3RydWN0IGlndF9mYiAqZmIsIGJvb2wNCj4gcHJlZmVyX3N5c21lbSkNCj4g
IAkJCWlndF9hc3NlcnQoZXJyID09IDAgfHwgZXJyID09IC1FT1BOT1RTVVBQKTsNCj4gIAkJfSBl
bHNlIGlmIChpc194ZV9kZXZpY2UoZmQpKSB7DQo+ICAJCQlmYi0+Z2VtX2hhbmRsZSA9IHhlX2Jv
X2NyZWF0ZV9mbGFncyhmZCwgMCwgZmItPnNpemUsDQo+IC0NCj4gCXZpc2libGVfdnJhbV9pZl9w
b3NzaWJsZShmZCwgMCkpOw0KPiArDQo+IHZpc2libGVfdnJhbV9pZl9wb3NzaWJsZShmZCwgMCkg
fA0KPiArDQo+IFhFX0dFTV9DUkVBVEVfRkxBR19TQ0FOT1VUKTsNCj4gIAkJfSBlbHNlIGlmIChp
c192YzRfZGV2aWNlKGZkKSkgew0KPiAgCQkJZmItPmdlbV9oYW5kbGUgPSBpZ3RfdmM0X2NyZWF0
ZV9ibyhmZCwgZmItPnNpemUpOw0KPiANCj4gLS0NCj4gMi40MS4wDQoNCg==
