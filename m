Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D772C77B73
	for <intel-xe@archiver.kernel.org>; Thu, 20 Apr 2023 17:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EBA10E0A9;
	Thu, 20 Apr 2023 17:45:14 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A8610E0A9
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Apr 2023 17:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682012712; x=1713548712;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uURHNr3aOEgbeZ6RkGfgMQn7Vf0DIuC6WrPpWjjnp9M=;
 b=VYgDj2GiztRWELva6Xk0oUYmrOG8tD6TWh2r+OxrtPPpbeBX3FwwIRlS
 qnqpvC8vCXs03HUcbHP23jRe9ukSd/kn4rzmlOz/w4/1Ki075c2uUdS0/
 xOX6+uAw8qGHCs24BQLWs1JDzukkdMJV1yzs6SMAI9l8w+M8BWbSwc5J9
 8h4w3lnSNCK1GpDqkzsF5lBGNDOYz5i1sFuL7WP9/+XZYmAoxzoy6VK3g
 6wnYmu73D0JRknAYBvKeMrHl6oOXtzEUi3N4tBok5/NfPltJHlMgsuUPD
 mzq3FwFMd/t+o79AuLDKmJZh1CjJvPTH1CkXJKksCuNoz5vj0fCZwc5b3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="344562241"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="344562241"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 10:45:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="694651172"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="694651172"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 20 Apr 2023 10:45:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 10:45:10 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 10:45:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 10:45:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 10:45:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOkMAWcrBAnIfRKTQtE3o4Tn5hZQkNxNDnyBXiM5NA6+ZNLk8LlOi7APjxPtkZ2gJkjB/k1hiu26KCzct3IyYRATmuo6YU9t8D3QcHGvxDpyGD3lOS9jevfmgB5xOlg/y8B2F0f+7U9dHc4DcO4LTOQ7kCx1isO8USv7aYYE0+Fgu+JrhQA/2x4q2KJKVmWvXtfaxZdyds5JmvBTOh5t0LZYWU12UQyetTloaCvg88mOd5KBw6bkzxzhOB74qZrl83Tha4vSobBwWNLcwTROfvYUKYoOFlwTgkciOvjjllQLktdNFtjZ2PUvbYldXMC/hyEYG6oWhX+5Ybzn6H1wpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uURHNr3aOEgbeZ6RkGfgMQn7Vf0DIuC6WrPpWjjnp9M=;
 b=j//HP4ulsblyvuqTPIu2UZ69glIpRvbWPxJoTzZRd+vS8rcTrp8SoTTf4eu60xxH/v4M4qaT3P7G/LH32xykwAvtA/1sYk1Z52Gi3uE7jC63R2fPQlJpxmeIbaSR8ZAf+yPBITN5rMJTCzG54b2d7h6NzrrDAOVNK0FGZePUMNT/eoyJr0+uZseeqINp8EMksQkvZRqaebYJbhuJjLp3Yv8jobU6XaJbc6z7dtDnbbFWfzzTS0PmgZ3/tMAyL/9XJg8ZfBOQHxTmk2aMekBeUddwVAvfvf8B0R+0DC45sw4dh3xGLgE/NngEM1kqKHyGh2cHgpc0k9z7Zk94+RnQAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH3PR11MB7763.namprd11.prod.outlook.com (2603:10b6:610:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 17:45:03 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::401d:5396:cf8d:5d58]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::401d:5396:cf8d:5d58%9]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 17:45:03 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH 0/4] RFC: Add new device configuration
 infrastructure to
Thread-Index: AQHZcugUsD4YBqxjN0C5KffvW75kja8z8FuAgACJeYA=
Date: Thu, 20 Apr 2023 17:45:02 +0000
Message-ID: <7628d19bb8c7f9161c9fc959d7d26b38fc7c84ba.camel@intel.com>
References: <20230419175501.155319-1-stuart.summers@intel.com>
 <87mt32x5iw.fsf@intel.com>
In-Reply-To: <87mt32x5iw.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH3PR11MB7763:EE_
x-ms-office365-filtering-correlation-id: 844a6eec-e6a0-4e53-ad91-08db41c6f858
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RqbHzwZHcauRW4XZVWzZlo85V65/DDyMpM9JJmuU6XFyIEnvHlbfFaRyu22f1SEpCl1j0vjug5NNEki3lJaEOYTPfempttDv55Pjriv4MhnbeqC1FPN0Ob31sbWFSlsUIvQjWnxbbbgSHug6f6GyPmhDEowRn6mDoVqQh4fS2SUn6w/s8EWp32HiJVZEA/wJqEZ2DgR7ofiDYPRqEd07dIT1n4YGi5HwtOsphEvvSOAH/Z0YJ4YIZoYjiy5jqdF9M7Rr2AwUv0L5BY0eGvAtolD4dfyKu7FcuVvYctVeqNV4vusES1+T9+pwdJoAjOPyyiCi8/bBa4n8FcqSZQlDysIQr2oByUX4zagJ7uw16jC9jxBLXDAmj2tWiaOZzMb0P6Zcvkp2E3rKnL7uDh9f9L95h3r3afiMFdYHA9EIEBzDvxl9gsy7IfRL/QWX/VaH/DK8klWnF601YtGM067pduFBPpxCmvpQ0Ln1nKVfVb4bBsnba+6EHtWOfyF1Bg8hiXd2Qc1w7pX0sKxk79ftMQ1S9EnvBukeeI0x+eSWHRTIeaguerIDMhBcoblaVDFDYuPHlqX6BFXgNqNKRCNOtGqfNDXv3y2nelzwDnp/o7SYK3oXgMTkdn5ec/Zmt6A+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199021)(36756003)(4326008)(54906003)(316002)(6916009)(66556008)(66476007)(66446008)(64756008)(76116006)(66946007)(91956017)(478600001)(71200400001)(6486002)(8936002)(5660300002)(41300700001)(8676002)(2906002)(38070700005)(86362001)(122000001)(38100700002)(82960400001)(2616005)(6512007)(26005)(6506007)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1NBeGVDMUdPdjFoajUvTDNUc2pabXRPdTJ3UUJGbCtMNWZLMHlWeUM5QW1P?=
 =?utf-8?B?WHVXOE5uTjQ5WmNyckhRSDJpcEg1bUt2d3oxbk5rS2x2Ty9tZUM5R0FabU52?=
 =?utf-8?B?S2pYMHF4Tk9NczZiUnlsRUk0c2ZQM2FsY3dGN01ZVFF4ak9tRjNvNHl2UFFn?=
 =?utf-8?B?em0wSXFwT3cvYldtU1ZjVWNPQUttcnozNU40b3JMZUdtM2h0Rm5FSWRFTDRj?=
 =?utf-8?B?RTAzRTVLUjNNNVRwUlc0SmtUQ0V6OW1CNjVFckFkamZtYnpGeWtVWG1RVlRB?=
 =?utf-8?B?QjVtVnIxMTJqc1RDTmNHTVpnZlRSajh3UjJHbFpqMzN6eVFKazhFR0dQd2Zu?=
 =?utf-8?B?Sm9zNkZWZG1lL1FYR3J6bFZxbGxoajBYMHVZYy9veldxTS94Z2lCRmRKTm9R?=
 =?utf-8?B?QnZTSDdvUVpCcDV0Zm95d3Bsc0Y2RU9OcXZlTm1waVllRVRaTTRtZ1RCWlRE?=
 =?utf-8?B?Q3lRMWhjN2FGSEswZUdIMUloU285dTBlT2dVZzVCZjVlVzlOclVtaGwzTHRX?=
 =?utf-8?B?ck9zZWIwQTFWWURLT2FML3B3SW9SNjBDaVZvd29sSGxGN3dCQitXWUlxSU0v?=
 =?utf-8?B?ZEFHVkc3U1QxUnZDd3dFcUltdE55elUyajh4NjlrYlMzVXBzMDA0Wi85SzBB?=
 =?utf-8?B?dml4U3pVQnE0dmtFOEowVDdCdytMNVBBcFFtdDBsWXpCRUJ3dDU0OHlTSHBu?=
 =?utf-8?B?aElTZ2NBMXpqb0k3K0l2dE1rZTQ2dVNXQWdJUFBtUmg4aC8vNnZQODN3WHE0?=
 =?utf-8?B?OGtoR0VkNkowUWJFR05SWmRUTk42VFlnYjVRRnkzTU82Q0c4T3E5QWJkVUln?=
 =?utf-8?B?MXdXT2t0V0NyMXdGdW9LTHdyWlRORldwdzRONDZoeEkzMy82elZROHNhd2Rj?=
 =?utf-8?B?RTBYNjgvZjRjQWJaR3daYTNvdXE2bFB3RVNrZ3hDckUweWljTHNCZ25jQ3RY?=
 =?utf-8?B?bVZrd0hFZ2kzRjdrRXZ6THcwMy9tU21DTThDaWkvV3ZBdm9RYzcySGJMVm42?=
 =?utf-8?B?Ym1kOVdqbXA0emNFOXBYRXAwbGw5aWkvZEJqYXo4cmFrZzlYQVE5N3VWSVA2?=
 =?utf-8?B?NXFScnkzMTUyWjlVOVJCVWV4bHY1Sk1IM2p3ajZBQlQrS245bjdGR3FBWm93?=
 =?utf-8?B?OUQvMi9YM0lhMUQwbGNzZ3MwSGNocHFkS0xNMEMraVNQMG9zbmNtU2pJWVFi?=
 =?utf-8?B?cWJ1MVBpbVcyblZzb2FQQVVrZkUyNWVKZURRdk1wVHc4QUxvZW1LL29SVlZE?=
 =?utf-8?B?Q0pscElWK2pZdGx3UVFYWmhacjRwcjFJSmpiVkJmeExNUThac3puVmZJdVdK?=
 =?utf-8?B?YlpRSVVxU1ZjbHh6eGxhWHA4OU9yNzlTcC9qdVB6SlN5NC9zWUxpQkcydE1x?=
 =?utf-8?B?OUpoUlExTFVYamx2OEtQMDdINGxPbWt1SFQ2ME8vRkdMelZMTUYzRUR0NEk4?=
 =?utf-8?B?SkZpWkVEUE00MHNVYWg2aUkybmtTcTh6VitwL3FPTkc3Y2l3MUlqQUw5Z1NN?=
 =?utf-8?B?ZkNXTHNsKzBjT2NlVlhiR1QxWFpob1djeXBZQUVScWpqd2JPc2dxYURsRU84?=
 =?utf-8?B?WHovNDNCVStiNVQ3dzBpVXBwTWlFbG5wc2M2cWRoVXZ1NUkwU253WGJDY0FD?=
 =?utf-8?B?U0FtR3RUamY1eTNicHBmSHErTlU5L3pGbzRPLzZTcEw3ZUJjYWkwbC9kd2tz?=
 =?utf-8?B?L1ZtQlF5bFlkVXRpa1ZHNEg4RUhsTHY0cVZaNzdTOFlCbHp4NCs1MmdXa2FY?=
 =?utf-8?B?aHNmMlJYVEw0bjJZTC9VU25pQnEydXNRZjJwZGhIMVBEcjU3djlseGN0eXcz?=
 =?utf-8?B?TWFkcVpna2h0VTFUYkUySHRKZFVXU0hoN3YwYW5xc1BmMTh4a0Ryc0w3c3Iy?=
 =?utf-8?B?VWpUaWhQeWNQaHo2TEpUY0hHUXdZVzFYd0txTFQ3bjl2dzJNYTZ0Z2RFTnNP?=
 =?utf-8?B?cGlyb2JKcGIzT1UxRkZHRjV5eU5wUFNDWCt3SndkcnlLSFJoWUZjYXBqWHBs?=
 =?utf-8?B?MzZuYmVUSVBOODl0d1RVWmpSaUpHMGNLYkdqamF4eWtpaE4wYU12ZXFVS0Uy?=
 =?utf-8?B?cEF2eExrK2ZVRVdiTUtRdFRaMk0zYjZLUXlIdHZWakpaTzN0aHpwQU9uOWlQ?=
 =?utf-8?B?UmxxK1p3cWJNdy9ORlRYOUt1OUY4bGdJNEdvM3hpcFZDMTlDcHlJekZ4bjVV?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91FC003A83324F4092BF1D2AE66B0766@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844a6eec-e6a0-4e53-ad91-08db41c6f858
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 17:45:02.8682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iYOTFeXofMlbxfaUGwJxWhQxEwpYaQgVrAwPofp8A5rNJCiVwlun/onhARGukMtSthkmnF3UDrvszShCrigfWDszcfW2bGsXQN76cNvhz38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/4] RFC: Add new device configuration
 infrastructure to
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA0LTIwIGF0IDEyOjMyICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gV2VkLCAxOSBBcHIgMjAyMywgU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVs
LmNvbT4gd3JvdGU6DQo+ID4gVGhpcyBpcyBhdHRlbXB0aW5nIHRvIHRha2UgdGhlIGJlc3QgcGFy
dHMgb2YgaTkxNSBtb2R1bGUgcGFyYW1ldGVycw0KPiA+IChtaW51cyB0aGUgYWN0dWFsIG1vZHVs
ZSBwYXJhbWV0ZXJzKSBhbmQgYWRkIHRvIHhlIHRvIGFsbG93IGZvcg0KPiA+IGJldHRlcg0KPiA+
IGRlYnVnZ2FiaWxpdHkgYW5kIGNvbmZpZ3VyYXRpb24gaW4gb3JkZXIgdG8gaGVscCBpc29sYXRl
IHByb2JsZW1zDQo+ID4gb24gYSBwZXItZGV2aWNlIGxldmVsIGluc3RlYWQgb2YgZ2xvYmFsIG1v
ZHVsZSBwYXJhbWV0ZXJzLg0KPiA+IA0KPiA+IE5vdGUgdGhhdCBJIGRpZCByZXZpZXcgYSBmZXcg
b3B0aW9ucyBoZXJlOiBjb25maWdmcyAobm90IGdlbmVyYWxseQ0KPiA+IHVzZWQgYnkgdGhlIGRy
bSBzdGFjayksIG1vZHVsZSBwYXJhbWV0ZXJzICh3ZSBoYXZlIHNvbWUgbmVnYXRpdmUNCj4gPiBo
aXN0b3J5IGhlcmUpLCBzeXNmcyAobm90IHRoZSByaWdodCBhcHByb2FjaCBnaXZlbiB0aGUgZm9j
dXMgb24NCj4gPiB1c2VyIGludGVyZmFjZSBoZXJlKS4gRGVidWdmcyBpcyB1c2VkIGluIHZhcmlv
dXMgZHJtIGRyaXZlcnMgdG8NCj4gPiBjb25maWd1cmUgdmFyaW91cyBkZXZpY2UgY2hhcmFjdGVy
aXN0aWNzLiBUaGUgaW5mcmFzdHJ1Y3R1cmUgYmVpbmcNCj4gPiBwcmVzZW50ZWQgaGVyZSBoYXMg
YXQgYSBoaWdoIGxldmVsIGJlZW4gcHJlc2VudCBpbiB0aGUgaTkxNSBkcml2ZXINCj4gPiBmb3Ig
c29tZSB5ZWFycyBub3csIHNvIHByb3ZpZGVzIGEgZ29vZCBzdGFydGluZyBwb2ludCBmb3IgcXVp
Y2sNCj4gPiBkZWJ1ZyBhZGRpdGlvbnMgd2l0aG91dCBleHBvc2luZyB1c2VycyB0byBzb21lIG9m
IHRoZSBjaGFsbGVuZ2VzDQo+ID4gZmFjZWQgd2l0aCBtb2R1bGUgcGFyYW1ldGVycyBpbiB0aGUg
cGFzdC4NCj4gDQo+IExvb2tpbmcgaW50byBjb25maWdmcyBoYXMgYmVlbiBvbiBteSB0b2RvIGxp
c3QgZm9yIGEgbG9uZyB0aW1lLiBJdCdzDQo+IHNvbWV0aGluZyB0aGF0IG9mdGVuIGdldHMgcmVj
b21tZW5kZWQgYXMgYSByZXBsYWNlbWVudCB0byBtb2R1bGUNCj4gcGFyYW1ldGVycywgYnV0IHRo
ZSBkb2N1bWVudGF0aW9uIGFzIHdlbGwgYXMgdGhlIGV4aXN0aW5nIGV4YW1wbGVzIGluDQo+IHRo
ZSBrZXJuZWwgYXJlLCBJIHRoaW5rLCBsZXNzIHRoYW4gc3RlbGxhci4gQmFzaWNhbGx5IHdvdWxk
IHJlcXVpcmUNCj4gaW1wbGVtZW50aW5nIGl0IGFuZCBzZWVpbmcgaG93IGl0IGFjdHVhbGx5IHdv
cmtzLg0KDQpSZWFsbHkgYXBwcmVjaWF0ZSB0aGF0IHBlcnNwZWN0aXZlISBZZXMgSSB1bmRlcnN0
YW5kLiBMZXQgbWUgdGFrZSBhDQpjbG9zZXIgbG9vayBoZXJlIGFuZCBzZWUgd2hhdCBtaWdodCBt
YWtlIHRoZSBtb3N0IHNlbnNlLg0KDQo+IA0KPiBJbiBhbnkgY2FzZSwgSSBkb24ndCB0aGluayBp
dCBzaG91bGQgYmUgZGlzbWlzc2VkIHdpdGgganVzdCAibm90DQo+IGdlbmVyYWxseSB1c2VkIGJ5
IHRoZSBkcm0gc3RhY2siLiBBIGRlY2VudCBpbXBsZW1lbnRhdGlvbiBjb3VsZCBzZXQNCj4gdGhl
DQo+IGV4YW1wbGUgZ29pbmcgZm9yd2FyZC4NCj4gDQo+IFRoZSBtYWluIHByb2JsZW0gd2l0aCBk
ZWJ1Z2ZzIGlzIHRoZSBpbmFiaWxpdHkgdG8gc2V0IHRoZSBkZWZhdWx0DQo+IHZhbHVlcw0KPiBw
cmlvciB0byBwcm9iaW5nIHRoZSBkZXZpY2UuIFRoaXMgaXMgd2hlcmUgbW9kdWxlIHBhcmFtZXRl
cnMgYXJlDQo+IGhhbmR5LA0KPiBidXQgdGhleSBhcmVuJ3QgZGV2aWNlIHNwZWNpZmljIChhbmQs
IGFzIHlvdSBub3RlLCBnZW5lcmFsbHkNCj4gZGlzY291cmFnZWQpLg0KPiANCj4gTG9va2luZyBh
dCB0aGUgcGF0Y2hlcywgSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aGF0IHRoZSBwcm9jZWR1
cmUNCj4gZm9yDQo+IHNldHRpbmcgdGhlIGRlYnVnZnMgdmFsdWVzIGJlZm9yZSBwcm9iaW5nIHRo
ZSBkZXZpY2Ugd291bGQgYmUuIENhbg0KPiB5b3UNCj4gcHJvdmlkZSBhbiBleGFtcGxlIHNlcXVl
bmNlIG9uIHRoZSBjb21tYW5kLWxpbmUgcGxlYXNlPw0KDQpXZWxsIGl0IGRvZXNuJ3Qgc2VlbSB0
byBiZSB3b3JraW5nIGZvciBtZSBoZXJlLi4uIHNvIGZvciBub3cgbGV0J3MgaG9sZA0Kb24gdGhp
cy4gSSdsbCBkaWcgZGVlcGVyIGFuZCBwb3N0IGFuIHVwZGF0ZSB3aXRoIGV4YW1wbGVzLg0KDQpU
aGFua3MsDQpTdHVhcnQNCg0KPiANCj4gDQo+IEJSLA0KPiBKYW5pLg0KPiANCj4gPiBTdHVhcnQg
U3VtbWVycyAoNCk6DQo+ID4gICBkcm0veGU6IFJlZmFjdG9yIGVhcmx5IGRldmljZSBpbml0DQo+
ID4gICBkcm0veGU6IFJlZmFjdG9yIGRlYnVnZnMgaW50byBhbiBlYXJseSBhbmQgbGF0ZSBwYXJ0
DQo+ID4gICBkcm0veGU6IEFkZCBuZXcgZGV2aWNlIGNvbmZpZ3VyYXRpb24gZGVidWdmcyBpbmZy
YXN0cnVjdHVyZQ0KPiA+ICAgZHJtL3hlOiBNaWdyYXRlIG1vZHVsZSBwYXJhbWV0ZXJzIHRvIG5l
dyBkZWJ1Z2ZzIHN0cnVjdHVyZQ0KPiA+IA0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZp
bGUgICAgICAgICAgICB8ICAgMSArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2Zz
LmMgICAgICAgIHwgIDE0ICstDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmgg
ICAgICAgIHwgICAxICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnNfcGFyYW1z
LmMgfCAyMzUNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZWJ1Z2ZzX3BhcmFtcy5oIHwgIDE0ICsrDQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZpY2UuYyAgICAgICAgIHwgIDIzICsrLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGV2aWNlLmggICAgICAgICB8ICAgNCArLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlX3R5cGVzLmggICB8ICAgNCArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
aXNwbGF5LmMgICAgICAgIHwgICAzICstDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
bG9nLmMgICAgICAgIHwgICAyICstDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMg
ICAgICAgICAgIHwgICA0ICstDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9tb2R1bGUuYyAg
ICAgICAgIHwgIDE2IC0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9tb2R1bGUuaCAgICAg
ICAgIHwgICA1IC0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhcmFtcy5jICAgICAgICAg
fCAxMTggKysrKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGFyYW1zLmgg
ICAgICAgICB8ICA0MyArKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMgICAg
ICAgICAgICB8ICAxNCArLQ0KPiA+ICAxNiBmaWxlcyBjaGFuZ2VkLCA0NjEgaW5zZXJ0aW9ucygr
KSwgNDAgZGVsZXRpb25zKC0pDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZGVidWdmc19wYXJhbXMuYw0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RlYnVnZnNfcGFyYW1zLmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYXJhbXMuYw0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhcmFtcy5oDQo=
