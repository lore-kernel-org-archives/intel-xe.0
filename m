Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CF0C47DDC
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 15:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8B010E1BB;
	Wed, 24 Jan 2024 15:17:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3584110E1BB
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 15:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706109443; x=1737645443;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZLyW9XYRiSRoZk+8Dgnj8pDmiE2or1b9YFVZsGYgD98=;
 b=fl1kPddMZ0jAPxVpYfVqf3ReimpNczH2VyDnQxEv7LTux+PXinliz/U8
 UMLGToO1+PKye47udpoxQEq/fCpUlClwI1p/F9MiB57S/8Ip8oTUUvVFo
 KY7Q2oOsMHdmQohEfpdmzLb8KLYfAnhfO/xGfJ6qSOWAgNVKkHLWGqRn7
 noWxmPmlDFj9numlKJlv4ubNNJKYeZV8I7q/D8BQvO5DuByTaVcGciz/z
 MidzHAKgnV4SGZA8M4itlP/Gtj/7xKU/ZdlSIv/3f4xLcZbzYF6oe4K34
 uqtnvuIa0plvWqVAqIElLIpYfqXry25R0Qfr3ZKAP0aahCpnII0WlRkwv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1744530"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1744530"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 07:17:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="28137850"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 07:17:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 07:17:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 07:17:21 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 07:17:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGoRgQgBfeTCDsRNG1lQTzIyooZkky9+1jjZ4MbbwjHPloPgnN9GrWWIwH2BzUmYvcXn1tAxMQxHeahwkaFrnmK/ds7tvujb/+Vz1AP6c1VBYbjKVN6dnC5dVVwEt92a+iPsi188svjQQCj1IWvxIRy2pdPgo0wjQqvfH5rYprEi7IKP4IhBCX+potXoUDE5ZH2Fsw3yIPh0DvPb/jUakGdImUUDz2WkO2W5WwSNji+c1B+W36OaTLLSVf/UKrqgrUxIfpi6j0jOgoGJhq+HpO39pRB4M4Cq9DIPRtup5oEaBqeb3CjAaXzz7C2JIuYRWsvVv7CL2ePbFLmEh4TCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLyW9XYRiSRoZk+8Dgnj8pDmiE2or1b9YFVZsGYgD98=;
 b=b1mOrrpNc4rSpeD/ITMdo0IRMfdewEGioXphRCwKrnK6arK92kWyWaid0JuNFpb76Uvi5GcaR4OkGY9jl0e7qfgg4eSgqKdIuLivhKXq1XqnwhRu+W/5o+X8zY8jM5rO2JRe8//XEZ7HwOhtV3YpsJfw7mRfAlNzmuKcgq3rYRw81qwBlO6qKuIUNCNpzCRR+tTUtfc+L4QgY1OM4bNiThYJcXYSlvFck0Y7C5miDMXs4cL4ZyaldEbj+hSi7jJIcRdAsrR0PA8RJrnVBdpto/Q9OEq+ZTly7d+BarrcWEXFwADogxLyfuo0+DJiCcJ5flLmak/BA8zK+EFJo24Xmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM3PR11MB8671.namprd11.prod.outlook.com (2603:10b6:0:42::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.34; Wed, 24 Jan 2024 15:17:19 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f%7]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 15:17:18 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>
Subject: Re: [PATCH 1/9] drm/xe: Remove double new line in devcoredump
Thread-Topic: [PATCH 1/9] drm/xe: Remove double new line in devcoredump
Thread-Index: AQHaTVUzn8eR5aHqS0Gw+TXQ9At1RbDmJvoAgAADOwCAABwbAIACz9qA
Date: Wed, 24 Jan 2024 15:17:18 +0000
Message-ID: <3998188deb6ab091dadb548991e9c4a04d311bcc.camel@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <f787dab50690396e0cf1159da66321a85069009c.camel@intel.com>
 <1fa902956e2dcd9092934f7587fd1f4fa3e5bd81.camel@intel.com>
 <Za7OInHbWLmJZcu6@intel.com>
In-Reply-To: <Za7OInHbWLmJZcu6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM3PR11MB8671:EE_
x-ms-office365-filtering-correlation-id: fe7ec162-f1d3-4016-9ad7-08dc1cef8df3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CsL53m9pBMB3qJNrMe5IpfZd2XD1iz4Yy4rE0NXkGsjGyA65b4mp/0jNH1PQ9gvwFlua8Dqod6LUn3gzxJsPyl9/VClQWwawlOpRMFRXopAawUz7wztOOVnNcQtu0ktvYpBu4Z+ejXXbmZrIvM9JMAfnM/P1r9S82rZCBNcrql/uPZk1TXjEsjR943e6sep6zB3nrVKFSMn3g50CWCf5o9mn9eQ9w5wnhMIshE1Y9ofQu4uwVClR5N4KEVe6OuSogg7R3Z0gjscRgGPEYoZeC3MF5UUn49i1u3LJqSjfQF1ddsGQcUx7QaHRERjjKVfalHAE2OSVyhagHKoEn68evCAcihdBzZreBeycC9eqpnFyUKP9Za4UyI9rlqAc1ZInKpbtvNpzKYrzqz16SdT9anddA74U0dMffC5L5DZ8iTYbMNs1WOHZln4/l8C7umEnrG1YDoDjNtOR32UOJOUR8qfH8+T1OYuTtKiO57nr7QEamjK8qjAgk99H8gEEf3OiaufjikoAbxJxyKxGDvWc3csnNH26TsKefk+Uj9+16Sj26ro+POr8cMJa3/kYRp325D49Ee/uH7tEJFrRPAxYDz83RoyDJH6eq9GOOseHvnKlA0dA4osGFMAX9ZYNTt1k
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39850400004)(366004)(136003)(376002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38070700009)(83380400001)(91956017)(36756003)(41300700001)(86362001)(82960400001)(122000001)(38100700002)(6512007)(2616005)(66946007)(26005)(5660300002)(4326008)(6506007)(316002)(8936002)(478600001)(76116006)(6636002)(2906002)(66556008)(6486002)(64756008)(66446008)(110136005)(66476007)(54906003)(71200400001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3dOS2Q0VmdHUUQ2Ym1OL2xCdHBmZXFpckdOTDdQc3VzVUpaOGwzVWlMZkYz?=
 =?utf-8?B?WFdlOEpkQUcrVGhCc2sxanZpRW9lYzM3WHpSUFFDdDcrWS90TDcwaFRVblpq?=
 =?utf-8?B?MUV3V1VEUWNzU1BDSGNSOGhDZW0yc0FtWHBQL2NQdHd6K05Gd21wMXkwdmp6?=
 =?utf-8?B?Y1NXd1VlbmphREUvcVFZNFYrOEcza3VoVHE2VzdpeVBOWnJLaXJ3cm1kbGNR?=
 =?utf-8?B?K2w5aWIvekVSSEtPVzhxUTNkWHR3SjVCZkZWdjlaZWltaHVLZ2VEVjNBOS9z?=
 =?utf-8?B?YzhzMVBCSmE5NnVBbFhJY2xVWjhIeEQ5U0NrWDhCb1lodG5JQnV5Uks3a2xT?=
 =?utf-8?B?ZnNGTTI2VkNpSGhBSXBnOENqWE4yUnpPMVhTSzdxUkk5NEpiWjlzV1BpR3JN?=
 =?utf-8?B?Y2ZOK05uMU1XcG9GcWE0MFM2RmxRcmdPZlhRT0d0bzRPcDNxdmpQK2g3MStK?=
 =?utf-8?B?cGZScEFrWnlrRDNkZHpNRGdFS2VYUkp1NVVjaFgxbnZCcVIrbXNSWW9YK0VJ?=
 =?utf-8?B?TTc5cTcvbHdBTFB1ckMwdTEvTmxSUFhBZTFkZ1FGdHV0VDlEUzE3Z3NpRGNW?=
 =?utf-8?B?bEx3SGdKWlJncldNcmtudHdLQWE1bUlYK01JaWxrZmM5eUFaZnNKejcrZmlq?=
 =?utf-8?B?YnhtMTdHdTI3ZHhqaWpFSUdrcjNEN3haMkNkQUFFemdxaktHb2JhOU5rOWtJ?=
 =?utf-8?B?cHMxejZPYUNKZWtKRUxNM250ZDFENkUzZytTcDJJcU90emxvc1lDUWxxN2M5?=
 =?utf-8?B?enNUVjRXdGpvaHZPd2hHVjg4a3E0aFNsaGk2Z0JVc2NuSkhMNnR5a01jYW1z?=
 =?utf-8?B?UlRKeVdBMU1jTEFrd1NHbGlKVlQ0OUdzOHA3QUc1QnB3Mm1CNU5YcDJyRFdk?=
 =?utf-8?B?YTE5M1lEYUt6M3pWdlJIK1gyVHlURk9XV0lBUkhSN2NsT2hpckNMSmtldjdP?=
 =?utf-8?B?ekljeTZLbkR5Yk9GdWNCU1htU0ZKTkpwT3l2NVMxYzNnWGF0anBMeVE0aW5T?=
 =?utf-8?B?ZFk3RE9CTU1oM2laRnllaWxZeUd1V3NGZ05mUWFhZFRzWjVyZUZSU0pObkox?=
 =?utf-8?B?YVFSVGY1QWpNZlBDd09md3BPYWZWVWo0b1Bib013ZFhpcUxVMTVNeTh3VWZ6?=
 =?utf-8?B?KzBvOWxKcmEzZnVKbW5uazhKSXVWYTkxOVl0L3pFeDQ1dENMcWFXcHVFUURQ?=
 =?utf-8?B?eEd3UE1wd1V0a2FsYmJaMWx4dkVQV2tOVFFqTVZVMWR2R2h0MGdPOXpjRWpL?=
 =?utf-8?B?OVJ2bm9xVVk3cWxHaDR1cEJhd2pDTWZ2Y0QyZGlzem9WSUhTd2lPYVE2TUlZ?=
 =?utf-8?B?U3ZXRTN0WUpHT29jNTFJY0hDOHZzTkM3cFlwYjFQMUJ5S0xydUU5NEZRQXBO?=
 =?utf-8?B?a2l4cXpMM21LS2QzbExwSUc3dHd2cU9WSDNHSTVQZGRoakNyRVZkOVhFeE5U?=
 =?utf-8?B?MzZwcVUxelFZMUpjNFRCY2JCT3FuV2RkUXJUckxQeTA4OUdGNWJEeTlnMlRi?=
 =?utf-8?B?VGZ4SGJNNVd0cmRiS2RtTUVyMjFLMXBiUExGYlUzMzV4Ym5nYytQS2NyUG1G?=
 =?utf-8?B?ajhqQXR6TDBIV2s0MmtHWVdtazIzU1gxVmJSRWdMZmpwR3I4b0FaN1ZlRTZL?=
 =?utf-8?B?V1QyZ3VmU1VDNTVJeW1FTUtGVWZaS3lCNzkwVWhHdml2WmdEcCsrV2xqb1Uz?=
 =?utf-8?B?bittZWhBS2s3SktpQ3ZZdHoxRFgxVTAzTzBuMnNRK2J0WHJuZC95Wm1ZNnNl?=
 =?utf-8?B?WEVuL3RpanVmOTBzR0oxcVdWMXE2bE9LbEFmRFpNdUJpdGY0SjF3TDV0aXI4?=
 =?utf-8?B?MTRVNGxoS2hyS0hSOWdVM3RyWXJvWnpza1pNMjBxQ1R1L2o1UEhxUkhqSUpl?=
 =?utf-8?B?cWh3dThmYy9rQ2lPL0VKYmpMK21JMUNsQ2VCWnd6WXlVbE5SK2ZzdldVY1VI?=
 =?utf-8?B?STFmUnhVTnZCYnNkLzhKK3lDS3Z0V1dMOXpFZDVhb0hGd0Z6K0VkQWQvY1dI?=
 =?utf-8?B?K0VmQ2dsVnNMZmhyTXFuWG85MlhUai9EY2pYUjA5bndLQzJqa3QxU0pmTnUx?=
 =?utf-8?B?eGU0Z09jV1BSbDF1RFkvTk5oZkY1OHRjV3c1Q2RNYXdGNGpSd0VFUkY1TkY5?=
 =?utf-8?B?bHRkdy9wWWJXMTdIYmdRblJyaGcxUkdWN2kvYXdpdlFhd1ozQXgyRFJ3RVBx?=
 =?utf-8?B?aWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <080E47F6BCFD4348A554908E38759310@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7ec162-f1d3-4016-9ad7-08dc1cef8df3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 15:17:18.3207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kvwEcYL227ya2SJacpttzsBxvt+wSoj1FzXdZsbMfqavSC7Y43qa2THwxeYGklgqLMYx9KqyTddtrlwChiF1wMNJ4c7pS1Focuz3Pc089Bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8671
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDI0LTAxLTIyIGF0IDE1OjIwIC0wNTAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6Cj4g
T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMDY6NDA6MTRQTSArMDAwMCwgU291emEsIEpvc2Ugd3Jv
dGU6Cj4gPiBPbiBNb24sIDIwMjQtMDEtMjIgYXQgMTg6MjggKzAwMDAsIFN1bW1lcnMsIFN0dWFy
dCB3cm90ZToKPiA+ID4gT24gTW9uLCAyMDI0LTAxLTIyIGF0IDA5OjA0IC0wODAwLCBKb3PDqSBS
b2JlcnRvIGRlIFNvdXphIHdyb3RlOgo+ID4gPiA+IFJpZ2h0IG5vdyBkZXZjb3JlZHVtcCBoYXMg
YSBuZXcgbGluZSBiZXR3ZWVuICcqKioqIEd1QyBDVCAqKioqJwo+ID4gPiA+IGFuZAo+ID4gPiA+
ICdIMkcgQ1RCIChhbGwgc2l6ZXMgaW4gRFcpOicgd2hpbGUgb3RoZXIgc2VjdGlvbnMgZG9uJ3Qg
aGF2ZS4KPiA+ID4gPiAKPiA+ID4gPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50
ZWwuY29tPgo+ID4gPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8ZGV2QGxhbmtob3JzdC5zZT4K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXph
QGludGVsLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfY3QuYyB8IDQgKystLQo+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19jdC5jCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X2N0LmMKPiA+ID4gPiBpbmRleCBlZTVkOTk0NTZhZWJjLi4wYzA3MzU1NjkwOTQ4IDEwMDY0NAo+
ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYwo+ID4gPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYwo+ID4gPiA+IEBAIC0xMzY2LDcgKzEzNjYs
NyBAQCB2b2lkIHhlX2d1Y19jdF9zbmFwc2hvdF9wcmludChzdHJ1Y3QKPiA+ID4gPiB4ZV9ndWNf
Y3Rfc25hcHNob3QgKnNuYXBzaG90LAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuOwo+ID4gPiA+IMKgCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChzbmFw
c2hvdC0+Y3RfZW5hYmxlZCkgewo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBkcm1fcHV0cyhwLCAiXG5IMkcgQ1RCIChhbGwgc2l6ZXMgaW4gRFcpOlxuIik7Cj4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9wdXRzKHAsICJIMkcgQ1RCIChhbGwg
c2l6ZXMgaW4gRFcpOlxuIik7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBndWNfY3RiX3NuYXBzaG90X3ByaW50KCZzbmFwc2hvdC0+aDJnLCBwKTsKPiA+ID4gPiDCoAo+
ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX3B1dHMocCwgIlxuRzJI
IENUQiAoYWxsIHNpemVzIGluIERXKTpcbiIpOwo+ID4gPiAKPiA+ID4gV2h5IG5vdCBoZXJlIHRv
bz8KPiA+ID4gCj4gPiA+IEFsc28ganVzdCB2aXN1YWxseSBJTU8gaXQgaXMgbmljZSB0byBoYXZl
IHRoZSBleHRyYSBzcGFjaW5nIGhlcmUuCj4gPiA+IEkKPiA+ID4gZG9uJ3QgaGF2ZSBhIHN0cm9u
ZyBvcGluaW9uIHRob3VnaC4KPiA+IAo+ID4gVGhpcyBzZWN0aW9ucyBvdXRwdXRzIGxpa2UgYmVs
b3cgd2hhdCBsb29rcyBmaW5lIHRvIG1lOgo+ID4gCj4gPiAqKioqIEd1QyBDVCAqKioqCj4gPiBI
MkcgQ1RCIChhbGwgc2l6ZXMgaW4gRFcpOgo+ID4gwqDCoMKgwqDCoMKgwqDCoHNpemU6IDEwMjQK
PiA+IMKgwqDCoMKgwqDCoMKgwqByZXN2X3NwYWNlOiAwCj4gPiDCoMKgwqDCoMKgwqDCoMKgaGVh
ZDogMAo+ID4gwqDCoMKgwqDCoMKgwqDCoHRhaWw6IDQyNAo+ID4gwqDCoMKgwqDCoMKgwqDCoHNw
YWNlOiA1OTkKPiA+IMKgwqDCoMKgwqDCoMKgwqBicm9rZW46IDAKPiA+IMKgwqDCoMKgwqDCoMKg
wqBoZWFkIChtZW1vcnkpOiA0MjQKPiA+IMKgwqDCoMKgwqDCoMKgwqB0YWlsIChtZW1vcnkpOiA0
MjQKPiA+IMKgwqDCoMKgwqDCoMKgwqBzdGF0dXMgKG1lbW9yeSk6IDB4MAo+ID4gCj4gPiBHMkgg
Q1RCIChhbGwgc2l6ZXMgaW4gRFcpOgo+ID4gwqDCoMKgwqDCoMKgwqDCoHNpemU6IDQwOTYKPiA+
IMKgwqDCoMKgwqDCoMKgwqByZXN2X3NwYWNlOiAxMDI0Cj4gPiDCoMKgwqDCoMKgwqDCoMKgaGVh
ZDogMTM3Cj4gPiDCoMKgwqDCoMKgwqDCoMKgdGFpbDogMAo+ID4gwqDCoMKgwqDCoMKgwqDCoHNw
YWNlOiAzMDcxCj4gPiDCoMKgwqDCoMKgwqDCoMKgYnJva2VuOiAwCj4gPiDCoMKgwqDCoMKgwqDC
oMKgaGVhZCAobWVtb3J5KTogMTM3Cj4gPiDCoMKgwqDCoMKgwqDCoMKgdGFpbCAobWVtb3J5KTog
MTM3Cj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RhdHVzIChtZW1vcnkpOiAweDAKPiA+IMKgwqDCoMKg
wqDCoMKgwqBnMmggb3V0c3RhbmRpbmc6IDAKPiA+IAo+ID4gR3VDIElEOiAyCj4gPiDCoMKgwqDC
oMKgwqDCoMKgTmFtZTogcmNzMgo+ID4gwqDCoMKgwqDCoMKgwqDCoENsYXNzOiAwCj4gPiDCoMKg
wqDCoMKgwqDCoMKgTG9naWNhbCBtYXNrOiAweDEKPiA+IMKgwqDCoMKgwqDCoMKgwqBXaWR0aDog
MQo+ID4gwqDCoMKgwqDCoMKgwqDCoFJlZjogMgo+ID4gwqDCoMKgwqDCoMKgwqDCoFRpbWVvdXQ6
IDUwMDAgKG1zKQo+ID4gwqDCoMKgwqDCoMKgwqDCoFRpbWVzbGljZTogMTAwMCAodXMpCj4gPiDC
oMKgwqDCoMKgwqDCoMKgUHJlZW1wdCB0aW1lb3V0OiA2NDAwMDAgKHVzKQo+ID4gwqDCoMKgwqDC
oMKgwqDCoEhXIENvbnRleHQgRGVzYzogMHgwMDQzNTAwMAo+ID4gwqDCoMKgwqDCoMKgwqDCoExS
QyBIZWFkOiAobWVtb3J5KSA0MTYKPiA+IMKgwqDCoMKgwqDCoMKgwqBMUkMgVGFpbDogKGludGVy
bmFsKSA1NTIsIChtZW1vcnkpIDU1Mgo+ID4gwqDCoMKgwqDCoMKgwqDCoFN0YXJ0IHNlcW5vOiAo
bWVtb3J5KSAtMTI0Cj4gPiDCoMKgwqDCoMKgwqDCoMKgU2Vxbm86IChtZW1vcnkpIC0xMjUKPiA+
IMKgwqDCoMKgwqDCoMKgwqBTY2hlZHVsZSBTdGF0ZTogMHgzCj4gPiDCoMKgwqDCoMKgwqDCoMKg
RmxhZ3M6IDB4OAo+IAo+IG1ha2VzIHNlbnNlIHRvIG1lIGFzIHdlbGwuIEJ1dCB3aXRob3V0IHRo
ZSBleHRyYSBsaW5lIGl0IHdvdWxkCj4gYWxzbyB3b3JrIEkgZ3Vlc3MuCj4gdXAgdG8geW91Ogo+
IAoKWWVhaCBubyByZWFsIHByb2JsZW0gaGVyZSBlaXRoZXI6ClJldmlld2VkLWJ5OiBTdHVhcnQg
U3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoKPiBSZXZpZXdlZC1ieTogUm9kcmln
byBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgo+IAo+IAo+ID4gCj4gPiA+IAo+ID4gPiBU
aGFua3MsCj4gPiA+IFN0dWFydAo+ID4gPiAKPiA+ID4gPiBAQCAtMTM3NSw3ICsxMzc1LDcgQEAg
dm9pZCB4ZV9ndWNfY3Rfc25hcHNob3RfcHJpbnQoc3RydWN0Cj4gPiA+ID4geGVfZ3VjX2N0X3Nu
YXBzaG90ICpzbmFwc2hvdCwKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGRybV9wcmludGYocCwgIlx0ZzJoIG91dHN0YW5kaW5nOiAlZFxuIiwKPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNuYXBzaG90LT5n
Mmhfb3V0c3RhbmRpbmcpOwo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqB9IGVsc2Ugewo+ID4gPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fcHV0cyhwLCAiXG5DVCBkaXNhYmxl
ZFxuIik7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9wdXRzKHAs
ICJDVCBkaXNhYmxlZFxuIik7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoH0KPiA+ID4gPiDCoH0K
PiA+ID4gPiDCoAo+ID4gPiAKPiA+IAoK
