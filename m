Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5DDC761A6
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 22:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D910310F345;
	Fri, 31 Mar 2023 22:55:49 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB11510F345
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 22:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680303346; x=1711839346;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RJbgwhhnVzAQZVfJyzeSTh7jntb8UOR+QYFtcDjkcZU=;
 b=lcrksu6SH2/FSvq3oTO3Po3H+Nq8rjGt8Ug1iyMeuhhYPyuuFpgoIxkb
 05AUl0s2q7NMubEnG8QraiFm11IZ40aG4Q8dMBTYL5Yy/PXIqBNywGCqT
 aw3NL+bHGe5dP6SP833Ymv8EWRZl9HptZm/2qm6LH4q0JimDLksxptUyl
 ei7IdVSHw1djBdMmddPPKQTuZlqyPl+GTky+RcUq7jIgZxeGC7XOze5xW
 I2JCb6VLibKd8bELJjwf+D+OxWw/TEIqj/kJOq/tQpBAKLCrZAiaeFuJW
 HItcAfPLfVDjp1jicKDkuixh3eXanUrJ94UuYppyXhNpZQMA9fT+kQfhN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="343243273"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="343243273"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 15:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="717885117"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="717885117"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 31 Mar 2023 15:55:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 15:55:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 15:55:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 15:55:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URZrE7leaCMfGF+7bPqv62nELm9xg3TK0Jn6TKpU64UsTVCgA7F43H+o6Y/uB2BgsyzKPljCX4xGRz4UsO0zk/cNUofngCpq0kyXiQiuaFPya5+AuCLEYLQ49KQusTy2WA0Wd42rKWEAnI3EjSNBxIkJZkzu1GXb2Glpya2r6kf6v6VElBSSM9Zq6vqLIIsY7Xzauc/pYomXvF9pKfndKE8zsRflN/TgRLa2jbj0MBpRkp75NPD0lsDdmsLBSAfuXplEo341hoO/OhXm8n4q5EHmJImxdPGkjYEYwKBDIMQtX/NfEdJZR6G6XdsNhlslJiLWd+9qI9kcabPpv3+aDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJbgwhhnVzAQZVfJyzeSTh7jntb8UOR+QYFtcDjkcZU=;
 b=f3IFOTvfDCgOYficdtnFY5D5nNWtOY80LQwhYzcsFQE32uwA7sWMf/7U91tJLOf2LqqxhfXt4ksMwEXHPKOgcnIRO28H6f9fE24jkR9sPwefzY4apyDsIi472EoME7yzELfyVQ6AwmIR02rji7qYCht26tswQUBDi4qNVLnPuROwcG4+wiNj+dKShgfNusohWnd4+yvLfXd8F43jd8uta6P7vpBRtxjV4xUqk6QR2LVWVu+V3803OR/wzyl1LkRdtytdAci7+j3HAoRcawJQJoZNiCXTX4n1mCvinhUI1Pin4xuU1DLm3pNePIxt+G0+jVVPLV363f7yCGReae0IXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.24; Fri, 31 Mar
 2023 22:55:43 +0000
Received: from CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876]) by CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876%8]) with mapi id 15.20.6222.035; Fri, 31 Mar 2023
 22:55:43 +0000
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: fix pvc unload issue
Thread-Index: AQHZY5NYkTfp57qAMUC3k9UeihN2za8VJ8gg
Date: Fri, 31 Mar 2023 22:55:42 +0000
Message-ID: <CY8PR11MB6940AB93CD09A76B20794B16C38F9@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <20230330154026.4282-1-yu.bruce.chang@intel.com>
 <CAM0jSHPvzNKj9Z-sX6BykN4v6JQQJve4e=jYae-ZAEdmb8mPbA@mail.gmail.com>
In-Reply-To: <CAM0jSHPvzNKj9Z-sX6BykN4v6JQQJve4e=jYae-ZAEdmb8mPbA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6940:EE_|PH0PR11MB4790:EE_
x-ms-office365-filtering-correlation-id: e1e2c25b-39bb-4bf7-25d6-08db323b0e6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6CbpCy4MEOmEuxUN4im/q0IR3D3xTr1WcRTx5reENu+P8NzrXa61Bgp4Ef7GzvfgVwrId/T1JJ8kieoav5/O9at8Ct+bL++bYkYNouFI4Kp3FWuW6u/xz7XXpG2VXOpyV3/QhKnBG1xHUwd4mwunZXzjmazpbaF7shqzIsRjflNigMz7MuvpXmRWmyxJaAe8rk4TouE975q2RU2n0Vc+0/bXKXTEBPCECg+TAO03HmdDsdEpyI5IvE2B6ipBhasCYuwPbebGz/tgdXk7cEjgLoEu+RM5mKwJyuY7npH8F5XY03nfb9fDbVuSSWLRM/066IQX9ruFb34eS60FhtOD586XUJEpIWWfZ7548b/m7YZ5zXagrv1nzBmydPQQ3aDTf0kuY0CbfKBXSY/oa/oGp3W3wkJZliHUBQkawxzeQSCQJfe+X0ukTiAmZ3rcH6K+hLp+21+A3ccMFOxqN1eW8RHlSWIzkhu/DGiAMnPJlc9fp++VUMQuPV8fn2G4tLLG0BXIH/5WpiTAalFoaSsWXp2UdAb7xGMxEhXMcEd0UjdhOjvCPSSQXZ+Dkhdmb3B8aXxoUTX7W7fcvg87c+DuG1jO6cQd9LM7jRMLeAvHRWYbSlnjvcO5tIhzSBxb2sRI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6940.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199021)(6916009)(316002)(8676002)(4326008)(64756008)(66556008)(66446008)(54906003)(66946007)(76116006)(66476007)(33656002)(26005)(53546011)(38100700002)(122000001)(186003)(83380400001)(66574015)(8936002)(41300700001)(5660300002)(9686003)(7696005)(71200400001)(478600001)(86362001)(38070700005)(6506007)(2906002)(52536014)(82960400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2hNRnRhTkFMYXpUdi9mU1N4czJ0djQyK2VsNlg0azBYWXVwTXIyT2pIeUZ2?=
 =?utf-8?B?UTdvNnBlYUk0N01sNlZSNXE1L0J3VEQ5YVMxQ3dPSCtXS0g2cER5bWVJU0VS?=
 =?utf-8?B?NnZ2bW9lOEVtQXN3V2t0ZGJFNUFhVzRYV3dtbkhzcWV3SG1qU0FnSWl5eVQw?=
 =?utf-8?B?WndQVDZKUzBwd1g0QW1pNmpwRXhJZ05Fdk93ZzJPSU9ZeklyUWxUemxFcmFj?=
 =?utf-8?B?Wno4UkRnYVN2R3dlT2dCM1hKcHhxQXhVVWhjbStBZng2VDhKV3VpREhhSW1m?=
 =?utf-8?B?aVdhdlJUS213MVE1bnNTd2VnWmhRclJ2WjZuT0R5clBRUDAvR2svOHVOZldp?=
 =?utf-8?B?WE43RDExajd2YTlSdXFyajRjSUpQWnlYWm1jWnhmME1FdEFlNE1PREUxK003?=
 =?utf-8?B?QzNRUkFCVVgrRDlkN05HMGFkbUVvWDF1OW9wWC9UZW8vR01XOTc1U2xaKzkv?=
 =?utf-8?B?L0g2a1BpSnlGdjloV3A2VCtSZ2o2bFV0bytTa09MOFhrWm5UQjBud2F3MFc3?=
 =?utf-8?B?eG5mUWJ4cXpIbGZBd0FqV2RZV3NQaTBZcXMwRnFvbzZyS1h5czJETmpSUG9I?=
 =?utf-8?B?bWl0SFhvNWRxdmtPSDBNeVZzOFd3SENuNis5OGhqSEJGL3BQK3V3Y3JLbVFV?=
 =?utf-8?B?MThFem1xMkxQOGlOOFdBN2N2WDZ5MTZZTmduU1h5YVQxbFpPdEZkOFQvcHQ0?=
 =?utf-8?B?WHphcVJ5cFcxbFVtcUtOSEJEVWxUVEZFV08rNjRSMUt5VTNKS1FIOEpZV0RR?=
 =?utf-8?B?V0grdHVZZ3BHK1JyeWFSKzN4Umg4clZ1a283MkdaSE0wdUhuc0dVcEpubDEr?=
 =?utf-8?B?bTR1ckNMUmJ6ZXZ2V2gyVVowK2l5S0VwTko0RHVnK0VmNmF0RmM0L3g3bU9Y?=
 =?utf-8?B?RTRORmxxQWIzUERqM3d4ejFYT1hYZUpRcDZIWU1ibHVqZG1UQzJhRHZpd0JI?=
 =?utf-8?B?MHB1RmlCUnhIdldjSXZpQ0haN2dIeXZiVnJzdXF1SFArbWxVWHgyOVhnTk4v?=
 =?utf-8?B?djBZZUVzT2hsWFVwRm10VmtLQ09nQ0hXMEUwS3RobHFIWFVLdTk1QW9HVzFI?=
 =?utf-8?B?Ui8wRFQzeGtmYVJnRkxScitJS3N1UWliUDErWGMydFM3dkVoVXNJYkllbysz?=
 =?utf-8?B?eXdleCtydXFaYXNzZFg4QVRiWDczZ3cveU5MSnp4L3l1ODlweE4wRWlrOWhq?=
 =?utf-8?B?L3E4WkFrR0syQW5lbTU0NTNRRWliOFIvdEs2TGg0VmFUNDErckVPamt2VE5H?=
 =?utf-8?B?U2VNNW5JcWk4NUk1am1Jc1l3WTJ5ZFVQcVY4WDN0WEhDVUw3L1psZ1hOKzBm?=
 =?utf-8?B?Qnhma2tyVFB4WjAzL2lhYnViS1V5dTZuR3hEeVlUbm9NcW94Q2NvSUFmNW1D?=
 =?utf-8?B?UlUzSnRZOEJydlVnMStubHB5di9uZnJjbjZJK0lseEc1SUxEVGNyMXdiczFN?=
 =?utf-8?B?d05QQjNXQWFlTWNMRXVBUU1CeEVETERyVnV5RFNXZVZMMGxVaEJreTd0R3p0?=
 =?utf-8?B?T2hkaytmbHZ6V3gvN0NMa2kvYmE4bU82WnRMSWJqNXp2b2hkRy9WWFp5ZS9S?=
 =?utf-8?B?NmZpSnIwOWhwMGJSckJob0J4UVRrR2JDcUpwOStRUEpxTnF6YVhOTEEvNWpx?=
 =?utf-8?B?UFRQTzZXcDBtbjgvak9tR2gzS0p3dk5mVGtqcERITjNreFo0OHRuSzZZRk9B?=
 =?utf-8?B?TmhQcFA2N2E1Q09zK1FOL0d0NlN3Z1ZVdHJRZ3J6dnVyVDFHUm8yaytvQXRQ?=
 =?utf-8?B?TWlPc1U0QlJsMUxzSDQ5UEtpelhOcG5uZnJjeXNjTzJDMjRDWnhjenZLWjNr?=
 =?utf-8?B?OUFZNmFGdzRsR3ZzYmVUN29XdWxEalIvbFc1ZkorcjNPaWRzekl6MHh6VXIz?=
 =?utf-8?B?eFBzV3pZN3F3NHA5eGJKbGRvQXVyOFJDQUl2RnBBU25FYjlWb2xGb0wvQmVz?=
 =?utf-8?B?dkRPNGFFU0hFQm0xOGxYRWQrMjdGR0ZzV1VuTHNZODRtQkFNbG5ULzFhbVRl?=
 =?utf-8?B?UlJyanRsYWZMUUZkaUZwRlZ1MXJQNGNlb1BtRHZDblpvZFg1dFVWWWVNcTlD?=
 =?utf-8?B?aTBUVlJ3aU93K1FuTGU0a2czdXRwSWFIVDBiZHJSMnRqKytFREVzTTk1QlpT?=
 =?utf-8?Q?CDF2kQjLBfPXJG+R02VjCWC3z?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e2c25b-39bb-4bf7-25d6-08db323b0e6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2023 22:55:42.9535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p1hly1VswRd6toXsVsb/6p5+7256onu6nzho5aQ41kmTpvBXnMq50cy/SE4PV1GonS/Wo6X5bF6wSMoyHtIqGGigHpmPJgnQATjGubjmC+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix pvc unload issue
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0dGhldyBBdWxkIDxt
YXR0aGV3LndpbGxpYW0uYXVsZEBnbWFpbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAz
MCwgMjAyMyAxMDo0MCBQTQ0KPiBUbzogQ2hhbmcsIFl1IGJydWNlIDx5dS5icnVjZS5jaGFuZ0Bp
bnRlbC5jb20+DQo+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFRob21hcyBI
ZWxsc3Ryw7ZtDQo+IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtJbnRlbC14ZV0gW1BBVENIXSBkcm0veGU6IGZpeCBwdmMgdW5sb2FkIGlzc3VlDQo+
IA0KPiBPbiBUaHUsIDMwIE1hciAyMDIzIGF0IDE2OjQwLCBDaGFuZywgQnJ1Y2UgPHl1LmJydWNl
LmNoYW5nQGludGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBDdXJyZW50bHksIHVubG9hZCBw
dmMgZHJpdmVyIHdpbGwgZ2VuZXJhdGUgYSBudWxsIGRlcmVmZXJlbmNlIGFuZCB0aGUNCj4gPiBj
YWxsIHN0YWNrIGlzIGFzIGJlbG93Lg0KPiA+DQo+ID4gWyA0ODUwLjYxODAwMF0gQ2FsbCBUcmFj
ZToNCj4gPiBbIDQ4NTAuNjIwNzQwXSAgPFRBU0s+DQo+ID4gWyA0ODUwLjYyMzEzNF0gIHR0bV9i
b19jbGVhbnVwX21lbXR5cGVfdXNlKzB4M2YvMHg1MCBbdHRtXSBbDQo+ID4gNDg1MC42Mjg2NjFd
ICB0dG1fYm9fcmVsZWFzZSsweDE1NC8weDJjMCBbdHRtXSBbIDQ4NTAuNjMzMzE3XSAgPw0KPiA+
IGRybV9idWRkeV9maW5pKzB4NjIvMHg4MCBbZHJtX2J1ZGR5XSBbIDQ4NTAuNjM4NDg3XSAgPw0K
PiA+IF9fa21lbV9jYWNoZV9mcmVlKzB4MjdkLzB4MmMwIFsgNDg1MC42NDMwNTRdICB0dG1fYm9f
cHV0KzB4MzgvMHg2MA0KPiA+IFt0dG1dIFsgNDg1MC42NDcxOTBdICB4ZV9nZW1fb2JqZWN0X2Zy
ZWUrMHgxZi8weDMwIFt4ZV0gWyA0ODUwLjY1MTk0NV0NCj4gPiBkcm1fZ2VtX29iamVjdF9mcmVl
KzB4MWUvMHgzMCBbZHJtXSBbIDQ4NTAuNjU2OTA0XQ0KPiA+IGdndHRfZmluaV9ub2FsbG9jKzB4
OWQvMHhlMCBbeGVdIFsgNDg1MC42NjE1NzRdDQo+ID4gZHJtX21hbmFnZWRfcmVsZWFzZSsweGI1
LzB4MTUwIFtkcm1dIFsgNDg1MC42NjY2MTddDQo+ID4gZHJtX2Rldl9yZWxlYXNlKzB4MzAvMHg1
MCBbZHJtXSBbIDQ4NTAuNjcxMjA5XQ0KPiA+IGRldm1fZHJtX2Rldl9pbml0X3JlbGVhc2UrMHgz
Yy8weDYwIFtkcm1dDQo+ID4NCj4gPiBUaGVyZSBhcmUgYSBjb3VwbGUgaXNzdWVzLCBidXQgdGhl
IG1haW4gb25lIGlzIGR1ZSB0byBUVE0gaGFzIG9ubHkgb25lDQo+ID4gVFRNX1BMX1RUIHJlZ2lv
biwgYnV0IHNpbmNlIHB2YyBoYXMgMiB0aWxlcyBhbmQgdHJpZXMgdG8gc2V0dXANCj4gPiAxIFRU
TV9QTF9UVCBlYWNoIHRpbGUuIFRoZSBzZWNvbmQgd2lsbCBvdmVyd3JpdGUgdGhlIGZpcnN0IG9u
ZS4NCj4gPg0KPiA+IER1cmluZyB1bmxvYWQgdGltZSwgdGhlIGZpcnN0IHRpbGUgd2lsbCByZXNl
dCB0aGUgVFRNX1BMX1RUIG1hbmdlciBhbmQNCj4gPiB3aGVuIHRoZSBzZWNvbmQgdGlsZSBpcyB0
cnlpbmcgdG8gZnJlZSBCbyBhbmQgaXQgd2lsbCBnZW5lcmF0ZSB0aGUNCj4gPiBudWxsIHJlZmVy
ZW5jZSBzaW5jZSB0aGUgVFRNIG1hbmFnZSBpcyBhbHJlYWR5IGdvdCByZXNldCB0byAwLg0KPiA+
DQo+ID4gVGhlIGZpeCBpcyB0byBzaGFyZSB0aGUgVFRNX1BMX1RUIG1hbmFnZXIgYW5kIHVzZSBh
IGNvdW50IHRvIG9ubHkNCj4gPiBhbGxvdyB0aGUgbGFzdCBpbnN0YW5jZSB0byByZWxlYXNlLg0K
PiANCj4gV291bGQgaXQgbWFrZSBzZW5zZSB0byByYXRoZXIgbW92ZSBpdCBvdXQgb2YgR1QgaW5p
dCwgYW5kIGp1c3QgaGF2ZSBvbmUNCj4gaW5zdGFuY2UgaW4gdGhlIHhlX2RldmljZT8gQW5kIHdp
dGggdGhhdCB0byByYXRoZXIgY29uc2lkZXINCj4geGUtPm1lbS52cmFtX3NpemUsIGluc3RlYWQg
b2YgZ3QtPm1lbS52cmFtX3NpemUgd2hlbiBjb25zaWRlcmluZyB0aGUNCj4gcG90ZW50aWFsICJH
VFQiIHNpemU/IEkgdGhpbmsgUExfVFQgaXMganVzdCBzeXN0ZW0gbWVtb3J5IHRoYXQgY2FuIGJl
DQo+IHRvdWNoZWQgYnkgdGhlIEdQVSBkZXZpY2UgKGxpa2VseSBoYXMgYSBndHQgbWFwcGluZyks
IHNvIG5vdCBzdXJlIHdoeSB0aGF0DQo+IG5lZWRzIHRvIGJlIEdUIGNlbnRyaWMuDQo+IA0KDQpb
QkNdIEFsc28gZ290IGNvbW1lbnQgZnJvbSBNYXR0IGFzIGJlbG93DQoiDQpNYXR0aGV3IEF1bGQg
aXMgY29ycmVjdCwgdGhhdCB0aGUgZ3R0X21nciBpcyB0aGUgc3lzdGVtIG1lbW9yeSBtYW5hZ2Vy
IGZvcg0KVFRNIGFuZCB0aGlzIGlzIGEgcGVyIGRldmljZSByZXNvdXJjZSAtIHRoYXQgaXMgd2hl
cmUgaXQgc2hvdWxkIGxpdmUsIGJlIGluaXRpYWxpemVkLA0KYW5kIGZpbmkuIExpa2VseSBjaGFu
Z2UgYW55IGFyZ3MgaW4gcHVibGljIGZ1bmN0aW9ucyB0byBhIGRldmljZSByYXRoZXIgdGhhbiBH
VCB0b28uIA0KLi4uDQpsZXTigJlzIGFkanVzdCB0aGUgbmFtZSB0b28uIHMvZ3R0X21nci9zeXNf
bWdyDQoNCk1hdHQNCiINCg0KW0JDXSBhY3R1YWxseSBJIHRob3VnaHQgYWJvdXQgaXQsIGJ1dCBJ
IGRpZG4ndCB3YW50IHRvIG1ha2UgdG9vIG11Y2ggY2hhbmdlDQphbmQganVzdCB3YW50IHRvIGZp
eCB0aGUgdW5sb2FkaW5nIGlzc3VlLiANCg0KVG90YWxseSBhZ3JlZSB0aGF0IHRoZSBndHQgc2hv
dWxkIGJlIGdsb2JhbCBhbmQgbm90IHBlciBndC4gV2lsbCB0cnkgdG8gbWFrZQ0KdGhlIGNoYW5n
ZS4NCg0KVGhhbmtzLA0KQnJ1Y2UNCg0KPiA+DQo+ID4gQ2M6IFN0dWFydCBTdW1tZXJzIDxzdHVh
cnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJv
c3RAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJydWNlIENoYW5nIDx5dS5icnVjZS5j
aGFuZ0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2VfdHlwZXMuaCB8ICAzICsrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyAgICAg
ICAgICAgfCAgOSArKysrKysrLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV9ndHRf
bWdyLmMgIHwgMjUgKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiA+ICAzIGZpbGVzIGNoYW5n
ZWQsIDI1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gaW5kZXggODhmODYzZWRjNDFjLi5lYTc3
MWYxMjBjMGYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90
eXBlcy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+
ID4gQEAgLTE5NSw2ICsxOTUsOSBAQCBzdHJ1Y3QgeGVfZGV2aWNlIHsNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAvKiogQG1hcHBpbmc6IHBvaW50ZXIgdG8gVlJBTSBtYXBwYWJsZSBzcGFj
ZSAqLw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKl9faW9tZW0gbWFwcGluZzsN
Cj4gPiAgICAgICAgICAgICAgICAgfSB2cmFtOw0KPiA+ICsgICAgICAgICAgICAgICAvKiogQGd0
dF9tcjogR1RUIFRUTSBtYW5hZ2VyICovDQo+ID4gKyAgICAgICAgICAgICAgIHN0cnVjdCB4ZV90
dG1fZ3R0X21nciAqZ3R0X21ncjsNCj4gPiArICAgICAgICAgICAgICAgaW50IGluc3RhbmNlOw0K
PiA+ICAgICAgICAgfSBtZW07DQo+ID4NCj4gPiAgICAgICAgIC8qKiBAdXNtOiB1bmlmaWVkIG1l
bW9yeSBzdGF0ZSAqLyBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Qu
YyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jIGluZGV4DQo+ID4gZmQ3YTViNDNiYTNlLi5l
N2NhMTQxNDc4ZWYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+IEBAIC03Nyw4ICs3Nywx
MyBAQCBpbnQgeGVfZ3RfYWxsb2Moc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV9ndA0K
PiAqZ3QpDQo+ID4gICAgICAgICAgICAgICAgIGlmICghZ3QtPm1lbS52cmFtX21ncikNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gPg0KPiA+IC0gICAgICAg
ICAgICAgICBndC0+bWVtLmd0dF9tZ3IgPSBkcm1tX2t6YWxsb2MoZHJtLCBzaXplb2YoKmd0LQ0K
PiA+bWVtLmd0dF9tZ3IpLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgR0ZQX0tFUk5FTCk7DQo+ID4gKyAgICAgICAgICAgICAgIGlmICgheGUtPm1l
bS5ndHRfbWdyKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgeGUtPm1lbS5ndHRfbWdy
ID0NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRybW1fa3phbGxvYyhkcm0s
IHNpemVvZigqZ3QtPm1lbS5ndHRfbWdyKSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMKTsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICB4ZS0+bWVtLmluc3RhbmNlID0gMDsNCj4gPiArICAgICAgICAgICAgICAgfQ0KPiA+ICsg
ICAgICAgICAgICAgICBndC0+bWVtLmd0dF9tZ3IgPSB4ZS0+bWVtLmd0dF9tZ3I7DQo+ID4gICAg
ICAgICAgICAgICAgIGlmICghZ3QtPm1lbS5ndHRfbWdyKQ0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+ICAgICAgICAgfSBlbHNlIHsNCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV9ndHRfbWdyLmMNCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV90dG1fZ3R0X21nci5jDQo+ID4gaW5kZXggODA3NTc4MTA3MGYyLi4wNTMw
MGM3MTkyOGUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV9ndHRf
bWdyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX2d0dF9tZ3IuYw0KPiA+
IEBAIC05NCw2ICs5NCw5IEBAIHN0YXRpYyB2b2lkIHR0bV9ndHRfbWdyX2Zpbmkoc3RydWN0IGRy
bV9kZXZpY2UgKmRybSwNCj4gdm9pZCAqYXJnKQ0KPiA+ICAgICAgICAgc3RydWN0IHR0bV9yZXNv
dXJjZV9tYW5hZ2VyICptYW4gPSAmbWdyLT5tYW5hZ2VyOw0KPiA+ICAgICAgICAgaW50IGVycjsN
Cj4gPg0KPiA+ICsgICAgICAgaWYgKC0teGUtPm1lbS5pbnN0YW5jZSkNCj4gPiArICAgICAgICAg
ICAgICAgcmV0dXJuOw0KPiA+ICsNCj4gPiAgICAgICAgIHR0bV9yZXNvdXJjZV9tYW5hZ2VyX3Nl
dF91c2VkKG1hbiwgZmFsc2UpOw0KPiA+DQo+ID4gICAgICAgICBlcnIgPSB0dG1fcmVzb3VyY2Vf
bWFuYWdlcl9ldmljdF9hbGwoJnhlLT50dG0sIG1hbik7IEBADQo+ID4gLTExMywxOCArMTE2LDIw
IEBAIGludCB4ZV90dG1fZ3R0X21ncl9pbml0KHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdA0KPiA+
IHhlX3R0bV9ndHRfbWdyICptZ3IsDQo+ID4NCj4gPiAgICAgICAgIFhFX0JVR19PTih4ZV9ndF9p
c19tZWRpYV90eXBlKGd0KSk7DQo+ID4NCj4gPiAtICAgICAgIG1nci0+Z3QgPSBndDsNCj4gPiAt
ICAgICAgIG1hbi0+dXNlX3R0ID0gdHJ1ZTsNCj4gPiAtICAgICAgIG1hbi0+ZnVuYyA9ICZ4ZV90
dG1fZ3R0X21ncl9mdW5jOw0KPiA+IC0NCj4gPiAtICAgICAgIHR0bV9yZXNvdXJjZV9tYW5hZ2Vy
X2luaXQobWFuLCAmeGUtPnR0bSwgZ3R0X3NpemUgPj4NCj4gUEFHRV9TSElGVCk7DQo+ID4gKyAg
ICAgICBpZiAoIXhlLT5tZW0uaW5zdGFuY2UpIHsNCj4gPiArICAgICAgICAgICAgICAgbWdyLT5n
dCA9IGd0Ow0KPiA+ICsgICAgICAgICAgICAgICBtYW4tPnVzZV90dCA9IHRydWU7DQo+ID4gKyAg
ICAgICAgICAgICAgIG1hbi0+ZnVuYyA9ICZ4ZV90dG1fZ3R0X21ncl9mdW5jOw0KPiA+DQo+ID4g
LSAgICAgICB0dG1fc2V0X2RyaXZlcl9tYW5hZ2VyKCZ4ZS0+dHRtLCBYRV9QTF9UVCwgJm1nci0+
bWFuYWdlcik7DQo+ID4gLSAgICAgICB0dG1fcmVzb3VyY2VfbWFuYWdlcl9zZXRfdXNlZChtYW4s
IHRydWUpOw0KPiA+ICsgICAgICAgICAgICAgICB0dG1fcmVzb3VyY2VfbWFuYWdlcl9pbml0KG1h
biwgJnhlLT50dG0sIGd0dF9zaXplID4+DQo+ID4gKyBQQUdFX1NISUZUKTsNCj4gPg0KPiA+IC0g
ICAgICAgZXJyID0gZHJtbV9hZGRfYWN0aW9uX29yX3Jlc2V0KCZ4ZS0+ZHJtLCB0dG1fZ3R0X21n
cl9maW5pLCBtZ3IpOw0KPiA+IC0gICAgICAgaWYgKGVycikNCj4gPiAtICAgICAgICAgICAgICAg
cmV0dXJuIGVycjsNCj4gPiArICAgICAgICAgICAgICAgdHRtX3NldF9kcml2ZXJfbWFuYWdlcigm
eGUtPnR0bSwgWEVfUExfVFQsICZtZ3ItPm1hbmFnZXIpOw0KPiA+ICsgICAgICAgICAgICAgICB0
dG1fcmVzb3VyY2VfbWFuYWdlcl9zZXRfdXNlZChtYW4sIHRydWUpOw0KPiA+ICsgICAgICAgICAg
ICAgICBlcnIgPSBkcm1tX2FkZF9hY3Rpb25fb3JfcmVzZXQoJnhlLT5kcm0sIHR0bV9ndHRfbWdy
X2ZpbmksDQo+IG1ncik7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChlcnIpDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIGVycjsNCj4gPiArICAgICAgIH0NCj4gPiArICAgICAg
IHhlLT5tZW0uaW5zdGFuY2UgKys7DQo+ID4NCj4gPiAgICAgICAgIHJldHVybiAwOw0KPiA+ICB9
DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0K
