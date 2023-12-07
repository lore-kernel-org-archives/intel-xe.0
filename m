Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D769C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 12:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047AE10E02D;
	Thu,  7 Dec 2023 12:38:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A385010E02D
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 12:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701952723; x=1733488723;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7s3F//9Q0wYXmgCow8F5srEjJ974kLquWhndKMXNDzQ=;
 b=iZrq9QZK03ljyZjz70urNO55XtMRJVkSorPSGf3EfYTAATIT1Rx9ZiE6
 aPJ7466zA2ScU33jTTGE4GC89aGAkWUH6vsI+b5tdugp1snxsAkPrKRtq
 0AWUNj9qwzY8IEQ5xPZgvQVMQTgyZZTh9DllAMOnZuSQNCNMgM4x16s4R
 qI2URjbG8PGYhJaqPYR/677PHsHni7HvoO+MizQJOiIzWrAuWW6aDUxdB
 M+mpXDZ1Gmz5zx6GqlT2egZa/Z3589LhFhIaqQdtlCeYjbb0kDcJ0ZQ7d
 XR5XBkBGESmTL+Yrflzo/xSVt9mxJQvyhHI3TFMFk3hkywdwOVGTjbVvH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="460712035"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="460712035"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:38:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1018936196"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="1018936196"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 04:38:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 04:38:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 04:38:40 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 04:38:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCiOTdeg+g6or0lNq/W371rEVxYtHc+Jn1Ba+eU43W0HH/ctDWdCF0Hqy0vyKYlm2BS2PF3DCCCLZx2titsv991LCL2it1nu1O/wty3kidNQGgKa/pbI39t301OabmriA6DsNLVblfuHMbM6xiMkwe8N7v3mQ7dY1ACWPNb/vZBjuliLSoDtcyeF5y1tPBQI8AKe6Uq6QqIVgs18sJPw1izPfUyYmHzZcem9QmDhwT1N7pKi6bzY8gOJGjAXApZ8yhxhxj/Q0DMXidXfScc8xf8FNztdFtIDquV0x1JqIGU2Mo0jwOniiJnlgI/ih73LVuIIa5UWs2FSwXkEGbtDGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7s3F//9Q0wYXmgCow8F5srEjJ974kLquWhndKMXNDzQ=;
 b=kif0Fb+q1D1fej/V/nnkFkOVe1D6MjDjaDKBUelQZMKOqQoQgY21BdWAtoHVon0qPQ2ALVwaslikIqWoPW8ssXhQzr9rPfVBCArDBrX8Bvuu0skWiQMuQFzBzjcKN1t8ThC0OUf7l8bCSpp3f2uafsEO8wIVWQpz1G4qMUu2QvBHUfcu8GDF1KRkvNHTOJnAfTeJSF9oH7N0LxdkKkrdWN/l8d8L2C83E9eMTgw7Z2hAZDFdsvAc5aIlvWgjlaWxCCAkuVF0slXQvR2vwlILloXMr+KqDiassRx87AVHFs6zNyx2ejkvOxexcKb2PCu41xGdWuZO8uj1Hrew2NNYPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CH3PR11MB7893.namprd11.prod.outlook.com (2603:10b6:610:12e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 12:38:38 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef%7]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 12:38:38 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under tile
Thread-Topic: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under tile
Thread-Index: AQHaJ/1lvSh0mtb24EupUiCAkv4727CcJcKAgAAEAACAAAGMAIABHD8AgAAC/4CAAAyWAIAACN+AgAAN5ACAABClEIAAGIMAgAAtEPA=
Date: Thu, 7 Dec 2023 12:38:38 +0000
Message-ID: <SJ1PR11MB62041B69D357D2DE12DF07F5818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
 <20231206044735.966213-2-sujaritha.sundaresan@intel.com>
 <CY5PR11MB62113FC5A386520506F9912C9584A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <d9e06457-ec98-46b4-9235-8e9b3b71ffa0@intel.com>
 <7b70c647-6fb6-46ed-98e0-8e898625b5a3@intel.com>
 <SJ1PR11MB62049D5B2C629111948A668E818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <65cbe85b-30a2-470c-974f-ba811ec38b52@intel.com>
 <a4be4be8-700e-44b4-b0af-1d847774054a@intel.com>
 <d6d0fd1e-3c13-4992-8969-ea6533b7128a@intel.com>
 <38a32c29-fd64-4770-82cd-6e3660d14191@intel.com>
 <SJ1PR11MB62046759B76BE89DA0672809818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <e1516fa5-951f-430a-8f7c-4ffb911c050e@intel.com>
In-Reply-To: <e1516fa5-951f-430a-8f7c-4ffb911c050e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CH3PR11MB7893:EE_
x-ms-office365-filtering-correlation-id: 020d8bcb-d387-4390-ad5f-08dbf7216ffb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PiS7qqexjktGyN46g4eGvvlvrlQiXwTAjL/spAkBpOf9tI49qdsU9Wr3ekZpvGIPNT/yzbMLpI3oOOSYSuAkCr2FhrSmfaPRTF13DUR4BihTLgi7E91USzvufiemdvf+2I6aaJFXfigSKvtRvASEIqxquJdeg0zDpDb334Rz4X6VtApYS8O4AXYiTUyb9NHzfBzFOe8QKD6nQMVlkYIY9uROFHEBKSpNQvmSK6CNQ/o/XIpIKMR+sQfdZxVZW7+UxJeNzdeQus5xteT1mBRojIPN9+NwX3WJIND2qeBaqzUPtQkaY9XP9e7zWNSxQdHvukfDgBLudsUwPAc5QTnNqUXqnX/rx7QGbVRWCI796jwC0HC8jpWyDblAaMNklwoSSXjZEF34kGwQGMp4+1UwD6PklNMX3cHgzQb4tzDE/T2wqS5PfXLC1ORfYfDXARkngtZyjCuk75LQNpMInFZrpylgVofFqwvUzDqQVqGexkJ/HWRdzi5Y4+wsfKYsTC53B3squHdMeDCyIGlxraexjPYXZIA0F2H8WhxxK9rAcTp6Sov52KvkZJGkkP3MZb9f/c+mXt4ZxG4g/9YQyg9wMnoyARxqmy8z8b8JTkjwMPM6jcRiFYjjYu7gtQE/K20ErhRBguwzIujGYI2SHiod01Z8yHIYeaJ9AL+aId+8eCI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(396003)(366004)(39860400002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(451199024)(1800799012)(186009)(7696005)(83380400001)(107886003)(71200400001)(9686003)(6506007)(53546011)(26005)(38070700009)(316002)(110136005)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(5660300002)(33656002)(2906002)(8676002)(86362001)(8936002)(4326008)(122000001)(52536014)(41300700001)(38100700002)(82960400001)(478600001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGNvT3p4SFlnR0xWeWw3U250cXNrWlVqVm81OUgxTEVqYzU4QllmbjhyblFz?=
 =?utf-8?B?ZVBFYkpybmVuSzQyQkdpcTN5ZzVkUHdHQjlQelg1eEg0MmJjcjltQVkzb1BK?=
 =?utf-8?B?d2NtZWdzTzU2QzdyeWlYNVV1WHp0OWdCN2N3TU9BKzZSWWxsZGpCT2NSYmRn?=
 =?utf-8?B?MVU0SDFLNkNHVWZFMWxYWGl3MnNqK1FVQ1hqQ1dXbGg3Z0J3WlhFRisyV09F?=
 =?utf-8?B?WTZVZVBXbkd6OVFiVlM1RjUxY05PSGdWL0hvc1hSMjRPMnRZQnpoSzcwU3ZB?=
 =?utf-8?B?dWRMZkNSKzJKY01DS0ZtMVh5VUNDV2JoeGkrYVBmeVh3N1E5UUFpZzhjaS9K?=
 =?utf-8?B?SFRNUmEvc25xY0wwdzMyMU9NMFU4QXlHTFc3K3NlUTQ4enhaNVV6TDhwZEJ3?=
 =?utf-8?B?MTFqdjc5b0Z6VUl1bnZFN2VDSmpaUXA5TFZEZktsWmNTN1hIMkRWZ2k3cUpk?=
 =?utf-8?B?cGI5OHppWUt4amVHRkdrWmJRa1RWOVlZTUJlM1ZXYm1nQ0JGaWlLdllqTkds?=
 =?utf-8?B?ME5EWnU0QVIvSWxDcUtLUGVGYWp5RjFjWnY0RFIyNUEvZFl6aURpS2lTQ1B2?=
 =?utf-8?B?emx4M3B1RHhRVjhqemYyYVE3TjUxVjV6dFZ6M0tBTlI4NGRwU2ZSQkczcEJT?=
 =?utf-8?B?c09iR0swc2xhNWpjc1FuOXM5YjZ6YXBKRU5VbE83cEV0VWwrZ3luLzRibGZK?=
 =?utf-8?B?VmFDQmJjVUVqemErQ3JtRjZtSHFTMUxYVEpKNDB0Z0FqelFxK09qZSt4cHNr?=
 =?utf-8?B?aTFYWDliS2dWUkR6SGJUZ3Eya0pPVGRiNXUrR2IxNXlrU1dxNTFoZzlhb1dj?=
 =?utf-8?B?TXFBa2c3YzVtZ3hFQlhyN1o4dHpMcjJxclBzZFhDL1ZKYXByaVgzTTBIbjFt?=
 =?utf-8?B?akUzYjFYOFVlaXJvL2FrOTR2Y0xCTEt1eTQwVXRYaHgyVmZzMithYVlGc3Bl?=
 =?utf-8?B?d3dQMFRnOUJGeU9sK2lPTlJ6dzJzZlF4QjJNREw3Vncxd2Q5MDZUZC8rTk40?=
 =?utf-8?B?NS9mYVFjNzIySXBGL2M0OEtwMDBqdE14ZGZCcG9jM2tOMzJsZFpSQmsxK2pn?=
 =?utf-8?B?OXUvR0dxeTI4ODVDNjJ3SjVMSFY2eGo0U3NFMVJMcEw4WmhsVDgzV1AydGpj?=
 =?utf-8?B?RkdOZ28za1d3Y2IrL0NYR1V1d2FISXU2TE5tRTExN05BUWtvL3lvSFJlWFda?=
 =?utf-8?B?ZkF1Sk5CTXJSMko4eWpHOXhJNnBJUUVVRkpEdHcrU0JRemZxQ0VmNWVMZy9r?=
 =?utf-8?B?d0pDQnIzRzQ1SVlwUXlqTC8vbDhRdWFTY2xzWDdZWWlOR0pycVZOcXhNbXJ2?=
 =?utf-8?B?aXJPWGRwRzlaYThEcWdEZ2Nibm1VZlN1U0RualQya2I3V1NTZnJuMHZuV2FH?=
 =?utf-8?B?MExrdnljRFNvd3lPOWxtMlVwVE1zdWFSZTRkTWJZYVNhWmpMRWxtcU1XUHdN?=
 =?utf-8?B?ekNKcHZIUndPNnFrbGJEMHRObisxZjZ5cEpMYkdqODBvc1A1dk50YnprM2lz?=
 =?utf-8?B?UVdrMUl6RFlId2kxMWIrQkFBdjNoaThOMGpXTm1BbGhvMVN3UHF3MHBNRFAx?=
 =?utf-8?B?VFVnVXg5WFhGdXdHcS9zRUw0KzE5RHh4ZmlqUnUxYVBBdE9HOS80QUhFei9D?=
 =?utf-8?B?aCtYLzdabSt6QTY2eHJXY056ekxFdkMzLzlxejBTSVhSdDVIYTl0Y0U1Ym95?=
 =?utf-8?B?WVd3WmlrTXdwY0gzWFB2RGZoMDVUUm9CbCtnc1RHZWZKNEhCbEZWckg3bzFR?=
 =?utf-8?B?TDlPY0NKdmJ1YjkrbGtJRVU5TUZjMmEwOVRFeGFveUxCZ0RtUVlReVc0bktZ?=
 =?utf-8?B?d2x5eUJ3Szk5dlJZZHJ5VnZ4ckxEcWViUjhPenJhYWhvTWdhZjBPNjVyRUF2?=
 =?utf-8?B?YWVIVm9vZFRrVHdvUy9KZ3BQQTVGTWh3WXdrc1AxcGVzN0JyQVlKK2UxV211?=
 =?utf-8?B?TlJJZDVEUEdIZVliRnQxZXhUcWRCeXYzUWtsOHQ2ZmFyV2RDejdwL0pKcVhH?=
 =?utf-8?B?N09ScFpseWZWQkw1azNhQ3BONWdJK2dyUERhYXYxSXRKUnQ1d3J0NDFZeEVB?=
 =?utf-8?B?TUR0blFSTytrZkpkUjdvYWFUSU1vVE44ZnhOc1UwZFFBUUFkNytiRXF6aHpU?=
 =?utf-8?Q?wz0Tj/ZO6VvvZ4PSwTSbykVhx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 020d8bcb-d387-4390-ad5f-08dbf7216ffb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 12:38:38.7712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9eQqEc8uEkDGYM/wcxwKb2oZSu5SZNLsD11mGirzOxAMDtH7+pmwNQ27QahrfhPm+PGblZeTiG7QqDcvh7PpqUXlLRxwmnIqLC4UAYUZlQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7893
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3VuZGFyZXNhbiwgU3Vq
YXJpdGhhIDxzdWphcml0aGEuc3VuZGFyZXNhbkBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBEZWNlbWJlciA3LCAyMDIzIDM6MjYgUE0NCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMu
dXBhZGh5YXlAaW50ZWwuY29tPjsgVGF1cm8sIFJpYW5hDQo+IDxyaWFuYS50YXVyb0BpbnRlbC5j
b20+OyBHdXB0YSwgQW5zaHVtYW4gPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT47DQo+IGludGVs
LXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogVml2aSwgUm9kcmlnbyA8cm9kcmlnby52
aXZpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtJbnRlbC14ZV0gW3YyIDEvMl0gZHJtL3hl
OiBBZGQgYSBuZXcgbWVtb3J5IGRpcmVjdG9yeSB1bmRlcg0KPiB0aWxlDQo+IA0KPiANCj4gT24g
MTIvNy8yMDIzIDI6MDAgUE0sIFVwYWRoeWF5LCBUZWphcyB3cm90ZToNCj4gPg0KPiA+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBTdW5kYXJlc2FuLCBTdWphcml0aGEg
PHN1amFyaXRoYS5zdW5kYXJlc2FuQGludGVsLmNvbT4NCj4gPj4gU2VudDogVGh1cnNkYXksIERl
Y2VtYmVyIDcsIDIwMjMgMTI6NTggUE0NCj4gPj4gVG86IFRhdXJvLCBSaWFuYSA8cmlhbmEudGF1
cm9AaW50ZWwuY29tPjsgVXBhZGh5YXksIFRlamFzDQo+ID4+IDx0ZWphcy51cGFkaHlheUBpbnRl
bC5jb20+OyBHdXB0YSwgQW5zaHVtYW4NCj4gPj4gPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT47
IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+PiBDYzogVml2aSwgUm9kcmlnbyA8
cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtJbnRlbC14ZV0gW3Yy
IDEvMl0gZHJtL3hlOiBBZGQgYSBuZXcgbWVtb3J5IGRpcmVjdG9yeQ0KPiA+PiB1bmRlciB0aWxl
DQo+ID4+DQo+ID4+DQo+ID4+IE9uIDEyLzcvMjAyMyAxMjowOCBQTSwgU3VuZGFyZXNhbiwgU3Vq
YXJpdGhhIHdyb3RlOg0KPiA+Pj4gT24gMTIvNy8yMDIzIDExOjM2IEFNLCBSaWFuYSBUYXVybyB3
cm90ZToNCj4gPj4+Pg0KPiA+Pj4+IE9uIDEyLzcvMjAyMyAxMDo1MSBBTSwgU3VuZGFyZXNhbiwg
U3VqYXJpdGhhIHdyb3RlOg0KPiA+Pj4+PiBPbiAxMi83LzIwMjMgMTA6NDIgQU0sIFVwYWRoeWF5
LCBUZWphcyB3cm90ZToNCj4gPj4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
Pj4+Pj4+IEZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZz4gT24NCj4gPj4+Pj4+PiBCZWhhbGYgT2YgU3VuZGFyZXNhbiwgU3VqYXJpdGhhDQo+ID4+
Pj4+Pj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciA2LCAyMDIzIDU6NDQgUE0NCj4gPj4+Pj4+
PiBUbzogR3VwdGEsIEFuc2h1bWFuIDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+OyBpbnRlbC0N
Cj4gPj4+Pj4+PiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4+Pj4+PiBDYzogVml2aSwg
Um9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPj4+Pj4+PiBTdWJqZWN0OiBSZTog
W0ludGVsLXhlXSBbdjIgMS8yXSBkcm0veGU6IEFkZCBhIG5ldyBtZW1vcnkNCj4gPj4+Pj4+PiBk
aXJlY3RvcnkgdW5kZXIgdGlsZQ0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBPbiAx
Mi82LzIwMjMgNTozOCBQTSwgU3VuZGFyZXNhbiwgU3VqYXJpdGhhIHdyb3RlOg0KPiA+Pj4+Pj4+
PiBPbiAxMi82LzIwMjMgNToyMyBQTSwgR3VwdGEsIEFuc2h1bWFuIHdyb3RlOg0KPiA+Pj4+Pj4+
Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4+Pj4+Pj4gRnJvbTogSW50ZWwt
eGUgPGludGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbg0KPiA+Pj4+Pj4+
Pj4+IEJlaGFsZiBPZiBTdWphcml0aGEgU3VuZGFyZXNhbg0KPiA+Pj4+Pj4+Pj4+IFNlbnQ6IFdl
ZG5lc2RheSwgRGVjZW1iZXIgNiwgMjAyMyAxMDoxOCBBTQ0KPiA+Pj4+Pj4+Pj4+IFRvOiBpbnRl
bC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4+Pj4+Pj4+PiBDYzogU3VuZGFyZXNhbiwg
U3VqYXJpdGhhIDxzdWphcml0aGEuc3VuZGFyZXNhbkBpbnRlbC5jb20+Ow0KPiA+Pj4+Pj4+Pj4+
IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4+Pj4+Pj4+Pj4gU3Vi
amVjdDogW0ludGVsLXhlXSBbdjIgMS8yXSBkcm0veGU6IEFkZCBhIG5ldyBtZW1vcnkNCj4gPj4+
Pj4+Pj4+PiBkaXJlY3RvcnkgdW5kZXIgdGlsZQ0KPiA+Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4g
QWRkIGEgbmV3IG1lbW9yeSBkaXJlY3RvcnkgdW5kZXIgL2RldmljZS90aWxlPG4+IGFuZCBtb3Zl
DQo+ID4+Pj4+Pj4+Pj4gcGh5c2ljYWxfdnJhbV9zaXplIGF0dHJpYnV0ZSB0byB0aGUgbmV3IGRp
cmVjdG9yeS4NCj4gPj4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+IE5ldyBoaWVyYXJjaHk6DQo+ID4+
Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiAvZGV2aWNlL3RpbGU8bj4vbWVtb3J5L3BoeXNpY2FsX3Zy
YW1fc2l6ZV9ieXRlcw0KPiA+Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4gdjI6IEZpeCBoZWFkaW5n
IHR5cG8gKFJpYW5hKQ0KPiA+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgIEZpeCBjbGVhbnVwIGVycm9y
IG9uIHVubG9hZC9yZWxvYWQgY3ljbGUNCj4gPj4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFN1amFyaXRoYSBTdW5kYXJlc2FuDQo+ID4+Pj4+Pj4+Pj4gPHN1amFyaXRoYS5z
dW5kYXJlc2FuQGludGVsLmNvbT4NCj4gPj4+Pj4+Pj4+PiAtLS0NCj4gPj4+Pj4+Pj4+PiAgwqDC
oCBkcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNmcy5jIHwgMTUgKysrKysrKysrKysrLS0t
DQo+ID4+Pj4+Pj4+Pj4gIMKgwqAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+ID4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuYw0KPiA+Pj4+Pj4+Pj4+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuYw0KPiA+Pj4+Pj4+Pj4+IGluZGV4IDE2Mzc2NjA3YzY4
Zi4uZThjZTRkOTI3MGU2IDEwMDY0NA0KPiA+Pj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV90aWxlX3N5c2ZzLmMNCj4gPj4+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdGlsZV9zeXNmcy5jDQo+ID4+Pj4+Pj4+Pj4gQEAgLTI0LDcgKzI0LDggQEAgc3RhdGlj
IHNzaXplX3QNCj4gPj4+Pj4+Pj4+PiAgwqDCoCBwaHlzaWNhbF92cmFtX3NpemVfYnl0ZXNfc2hv
dyhzdHJ1Y3QgZGV2aWNlICprZGV2LCBzdHJ1Y3QNCj4gPj4+Pj4+Pj4+PiBkZXZpY2VfYXR0cmli
dXRlICphdHRyLA0KPiA+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNoYXIgKmJ1ZikNCj4gPj4+Pj4+Pj4+PiAgwqDCoCB7DQo+ID4+Pj4+Pj4+Pj4g
LcKgwqDCoCBzdHJ1Y3QgeGVfdGlsZSAqdGlsZSA9IGtvYmpfdG9fdGlsZSgma2Rldi0+a29iaik7
DQo+ID4+Pj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qga29iamVjdCAqa29iaiA9ICZrZGV2LT5rb2Jq
Ow0KPiA+Pj4+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IHhlX3RpbGUgKnRpbGUgPSBrb2JqX3RvX3Rp
bGUoa29iai0+cGFyZW50KTsNCj4gPj4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKg
wqAgcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJWxsdVxuIiwNCj4gPj4+Pj4+Pj4+PiB0aWxlLT5t
ZW0udnJhbS5hY3R1YWxfcGh5c2ljYWxfc2l6ZSk7DQo+ID4+Pj4+Pj4+Pj4gIMKgwqAgfQ0KPiA+
Pj4+Pj4+Pj4+IEBAIC0zOCw3ICszOSw3IEBAIHN0YXRpYyB2b2lkIHRpbGVfc3lzZnNfZmluaShz
dHJ1Y3QNCj4gPj4+Pj4+Pj4+PiBkcm1fZGV2aWNlICpkcm0sIHZvaWQNCj4gPj4+Pj4+Pj4+PiAq
YXJnKcKgIHsNCj4gPj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZV90aWxlICp0aWxl
ID0gYXJnOw0KPiA+Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4gLcKgwqDCoCBrb2JqZWN0X3B1dCh0
aWxlLT5zeXNmcyk7DQo+ID4+Pj4+Pj4+Pj4gK8KgwqDCoCBrb2JqZWN0X2RlbCh0aWxlLT5zeXNm
cyk7DQo+ID4+Pj4+Pj4+PiBXaHkga29iZWtjdF9kZWwgaW5zdGVhZCBvZiBrb2JqZWN0X3B1dD8N
Cj4gPj4+Pj4+Pj4+IFRoYW5rcywNCj4gPj4+Pj4+Pj4+IEFuc2h1bWFuIEd1cHRhLg0KPiA+Pj4+
Pj4+PiBIaSBBbnNodW1hbiwNCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gQmFzaWNhbGx5IHdoZW4g
c2FuaXR5IGNoZWNraW5nLCBhZnRlciByZWxvYWQgd2Ugc2VlIHRoYXQgd2UgYXJlDQo+ID4+Pj4+
Pj4+IG5vdCBkb2luZyBhIHByb3BlciBjbGVhbnVwLg0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBr
b2JqZWN0X3B1dCB3aWxsIG9ubHkgZGVjcmVtZW50IHRoZSByZWYgY291bnQgYW5kIHBvc3NpYmx5
IGZyZWUNCj4gPj4+Pj4+Pj4gdGhlIGtvYmplY3QuDQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IEJ1
dCB0aGF0IGlzIG5vdCBoYXBwZW5pbmcgaW4gdGhpcyBjYXNlLiBUaGVyZSBpcyBhIGR1cGxpY2F0
ZQ0KPiA+Pj4+Pj4+PiByZW1haW5pbmcgb2YgdGhlIHRpbGUgZGlyZWN0b3J5Lg0KPiA+Pj4+Pj4+
Pg0KPiA+Pj4+Pj4+PiBUaGlzIHJlcXVpcmVkIGEgY2xlYW4gdW5yZWdpc3RlciBvZiB0aGUgcGFy
ZW50IGZyb20gc3lzZnMgaGVuY2UNCj4gPj4+Pj4+Pj4gdGhlIHVzZSBvZiBrb2JqZWN0X2RlbC4N
Cj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gVGhhbmtzLA0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBT
dWphDQo+ID4+Pj4+Pj4gQXMgYSBjb250aW51YXRpb24gb2YgdGhlIGFib3ZlIHJlc3BvbnNlOw0K
PiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gSSBjYW4gcHJvYmFibHkgYWRkIGEga29iamVjdF9wdXQgY2Fs
bCBhcyB3ZWxsIHRvIGVuc3VyZSB0aGF0IHdlDQo+ID4+Pj4+Pj4gYXJlIGNsZWFuaW5nIHVwIHRo
ZSBtZW1vcnkgc2lkZSBvZg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gdGhpbmdzIGFzIHdlbGwuIFdp
bGwgYWRkLg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gVGhhbmtzLA0KPiA+Pj4+Pj4+DQo+ID4+Pj4+
Pj4gU3VqYQ0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4gIMKgwqAgfQ0KPiA+Pj4+Pj4+Pj4+DQo+
ID4+Pj4+Pj4+Pj4gIMKgwqAgdm9pZCB4ZV90aWxlX3N5c2ZzX2luaXQoc3RydWN0IHhlX3RpbGUg
KnRpbGUpIEBAIC00Niw2DQo+ID4+Pj4+Pj4+Pj4gKzQ3LDcgQEAgdm9pZCB4ZV90aWxlX3N5c2Zz
X2luaXQoc3RydWN0IHhlX3RpbGUgKnRpbGUpDQo+ID4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHRpbGVfdG9feGUodGlsZSk7DQo+ID4+Pj4+Pj4+Pj4gIMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSB4ZS0+ZHJtLmRldjsNCj4gPj4+Pj4+Pj4+
PiAgwqDCoMKgwqDCoMKgIHN0cnVjdCBrb2JqX3RpbGUgKmt0Ow0KPiA+Pj4+Pj4+Pj4+ICvCoMKg
wqAgc3RydWN0IGtvYmplY3QgKmtvYmo7DQo+ID4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoCBpbnQg
ZXJyOw0KPiA+Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoCBrdCA9IGt6YWxs
b2Moc2l6ZW9mKCprdCksIEdGUF9LRVJORUwpOyBAQCAtNjQsOA0KPiA+Pj4+Pj4+Pj4+ICs2Niwx
NSBAQCB2b2lkIHhlX3RpbGVfc3lzZnNfaW5pdChzdHJ1Y3QgeGVfdGlsZSAqdGlsZSkNCj4gPj4+
Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqAgdGlsZS0+c3lzZnMgPSAma3QtPmJh
c2U7DQo+ID4+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+PiArwqDCoMKgIGtvYmogPSBrb2JqZWN0X2Ny
ZWF0ZV9hbmRfYWRkKCJtZW1vcnkiLCB0aWxlLT5zeXNmcyk7DQo+ID4+Pj4+Pj4+Pj4gK8KgwqDC
oCBpZiAoIWtvYmopIHsNCj4gPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAga29iamVjdF9wdXQo
a29iaik7DQo+ID4+Pj4+PiBEbyB5b3UgbWVhbiB0byBwdXQga29iamVjdF9wdXQodGlsZS0+c3lz
ZnMpIGluc3RlYWQgb2YNCj4gPj4+Pj4+IGtvYmplY3RfcHV0KGtvYmopID8gYXMgdGhlcmUgd2Fz
IG5vIEtvYmogY3JlYXRlZCBieSB0aGUgdGltZSB5b3UNCj4gPj4+Pj4+IHJlYWNoZWQgaGVyZSEN
Cj4gPj4+Pj4+DQo+ID4+Pj4+PiBUZWphcw0KPiA+Pj4+PiBZdXAgdGhpcyBzaG91bGQgYmUgZml4
ZWQuDQo+ID4+Pj4gSGkgU3VqYQ0KPiA+Pj4+DQo+ID4+Pj4gUmVtb3ZpbmcgdGlsZSB3b24ndCBi
ZSByaWdodCwgYXMgdGhlcmUgYXJlIG90aGVyIGRpcmVjdG9yaWVzIChndCMpDQo+ID4+Pj4gZGVw
ZW5kZW50IG9uIGl0LiBTaW1wbGUgcmV0dXJuIHNob3VsZCBiZSBnb29kIHdpdGggYSB3YXJuPw0K
PiA+Pj4+DQo+ID4+Pj4gVGhhbmtzDQo+ID4+Pj4gUmlhbmENCj4gPj4+IFN1cmUuIFdlIGNhbiBw
cm9iYWJseSBoYXZlIHRoZSBvcmlnaW5hbCBjbGVhbnVwIGluIGZpbmkuDQo+ID4gSWYgeW91IGp1
c3QgZ2l2ZSB3YXJuIGFuZCByZXR1cm4gdGhlbiB5b3Ugd2lsbCBuZXZlciByZWdpc3RlciB0aWxl
X2ZpbmkgZnVuY3Rpb24NCj4gYW5kIGl0IHdpbGwgbmV2ZXIgYmUgY2FsbGVkIG9uIGRyaXZlciB1
bmxvYWQvcmVsb2FkLiBTbyBlaXRoZXIgeW91IHJlbW92ZSB0aWxlDQo+IHVzaW5nIGtvYmplY3Rf
cHV0KCkgYmVmb3JlIHJldHVybiBvciBkb27igJl0IHJldHVybiBhbmQgY2hlY2sga29iaiBiZWZv
cmUNCj4gY3JlYXRpbmcgZmlsZXMgdW5kZXIgaXQgdG8gYXZvaWQgY3Jhc2guDQo+ID4NCj4gPiBU
ZWphcw0KPiANCj4gTGV0IG1lIHRlc3Qgb3V0IGV2ZXJ5dGhpbmcgYW5kIHNlZSB3aGljaCBhcHBy
b2FjaCB3aWxsIHdvcmsgdGhlIGJlc3QuDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBTdWphDQoNCkFs
c28gcGxlYXNlIHB1dCByZWZlcmVuY2Ugb2Yga29iaiBjcmVhdGVkIGZvciAibWVtb3J5IiBpbiB0
aWxlX3N5c2ZzX2ZpbmkoKSAuIExpa2UgYmVsb3cgOg0KICAga29iamVjdF9wdXQoa29iaik7DQog
ICAgICAgIGtvYmplY3RfcHV0KHRpbGUtPnN5c2ZzKTsNCg0KVGVqYXMNCj4gDQo+ID4NCj4gPj4+
Pj4gVGhhbmtzLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBTdWphDQo+ID4+Pj4+DQo+ID4+Pj4+Pj4+Pj4g
KyBkcm1fd2FybigmeGUtPmRybSwgIiVzIGZhaWxlZCwgZXJyOiAlZFxuIiwgX19mdW5jX18sIC0N
Cj4gPj4+Pj4+Pj4+PiBFTk9NRU0pOw0KPiA+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1
cm47DQo+ID4+Pj4+Pj4+Pj4gK8KgwqDCoCB9DQo+ID4+Pj4+Pj4+Pj4gKw0KPiA+Pj4+Pj4+Pj4+
ICDCoMKgwqDCoMKgwqAgaWYgKElTX0RHRlgoeGUpICYmIHhlLT5pbmZvLnBsYXRmb3JtICE9IFhF
X0RHMSAmJg0KPiA+Pj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBzeXNmc19jcmVhdGVfZmlsZSh0
aWxlLT5zeXNmcywNCj4gPj4+Pj4+Pj4+PiBwaHlzaWNhbF9tZW1zaXplX2F0dHIpKQ0KPiA+Pj4+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzeXNmc19jcmVhdGVfZmlsZShrb2JqLCBwaHlzaWNhbF9t
ZW1zaXplX2F0dHIpKQ0KPiA+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fd2Fy
bigmeGUtPmRybSwNCj4gPj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICJTeXNmcyBjcmVhdGlvbiB0byByZWFkIGFkZHJfcmFuZ2UgcGVyIHRpbGUNCj4gPj4+Pj4+Pj4+
PiBmYWlsZWRcbiIpOw0KPiA+Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4gLS0NCj4gPj4+Pj4+Pj4+
PiAyLjI1LjENCj4gPj4gSGkgYWxsLA0KPiA+Pg0KPiA+PiBTbyBhZnRlciBhbGwgb2YgdGhpcyBk
aXNjdXNzaW9uLCBoZXJlJ3MgdGhlIGZpbmFsIHJlc3VsdHMgYWZ0ZXIgdGVzdGluZyB0aGUNCj4g
Y2xlYW51cC4NCj4gPj4NCj4gPj4gUmVnYXJkbGVzcyBvZiBhbnl0aGluZyB3ZSBkbyBpbiB0aGUg
aW5pdCBmdW5jdGlvbiwgaXQgbG9va3MgbGlrZQ0KPiA+PiB3aXRob3V0IGhhdmluZyB0aGUNCj4g
Pj4NCj4gPj4gdHdvLXN0ZXAga29iamVjdF9kZWwgYW5kIGtvYmplY3RfcHV0IGNsZWFudXAgaW4g
dGhlIHN5c2ZzX2ZpbmkNCj4gPj4gZnVuY3Rpb24gd2Ugd2lsbA0KPiA+Pg0KPiA+PiBzZWUgYW4g
ZXJyb3Igb24gcmVsb2FkIHdpdGggdGhlIHRpbGUgZGlyZWN0b3J5IG5vdCBiZWluZyBmdWxseQ0K
PiA+PiBjbGVhbmVkIHVwIGFuZCByZXBvcnRpbmcNCj4gPj4NCj4gPj4gZHVwbGljYXRlIGNyZWF0
aW9uLg0KPiA+Pg0KPiA+PiBUaGUgc29sdXRpb24gc2VlbXMgdG8gYmUganVzdCB0byBhZGQgYSBr
b2JqZWN0X2RlbCBiZWZvcmUga29iamVjdF9wdXQNCj4gPj4gaW4gdGhlIGZpbmkNCj4gPj4NCj4g
Pj4gZnVuY3Rpb24uDQo+ID4+DQo+ID4+IEkgYW0gb25seSBoYXZpbmcgd2FybmluZ3MgYW5kIHNp
bXBsZSByZXR1cm5zIG9uIHRoZSBpbml0IHNpZGUuDQo+ID4+DQo+ID4+IElmIHRoZXJlIGNhbiBi
ZSBhIGNvbnNlbnN1cyBhYm91dCB0aGlzIGZyb20gdGhlIHJldmlld2VycywgSSBjYW4NCj4gPj4g
ZmxvYXQgdGhlIG5leHQgdmVyc2lvbg0KPiA+Pg0KPiA+PiBhY2NvcmRpbmdseS4NCj4gPj4NCj4g
Pj4gVGhhbmtzLA0KPiA+Pg0KPiA+PiBTdWphDQo=
