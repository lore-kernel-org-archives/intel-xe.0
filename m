Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C936ACE7AF1
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 09:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671FC10E009;
	Fri,  6 Sep 2024 09:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JpWSXbbQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5AC10E009
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725614727; x=1757150727;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=7PEEC9bLora5wHKoHEc/guIRkQ3W+kEeEP+wvv4gB9E=;
 b=JpWSXbbQGmwQqYB4S3TAKnWiKguGxdP6GkH23t3G9cp46qfO3BqaP1d9
 es3SL4cXV39pTK43w/mvpzDx/cOP3+b0/edeNNfbk0mDN7hvC0Fmk615/
 KbrDHCCEr8DIuAVoDsv+IjbeifnPtSKwHN/VbdizZOXZZkRwP2H/xejsd
 aIoduxsQzxaBrHAsce/IfgKkSKcnVvvvFvYIq1VeAu9wDvLDTdY3rP1YS
 HF7mNzX2+5svmdox12cE8+t+bAMpt1JcYKWxzc9dXBJh8Mt92LzZuqNHX
 14Q5lTgy1tnvnTVkpF/3ftJDgGKgCEkdiPOWdGNfvSjvbuEOkPoiA+yPe Q==;
X-CSE-ConnectionGUID: EQNMNRvHTVyiZPc7f7ja5g==
X-CSE-MsgGUID: DHVpbZMkTzSnDJZ7EgBhaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="27294325"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="27294325"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 02:25:26 -0700
X-CSE-ConnectionGUID: dojjGiH9T6CuAUfh/in0yA==
X-CSE-MsgGUID: qWVuexHyQlCbV7GLib5BbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="66641222"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 02:25:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 02:25:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 02:25:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 02:25:25 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 02:25:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSG+mlg+NMczEGSY2ohMJZ8KWjJUpXErtuBXTsVkG5xzVLBN3uZnMUav/CAnhzMIBNRsE94rAl/hmu2EmnDygPZf8/81zvlq1EUCxWMpLKt3PBhWcMQMckL1Tb1ZNuo5gcVuzmiL+S2iKzHL4ks+ZiU+eu2fJiYsvO4DX4dqfCkqPSK1g7HVECoaP1iC4iTkoDKrK60F3W+jvPFdrcd6Fzr7nRkdLvz7obm928krFPnfWvfZmbCwv/ZkaqAW91rRvKfNu+kDVz1gV6HZS+Cgi3GZuNwCx+jDwW9T3QSuuyYUMrJ/qH3LwxYsfQvd/yb7CecbRzFuwe9ZMia90vrnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PEEC9bLora5wHKoHEc/guIRkQ3W+kEeEP+wvv4gB9E=;
 b=WSKjh5ySF1kekqrCelttfA10bopDOM+Y5L327RvvXfbzEA4T0aXY/+4lr/kxPK4FrQX07thR4HS73uyGr7iunfTYmD/IRd3PcXZB3LSV3+DQ1nkNvegiHoXnCruBMlnLg4wn1BMhQuj9bYoJm2ftCLosuyjUhsAgyTzHddoK2cs1XFVbiPzlPDeWNhU/P7wJSJgk74BTe21x7hC07wZKur7P9BSZ6hn4xNYwDCx6c1XUsnOi1vAT85SpOLcBEpKvG63oou+imB4CTcEgtuNLckenBmFBB4F4k0xryEOur5cIreWbRdAIIi4EleMSS6pCzPmO43DCnIXCxgdgfgoWnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 09:25:23 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 09:25:23 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 2/4] drm/xe: Remove runtime argument from display s/r
 functions
Thread-Topic: [PATCH 2/4] drm/xe: Remove runtime argument from display s/r
 functions
Thread-Index: AQHa/6R1MZggT3cIbUi4l1RgWieUsLJKfhwA
Date: Fri, 6 Sep 2024 09:25:23 +0000
Message-ID: <a1c60333b0580411b72755ea67f301c2c261e962.camel@intel.com>
References: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
 <20240905150052.174895-3-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240905150052.174895-3-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|CY5PR11MB6209:EE_
x-ms-office365-filtering-correlation-id: dbcb8c3a-b133-41fe-9292-08dcce55d608
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cUgySEQ2dzBnVWRCaDVQM0x4ajA0NXhUaWFoY0JGc1Z1ZWlGVzlBV2xRUGQ1?=
 =?utf-8?B?TVB6YkJEMmN0N3VHTWdDWHBOVGUrMzN6d1VEYllXS3FTYlJmY3ZmcFF5Szdq?=
 =?utf-8?B?QlBBUjBKb09jSUI1ZnZkQlZUVEE2V0ZWaUV3Wkhqd0VGMkltamsyR1lLdk1n?=
 =?utf-8?B?a3UrQlh2NW8rbHdrd3hZZ3FMUE1DSDRqVHprOG5yUXlyR1Q4S3puWmppZGZH?=
 =?utf-8?B?Y212THBjbFpoOEU2TWgwR1h0T0hOS0NlOG5vRFR4dUNLaHlxb3pCK0c4SW1R?=
 =?utf-8?B?UHhXaEc0WU5kRm1rbFZseDlWUFVGd0ZHUmE3RFNsQUZSaE5JVDREajB4QjBI?=
 =?utf-8?B?M0FacFpzK1dhbTR4SGk0NHEyZTNPRFkvUi85cjEzbVBzK01rc0R3QWFESm1K?=
 =?utf-8?B?Rk9sTlJxalJEaENJSWFydkl0UENQeTJXS2VwQWpYZmxzZkI1Vkc5SUp5UFVt?=
 =?utf-8?B?UDBUUE9GN2NxajRFbXh4Ty9jWGE0VkRkTFpNVjJKR01rdG1rVDF3TDZtYXhi?=
 =?utf-8?B?SEU1aXVtbGRydWhKa04yWVdsR25EVWF1MmNicXBKRlhHK3JJSk4zMUszT1pH?=
 =?utf-8?B?cWppc2ZGV1hDVTl5bUZNdmcxK2ZsRU1FV3FzMHMxY1lXTjU4dVNTZVgrWU9D?=
 =?utf-8?B?MjhMTEFwWW9HZ0J1N3YwZkRBbEhoR25Zb2s5dnV4akFzY0xIWXdyTERrL0RE?=
 =?utf-8?B?NERDdUhZOGFqazhLd3NNUzJPaXZaWTFrVzBYWEZCcmtpam9qSFh5OE5hcVdO?=
 =?utf-8?B?OEliQ3NzaTJBVzU3Vm9BTE50WUhIMEtTb3lMbWtJV0d1M2hkeEZrMm55Y0NB?=
 =?utf-8?B?MFBJTGZVTUdoWnlZK2gvNmFaMHR1cW50WmJiYzVtWWJuMnhoU2Rkb1FxeHRN?=
 =?utf-8?B?SXdCUjRYZmdSZEh4aUxHRU1Lbk5XcVU4UnJCWHlVa3BtYUdOZXhVaXNsWFpC?=
 =?utf-8?B?OXQ4eDhiS2lKSmZGZXB0N1pOalI1OGpSOVpRRGlDbGppbk5QQzlhYURZODU4?=
 =?utf-8?B?OW9GU0tjU0phSnJUNS9rbTdJNWphMnNJdEVBODZaZlJBK3VvMkI3cUpXdS9F?=
 =?utf-8?B?Vi82VjVRYW1YVWZDRGk3WGUyVzRhQzQ2Vnlkajg2d1hTSHJDczFnYnlFbSt1?=
 =?utf-8?B?WUtzU3pRUVZaWFB0WUs2T2d2ektqVjVtYlB3cVAzV3BwU0tXRWRPR2xZNUxO?=
 =?utf-8?B?cjNJQTNocWhPZU5iLzRrQXN1NXFYYXJFYmJkdDVUZmlFUDVkLzlmdVhmWWE3?=
 =?utf-8?B?dWcxWkNpeUtBQzNxaks5NTdzaTBHOGxrOThPRGVEWFU0ZHVkOHNqRW5XYkFF?=
 =?utf-8?B?QXVkYVFjUlRNdEFtMTFTZkZWU2ZoL0F5Zi92MldlVy81ZlBFOGZvR2VEbWpY?=
 =?utf-8?B?WVVJdFlGeE9SakZMOXlxNlBkZXYxeHJZbzk2UTVNZ1VadGZUMzBHaVdQcjAw?=
 =?utf-8?B?Uko4NHUzQ2RZRFZQdUNGUXZka2J2bUQ2TDc4NlVZWCtFa3lnaUhzRGxxSkh1?=
 =?utf-8?B?WllqSWxEMENTYSt1Zy9QZ2pCS2l6QVFoQTBUcjFDb3RkOE9CVHZ4ZktVbndh?=
 =?utf-8?B?NDlBS1hndnlYeDVuMUJxc21FQ0hwRXRHRzFTbFVKZ1ljWjhDbmNycjFaNHhG?=
 =?utf-8?B?bHdEbUs0YjBuYWZNRzdDSkZnWU1KQjBzcUtITjBOMlp3d2l0ZEZ3M1RJbmZi?=
 =?utf-8?B?YWFjaDNoTjZqYm5ObG50ZER5dlZLRjNkL0FDMGlidFpRWmJhcmxPTGh2dmQ0?=
 =?utf-8?B?Z1Nua2tDK3RZU0Z3OEpkVkhuMXhjTUtEMHZZL1hNVkJOdlpkWGZseFJTa1BX?=
 =?utf-8?B?QUFjS3dMZG9nNGUvYWovZU82QnJ0RkVTd3dYRVBxTnFOMHlJNHdxSThXODdF?=
 =?utf-8?B?cG1ObXJ1Rm1XOFFsMno2b0xjRlJIV2JrRWdtd1J0QS9nNEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWR4Y2ZyTDlNc2cvVyt3cmRpT3FsRHpyNUt1VjBoV3pzM2tYeE95amhWZkFq?=
 =?utf-8?B?NFd6TFJqZUVNZWltbEtic3ZENlFwVi95SGFNRTFtMThQa2xHdU9QREtyWlph?=
 =?utf-8?B?aGNFU09pQkUwQmxyZk0rRjdjVHFlZU9YMDlLNmNTUXlxcE5sakRqV3IzbFcx?=
 =?utf-8?B?Tkp1bEpySzNoVUJNWmZsTEhnQ09HdVhydmIzeXVpM1lhZ0JSdXRlbFpPNXdw?=
 =?utf-8?B?cm1RcEdGbGZ4N3RyTTJHclZTd2ZScmNlMDJKbnF1M3FxZTI0T2JhbUF3T0RB?=
 =?utf-8?B?NWdHbkorNTVZeXpBM2IycHdXQVZpZUJRZUFCNFkzdGp0TGJNZXMvenRPSHdx?=
 =?utf-8?B?SGo5SjQ1TGRoZmRMekRFSVZYR0tCZVdPUE81eFFtYlNhVTdpckxuTHdabjIz?=
 =?utf-8?B?bVByMGJCTlFYaGFLTkV6bDhtTHFXTTU0a2Frdlo3QkhKSnpDT0ZCKzNEMWZF?=
 =?utf-8?B?RUFZZG9hak5CVDRQeFZiQmlTcVh4ZU4ydGdWMzJ6dU9PbnlDQjJqaG9pSDRw?=
 =?utf-8?B?SnhXek5NMGZtZDltQUtScEQvSU1NMUgzZXlOMHNSS1RpMjVXQUdGRFhlRU1P?=
 =?utf-8?B?V3lxYytPM0lEYnVFNjZaWW94dkxtNXFpeTdQdXJBVzhkQkVFd1U5eGVoMldm?=
 =?utf-8?B?Y0ZuMWFobkt0bVVFVzZ5TXV1SHFCYS9jR3VqcVJuNDlwL01Qb01rdzQyS24z?=
 =?utf-8?B?OGE2Si9MQ3Jid0xPWi9uaTI4dVkyMExxa2pDKytJdGdwQlJFWjg2WjRGTVpy?=
 =?utf-8?B?Z2Z0YTc3akZBb20wczloajZaVXNZaEU0Q2IvZ1N1ejVRL0R0YWhRTFRBT1Ey?=
 =?utf-8?B?SDJpNEdRMXB4TXhSMDlVc1Q3TTlwTUEySnBoRVNZQXBjTXQzbEhhN3RJbEpH?=
 =?utf-8?B?NmZvU2tJOGVNWUo3SzFnQUZTbTlWVHZJRnVqSWdhRU0zQ1Vhajk1K2phWXRu?=
 =?utf-8?B?NGFlWlIrK3ZmNmVaQi9XelJMOE5hdWhuOVQ3RDRZNDhVdGoxL1lLckpNWUpG?=
 =?utf-8?B?QzZabXhSRzU4c3ZIeURmdW9mODJRRE9ObWc0dHUwYkhvdlNUeFdlczJsemFO?=
 =?utf-8?B?dkpwZ3pjTTgxU3pKV2lLUEVzNHJzQzV5N3dJVUVzZjBVMDJ5bEY4MUZMMlNG?=
 =?utf-8?B?T3ZxS0U1TkQ2cUVDazVWbG1Rdk5jZVpBMkhlSVcrellrS3cwT1luQk1WL3dj?=
 =?utf-8?B?emUwNDh1MjRvb0Z5YkM2eTBiakFuekhNMWU4RmJHZEdoWURyK1FSSXJBbVhn?=
 =?utf-8?B?TmZ2RGxxNXU4S29rVUdZWlYxMzBrL0ZsUGdRMUpzWlExNXBqa2VuSXMrc2cv?=
 =?utf-8?B?Z0F3UjFpVDUrS1VPdWt5YXN5MTJjYk5Pd204WmZseDZrMmhGQ21RUzJNRzJ5?=
 =?utf-8?B?T0RFVGhZT3QzTlB0aHhuQnhuVGVycFNjRFN5OWdJbWJ4MVZPUE9NVWkxTk4v?=
 =?utf-8?B?bnRud1p2RXdzYy8vMDRxM1JYVUk3ZUxmRjRtVGg5Wjd1azIxLzFzZjJXRWxW?=
 =?utf-8?B?SHAyK2prWG1pUTg1eFNYYnFySmw4c2FNRlZsbGVKN3hNbm54VWllb0hnN0gx?=
 =?utf-8?B?WkU4SmVRRjM0VWFoNGpTbTlOck4yWHlqWklFSzQyek1LQnZoWmNUT3V6Tmpi?=
 =?utf-8?B?cHlpVmh5dHgwKzBrQjRIcFY4c2NGN09rL0pvcmxxUVpiaUthQzhwSGo3VlZZ?=
 =?utf-8?B?L0NKcldLa2NRQUh2eUJ6ZmJaanVnaTB5MEZwVjJXNXczVUd2eUFDTzc2NXFj?=
 =?utf-8?B?ZEV2WEtVWGt3OG9HYjhlY0taSEtnNmU3VjZMNDc4SDVUYzd2cnBRMTlEMzlP?=
 =?utf-8?B?VDBIcWR4cmt2Zk9mY2lCdStZdlpyQlhYdzFDL1pHSCtETFJleHZKcTlrVFFu?=
 =?utf-8?B?a1VXWVg1ODRTWkM1cEN4NUxBcHgyQzBiTE04aWhRd2grMzBMd1lMUEMyL2Zv?=
 =?utf-8?B?aEVlVFdPNlo3SlhPWkpzSkxxRXd2RHJkRWJ6cDViNnBVUzRsa0hUSVl6azV6?=
 =?utf-8?B?Q1Rodis4UTlCUVNvQU85NktlYlFTYmpJZlhNTzZQcDkvcGRtUzNCaFh5RTJT?=
 =?utf-8?B?dGRsS3RFWWt6cWc5NlovaEp3UE1kRi9QY2pETEhJWk5jOGhCTXM5cFhEdEdE?=
 =?utf-8?B?Q0U2enJrYWI1Um5Cbm1lRXZsOXFEYjRJN2ZlSVBmczZTYW9UL1d4SW5ibnRo?=
 =?utf-8?Q?OEiInHC1XvfFYizB+JezcPY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05CD747E95BB02469D73B1A8B46A47A8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcb8c3a-b133-41fe-9292-08dcce55d608
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 09:25:23.7780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P0EYZs26dTfDrs5ivvPF1wt/ffnXgnWcKH2zaCIqQ3OIHho2zr8TtwlndxYc8EDg7ezNpKr/jDY8c7V18cqKfkTVFwyAgU4+f5IcW1v+/VU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6209
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

T24gVGh1LCAyMDI0LTA5LTA1IGF0IDE3OjAwICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToKPiBUaGUgcHJldmlvdXMgY2hhbmdlIGVuc3VyZXMgdGhhdCBwbV9zdXNwZW5kIGlzIG9ubHkg
Y2FsbGVkIHdoZW4KPiBzdXNwZW5kaW5nIG9yIHJlc3VtaW5nLiBUaGlzIGVuc3VyZXMgbm8gZnVy
dGhlciBidWdzIGxpa2UgdGhvc2UKPiBpbiB0aGUgcHJldmlvdXMgY29tbWl0Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmMg
fCA1MyArKysrKysrKysrKysrKystLS0tLS0tLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUvZGlz
cGxheS94ZV9kaXNwbGF5LmggfMKgIDggKystLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bt
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNiArLS0KPiDCoDMgZmlsZXMgY2hhbmdl
ZCwgMzkgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCgpOaWNlIHNvbHV0aW9uISBUaGFu
a3MKUmV2aWV3ZWQtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlA
aW50ZWwuY29tCgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94
ZV9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmMKPiBp
bmRleCBjMGU5YWE3YTI3NGYxLi4zMzA3MWFjM2JjMTJkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS9kaXNwbGF5L3hlX2Rpc3BsYXkuYwo+IEBAIC0zMTAsMTggKzMxMCw3IEBAIHN0YXRpYyB2b2lk
IHhlX2Rpc3BsYXlfZmx1c2hfY2xlYW51cF93b3JrKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQo+IMKg
fQo+IMKgCj4gwqAvKiBUT0RPOiBTeXN0ZW0gYW5kIHJ1bnRpbWUgc3VzcGVuZC9yZXN1bWUgc2Vx
dWVuY2VzIHdpbGwgYmUgc2FuaXRpemVkIGFzIGEgZm9sbG93LXVwLiAqLwo+IC12b2lkIHhlX2Rp
c3BsYXlfcG1fcnVudGltZV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQo+IC17Cj4gLcKg
wqDCoMKgwqDCoMKgaWYgKCF4ZS0+aW5mby5wcm9iZV9kaXNwbGF5KQo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm47Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoGlmICh4ZS0+ZDNj
b2xkLmFsbG93ZWQpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2Rpc3BsYXlf
cG1fc3VzcGVuZCh4ZSwgdHJ1ZSk7Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoGludGVsX2hwZF9wb2xs
X2VuYWJsZSh4ZSk7Cj4gLX0KPiAtCj4gLXZvaWQgeGVfZGlzcGxheV9wbV9zdXNwZW5kKHN0cnVj
dCB4ZV9kZXZpY2UgKnhlLCBib29sIHJ1bnRpbWUpCj4gK3N0YXRpYyB2b2lkIF9feGVfZGlzcGxh
eV9wbV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBib29sIHJ1bnRpbWUpCj4gwqB7Cj4g
wqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gJnhlLT5kaXNw
bGF5Owo+IMKgwqDCoMKgwqDCoMKgwqBib29sIHMyaWRsZSA9IHN1c3BlbmRfdG9faWRsZSgpOwo+
IEBAIC0zNTYsMjYgKzM0NSwzMSBAQCB2b2lkIHhlX2Rpc3BsYXlfcG1fc3VzcGVuZChzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSwgYm9vbCBydW50aW1lKQo+IMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9kbWNf
c3VzcGVuZCh4ZSk7Cj4gwqB9Cj4gwqAKPiAtdm9pZCB4ZV9kaXNwbGF5X3BtX3N1c3BlbmRfbGF0
ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkKPiArdm9pZCB4ZV9kaXNwbGF5X3BtX3N1c3BlbmQoc3Ry
dWN0IHhlX2RldmljZSAqeGUpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBfX3hlX2Rpc3BsYXlfcG1f
c3VzcGVuZCh4ZSwgZmFsc2UpOwo+ICt9Cj4gKwo+ICt2b2lkIHhlX2Rpc3BsYXlfcG1fcnVudGlt
ZV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQo+IMKgewo+IC3CoMKgwqDCoMKgwqDCoGJv
b2wgczJpZGxlID0gc3VzcGVuZF90b19pZGxlKCk7Cj4gwqDCoMKgwqDCoMKgwqDCoGlmICgheGUt
PmluZm8ucHJvYmVfZGlzcGxheSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybjsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoGludGVsX3Bvd2VyX2RvbWFpbnNfc3VzcGVuZCh4
ZSwgczJpZGxlKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoeGUtPmQzY29sZC5hbGxvd2VkKQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBfX3hlX2Rpc3BsYXlfcG1fc3VzcGVuZCh4ZSwg
dHJ1ZSk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBpbnRlbF9kaXNwbGF5X3Bvd2VyX3N1c3BlbmRf
bGF0ZSh4ZSk7Cj4gK8KgwqDCoMKgwqDCoMKgaW50ZWxfaHBkX3BvbGxfZW5hYmxlKHhlKTsKPiDC
oH0KPiDCoAo+IC12b2lkIHhlX2Rpc3BsYXlfcG1fcnVudGltZV9yZXN1bWUoc3RydWN0IHhlX2Rl
dmljZSAqeGUpCj4gK3ZvaWQgeGVfZGlzcGxheV9wbV9zdXNwZW5kX2xhdGUoc3RydWN0IHhlX2Rl
dmljZSAqeGUpCj4gwqB7Cj4gK8KgwqDCoMKgwqDCoMKgYm9vbCBzMmlkbGUgPSBzdXNwZW5kX3Rv
X2lkbGUoKTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCF4ZS0+aW5mby5wcm9iZV9kaXNwbGF5KQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+IMKgCj4gLcKgwqDCoMKg
wqDCoMKgaW50ZWxfaHBkX3BvbGxfZGlzYWJsZSh4ZSk7Cj4gK8KgwqDCoMKgwqDCoMKgaW50ZWxf
cG93ZXJfZG9tYWluc19zdXNwZW5kKHhlLCBzMmlkbGUpOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKg
aWYgKHhlLT5kM2NvbGQuYWxsb3dlZCkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
eGVfZGlzcGxheV9wbV9yZXN1bWUoeGUsIHRydWUpOwo+ICvCoMKgwqDCoMKgwqDCoGludGVsX2Rp
c3BsYXlfcG93ZXJfc3VzcGVuZF9sYXRlKHhlKTsKPiDCoH0KPiDCoAo+IMKgdm9pZCB4ZV9kaXNw
bGF5X3BtX3Jlc3VtZV9lYXJseShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkKPiBAQCAtMzg4LDcgKzM4
Miw3IEBAIHZvaWQgeGVfZGlzcGxheV9wbV9yZXN1bWVfZWFybHkoc3RydWN0IHhlX2RldmljZSAq
eGUpCj4gwqDCoMKgwqDCoMKgwqDCoGludGVsX3Bvd2VyX2RvbWFpbnNfcmVzdW1lKHhlKTsKPiDC
oH0KPiDCoAo+IC12b2lkIHhlX2Rpc3BsYXlfcG1fcmVzdW1lKHN0cnVjdCB4ZV9kZXZpY2UgKnhl
LCBib29sIHJ1bnRpbWUpCj4gK3N0YXRpYyB2b2lkIF9feGVfZGlzcGxheV9wbV9yZXN1bWUoc3Ry
dWN0IHhlX2RldmljZSAqeGUsIGJvb2wgcnVudGltZSkKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKg
c3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPSAmeGUtPmRpc3BsYXk7Cj4gwqAKPiBAQCAt
NDIyLDYgKzQxNiwyMyBAQCB2b2lkIHhlX2Rpc3BsYXlfcG1fcmVzdW1lKHN0cnVjdCB4ZV9kZXZp
Y2UgKnhlLCBib29sIHJ1bnRpbWUpCj4gwqDCoMKgwqDCoMKgwqDCoGludGVsX3Bvd2VyX2RvbWFp
bnNfZW5hYmxlKHhlKTsKPiDCoH0KPiDCoAo+ICt2b2lkIHhlX2Rpc3BsYXlfcG1fcmVzdW1lKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgX194ZV9kaXNwbGF5X3Bt
X3Jlc3VtZSh4ZSwgZmFsc2UpOwo+ICt9Cj4gKwo+ICt2b2lkIHhlX2Rpc3BsYXlfcG1fcnVudGlt
ZV9yZXN1bWUoc3RydWN0IHhlX2RldmljZSAqeGUpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBpZiAo
IXhlLT5pbmZvLnByb2JlX2Rpc3BsYXkpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldHVybjsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaW50ZWxfaHBkX3BvbGxfZGlzYWJsZSh4ZSk7
Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlmICh4ZS0+ZDNjb2xkLmFsbG93ZWQpCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoF9feGVfZGlzcGxheV9wbV9yZXN1bWUoeGUsIHRydWUpOwo+
ICt9Cj4gKwo+ICsKPiDCoHN0YXRpYyB2b2lkIGRpc3BsYXlfZGV2aWNlX3JlbW92ZShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB2b2lkICphcmcpCj4gwqB7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVj
dCB4ZV9kZXZpY2UgKnhlID0gYXJnOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
ZGlzcGxheS94ZV9kaXNwbGF5LmggYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNw
bGF5LmgKPiBpbmRleCA1M2Q3MjdmZDc5MmI0Li5iZWQ1NWZkMjZmMzA0IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXkuaAo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXkuaAo+IEBAIC0zNCwxMCArMzQsMTAgQEAgdm9p
ZCB4ZV9kaXNwbGF5X2lycV9lbmFibGUoc3RydWN0IHhlX2RldmljZSAqeGUsIHUzMiBndV9taXNj
X2lpcik7Cj4gwqB2b2lkIHhlX2Rpc3BsYXlfaXJxX3Jlc2V0KHN0cnVjdCB4ZV9kZXZpY2UgKnhl
KTsKPiDCoHZvaWQgeGVfZGlzcGxheV9pcnFfcG9zdGluc3RhbGwoc3RydWN0IHhlX2RldmljZSAq
eGUsIHN0cnVjdCB4ZV9ndCAqZ3QpOwo+IMKgCj4gLXZvaWQgeGVfZGlzcGxheV9wbV9zdXNwZW5k
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBib29sIHJ1bnRpbWUpOwo+ICt2b2lkIHhlX2Rpc3BsYXlf
cG1fc3VzcGVuZChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7Cj4gwqB2b2lkIHhlX2Rpc3BsYXlfcG1f
c3VzcGVuZF9sYXRlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsKPiDCoHZvaWQgeGVfZGlzcGxheV9w
bV9yZXN1bWVfZWFybHkoc3RydWN0IHhlX2RldmljZSAqeGUpOwo+IC12b2lkIHhlX2Rpc3BsYXlf
cG1fcmVzdW1lKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBib29sIHJ1bnRpbWUpOwo+ICt2b2lkIHhl
X2Rpc3BsYXlfcG1fcmVzdW1lKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsKPiDCoHZvaWQgeGVfZGlz
cGxheV9wbV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IHhlX2RldmljZSAqeGUpOwo+IMKgdm9pZCB4
ZV9kaXNwbGF5X3BtX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsKPiDCoAo+
IEBAIC02NSwxMCArNjUsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIHhlX2Rpc3BsYXlfaXJxX2Vu
YWJsZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTMyCj4gZ3VfbWlzY19paXIpCj4gwqBzdGF0aWMg
aW5saW5lIHZvaWQgeGVfZGlzcGxheV9pcnFfcmVzZXQoc3RydWN0IHhlX2RldmljZSAqeGUpIHt9
Cj4gwqBzdGF0aWMgaW5saW5lIHZvaWQgeGVfZGlzcGxheV9pcnFfcG9zdGluc3RhbGwoc3RydWN0
IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV9ndCAqZ3QpIHt9Cj4gwqAKPiAtc3RhdGljIGlubGlu
ZSB2b2lkIHhlX2Rpc3BsYXlfcG1fc3VzcGVuZChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgYm9vbCBy
dW50aW1lKSB7fQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgeGVfZGlzcGxheV9wbV9zdXNwZW5kKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlKSB7fQo+IMKgc3RhdGljIGlubGluZSB2b2lkIHhlX2Rpc3BsYXlf
cG1fc3VzcGVuZF9sYXRlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKSB7fQo+IMKgc3RhdGljIGlubGlu
ZSB2b2lkIHhlX2Rpc3BsYXlfcG1fcmVzdW1lX2Vhcmx5KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKSB7
fQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgeGVfZGlzcGxheV9wbV9yZXN1bWUoc3RydWN0IHhlX2Rl
dmljZSAqeGUsIGJvb2wgcnVudGltZSkge30KPiArc3RhdGljIGlubGluZSB2b2lkIHhlX2Rpc3Bs
YXlfcG1fcmVzdW1lKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKSB7fQo+IMKgc3RhdGljIGlubGluZSB2
b2lkIHhlX2Rpc3BsYXlfcG1fcnVudGltZV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKSB7
fQo+IMKgc3RhdGljIGlubGluZSB2b2lkIHhlX2Rpc3BsYXlfcG1fcnVudGltZV9yZXN1bWUoc3Ry
dWN0IHhlX2RldmljZSAqeGUpIHt9Cj4gwqAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYwo+IGluZGV4IDliMTIwNGRi
MTJjM2QuLjk2MGVkNTBlM2E0MWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3BtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYwo+IEBAIC0xMjMsNyArMTIz
LDcgQEAgaW50IHhlX3BtX3N1c3BlbmQoc3RydWN0IHhlX2RldmljZSAqeGUpCj4gwqDCoMKgwqDC
oMKgwqDCoGZvcl9lYWNoX2d0KGd0LCB4ZSwgaWQpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB4ZV9ndF9zdXNwZW5kX3ByZXBhcmUoZ3QpOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKg
eGVfZGlzcGxheV9wbV9zdXNwZW5kKHhlLCBmYWxzZSk7Cj4gK8KgwqDCoMKgwqDCoMKgeGVfZGlz
cGxheV9wbV9zdXNwZW5kKHhlKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAvKiBGSVhNRTogU3Vw
ZXIgcmFjZXkuLi4gKi8KPiDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVfYm9fZXZpY3RfYWxsKHhl
KTsKPiBAQCAtMTMzLDcgKzEzMyw3IEBAIGludCB4ZV9wbV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZp
Y2UgKnhlKQo+IMKgwqDCoMKgwqDCoMKgwqBmb3JfZWFjaF9ndChndCwgeGUsIGlkKSB7Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9ndF9zdXNwZW5kKGd0KTsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChlcnIpIHsKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2Rpc3BsYXlfcG1fcmVzdW1lKHhl
LCBmYWxzZSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB4ZV9kaXNwbGF5X3BtX3Jlc3VtZSh4ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnI7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB9Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiBAQCAtMTg3LDcgKzE4Nyw3IEBAIGludCB4
ZV9wbV9yZXN1bWUoc3RydWN0IHhlX2RldmljZSAqeGUpCj4gwqDCoMKgwqDCoMKgwqDCoGZvcl9l
YWNoX2d0KGd0LCB4ZSwgaWQpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9n
dF9yZXN1bWUoZ3QpOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgeGVfZGlzcGxheV9wbV9yZXN1bWUo
eGUsIGZhbHNlKTsKPiArwqDCoMKgwqDCoMKgwqB4ZV9kaXNwbGF5X3BtX3Jlc3VtZSh4ZSk7Cj4g
wqAKPiDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVfYm9fcmVzdG9yZV91c2VyKHhlKTsKPiDCoMKg
wqDCoMKgwqDCoMKgaWYgKGVycikKCg==
