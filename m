Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C279606A887
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XSMk51eI;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=MRQR6wUY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1B510E4C4;
	Tue, 17 Nov 2026 09:27:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0815A10E4C4
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 09:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794907630; x=1826443630;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ut6klF2dmeBoAGxr1Y+crNjSvkY+fgT0iXW1g6pdLss=;
 b=XSMk51eID5EKEwAroeBhpl7dkQCCjbV8GMV3G1joq245J5K1HkzQA+PZ
 Zql4rBCRBXHCB247YfRQQllP/rxxvPOOEoN87gmbCafT64PGslDV5fKeS
 j4KHy8ZCFjVwFdWjNrL1891KlvK1fUGaBOmjuYzOTNvKF0C5kiIt/EPa5
 N7P6yTqDNv+ol0Cp5KXBHMLKm47g0IfjwBwjps9vUl4RlCVftfHG91Q6M
 lvohslHpSnNrh5anigpDBu845oel+VbWnHdhRuWj2PpsCoF6J9+ezNlRn
 De0XDGgAwFZE5Q29wj59A9L8HCEOxZYp4DeZh/7ZYE2bMqrMKCAIV6M8W w==;
X-CSE-ConnectionGUID: /HiqYr0QQ2eMD1R7QUNSYA==
X-CSE-MsgGUID: 5uaBh8bLSsyfNSD4iquznQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3753003"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3753003"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 01:27:09 -0800
X-CSE-ConnectionGUID: +uaAUM4wQ1uMomUkFnWmCw==
X-CSE-MsgGUID: nXZZV9qiStGyAMHrBrWf0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10009714"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 01:27:09 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 01:27:08 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 01:27:08 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 01:27:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfIhVGx3YQtEWcVcGvm2U5l36q8veftza7tPSD9kI+ZAQ7GUsJW26psq4BnnFcRy3Y2nf0236wC9xUeHS/Fa5/XGmTJAorbpApMhib1BnEkusyTJbe4wxsfIY0rhN/PE60YUweW759MObqe4O/nihW7nWUqp3+7/sKpZeHXZ0frbzpeQySVhw+XVJ1CSs3xqA/CWf+7BBl5OWOEbIbVQW8AzYQjeBIru4bPXlF+iitaDVCsATRn5y5iWudGzmyJZH1aZgwjudM6bIxUsKEw9LUb0GyUsPrq6Hi2b9AHle/DR07MJdXlKKb4MXTAQEm+bDKPb1ekMAcwBt1rfvATOZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mpmnd4LzJrcsfrOH8IQ/Z1yBGKxloGPrDXVhnLPHRqg=;
 b=E1lJnjeAeb/Bljvbu9Oy97VaGtFpj44zz7+8Ccg2Q9ZHRNKg0+wobO9FUfKqjhaKB9Gjb932T5f+dRDZLmvsxVb6XBqiGOtHsaAF24sjmssYxazLUeqFr7Kxv4prqMLqMaoMHIRWORDsk+b9EzxieXAV5ekQp7jnTihyrWgup88XIgTHAJl7xXZ7KMh/S/bvCswZqg4dKXmQyoXndeq3A0396YCU+HISEwTpv9tTN8+SBSIVj+fehBRpEKW6+JeecnCahwEycBQVRDNvPSCj8kof8V3I8Zj75OjslAvr2nTf60hWtZ3TZYtJgGyZYJioyzCVjOGWHQXmnVaTU3ViNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mpmnd4LzJrcsfrOH8IQ/Z1yBGKxloGPrDXVhnLPHRqg=;
 b=MRQR6wUYeOJNDrZgaS+PW4qqS0J57MpqrMPIKX7f+dvYjCCWD126WBS8mUUlNNRpViDEHqiIG12SC2t/25kxaghhEQ0uR0RzGPRcCwPh9MTdNVCKQA0trVb3ttuSw/8nTFFw91TSF5bxTNlt2S4ZPF7llIkoyUzjQz/GLMKqvWg=
Received: from DM3PPF4C5964328.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f1e) by DS7PR11MB6080.namprd11.prod.outlook.com
 (2603:10b6:8:84::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 09:27:00 +0000
Received: from DM3PPF4C5964328.namprd11.prod.outlook.com
 ([fe80::2eab:ee79:1a42:8a2e]) by DM3PPF4C5964328.namprd11.prod.outlook.com
 ([fe80::2eab:ee79:1a42:8a2e%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 09:27:00 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Charles, Daniel"
 <daniel.charles@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>
Subject: RE: [PATCH] drm/xe: fix UAF race between exec-queue teardown and GuC
 CT pause-abort
Thread-Topic: [PATCH] drm/xe: fix UAF race between exec-queue teardown and GuC
 CT pause-abort
Thread-Index: AQHdc3wNW904rLqauU+F9Hqi2hVXBLcsJ8oAgAXcN0A=
Date: Tue, 17 Nov 2026 09:27:00 +0000
Message-ID: <DM3PPF4C596432883230DF23AE1808AED75817B2@DM3PPF4C5964328.namprd11.prod.outlook.com>
References: <20261113132149.2989667-2-tejas.upadhyay@intel.com>
 <avcy5lJdRge/D8qm@gsse-cloud1.jf.intel.com>
In-Reply-To: <avcy5lJdRge/D8qm@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: daniel.charles@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF4C5964328:EE_|DS7PR11MB6080:EE_
x-ms-office365-filtering-correlation-id: 35870f83-8332-4550-0c11-08df448ceee5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261021123027099003|261022105027099003|261102123227099003|38070700021|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003;
x-microsoft-antispam-message-info: qFtFCfQIcyqLE+viqCBWeLcU8FkrO8nM1mS9vLQ+BbzBOXgXE6c9gYKGsDJslYciHWjIiE4o/y6mzV2bwVR5WRkzyg/9jYVhOQBtw9nAN59Uxk+c7kEQ6rSbzlemHXFtKAD3jvPt1Kao92GQcIq44IqLCvEyGEbkR0OlmuA9IH99fNchGgP4jUtnIVULlpBSDvbqoMLEVHxanltFSFZqt/MamSD+2HJgUH5wFhB4UFWFK5kFJvMKpH+Uzuk6J8oWxzAYU/mW/5T2B4A6g/d5mXNc1imCzqfQxFqIt38mCeP2SS2Ru7OYzYAJbMksLRvjq2gUWlTK8g+dcWYpNfIL/AZqUeTAn6d9jdOSjToM0YdTo4zGbxvRfLD90Kt3xypZ8j1n4xyd3XUpnp59ASpHa6VVzAs6RkOo3H7oDPz861GJKzgErCFBBrCrIn+WZQOMSMSypACFS2m78lvw19biAzn4YSGo3OxWYH8L1+rJWAlT9jgY5jigcTpzXCT03FrnTiOGmOvfb0G73J8e6wbzENICPdUYW+tz/3mg8CWqc4L2A9YPlEi/4/LRRV7fcZMN35zsfZcmqTixP2hlkuXJ9R8Zf3GUvo84Fgccm2gI3bWX0D7iWPpghN+baYn4wRCZqxPTHCIDZ5dYShN5v7xIFOxOvbYC02C5Cioc8dZg3vA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF4C5964328.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1slDg8lmRG7BXANcIJjmf2uQ67j9iV8XicVSpgWNNRagNRkkB/YR9Q3W25C/?=
 =?us-ascii?Q?3/CCIEvi+EvsxwJJxjRDCbBvvH4AE94mLWmIQkQAqLhJrFPQyTOBKaVgTvAZ?=
 =?us-ascii?Q?CJfJiTEHVWSylfAjdwT8RaEr5WOjomZQv4dtBQPVieo66IfP1LHUK9PJVlB3?=
 =?us-ascii?Q?RZJUeQ2w9IuBRDXl0Ki5O19uP1ZZ08kWl25rMuUu3RO2t96hRlLZuRn3KTvS?=
 =?us-ascii?Q?CPQwJmKWL3jqEww4ngAL5FQnDEu8CBXj1WwwGOV8VfIpujm6kjR0TOyTbzXS?=
 =?us-ascii?Q?HlWw3PoDAUvz25C6mv9hE6mJWpv0Ic7jCZGuwGnltPkU2+6zGA2JrI/YRUuN?=
 =?us-ascii?Q?QrBoZhTpEuksfNd6THju0xJju6ggI+rzq5/pKKaN2uw+Ym7/xdMCjhvDHkmF?=
 =?us-ascii?Q?fw/bk7cdFin/aVJzFt9wl3AXDLGKkE1av0NjcgeBoUYQ9jdUXxY18gQyqwHf?=
 =?us-ascii?Q?tEOosRjOoJsS8wPURWaiQdHXahXI31uD9PqMao5A330UMjz1dGT1b5QHYJ8I?=
 =?us-ascii?Q?4QSSba8LYPHxuHzPAJySYrxRbu91wwsgm7zNiF/AqN+Viet8s+3Cg/VkClme?=
 =?us-ascii?Q?L5tH0Z83T0bl0fOkHhrh50yf8rJRI8G8j0lLVSWmZB40exf4rNt2J3Gc+XAg?=
 =?us-ascii?Q?jrsnm+Rzd3KjfKp0ahDAZIsy2So/31GF6q1FV2Lfmpqx3llNF4LLZnBRANIx?=
 =?us-ascii?Q?kvaqLGP5osTzLVdjqWDL+FDmh3F+bsHaOdpVxawd5RRSHS7+7hDJHWUndZWb?=
 =?us-ascii?Q?tGkBDua5o3xSghrGn28gASSAHZRi97l79uPcGiGRQRM2UWsXdKkgSfoKaxk7?=
 =?us-ascii?Q?0UAX18n4GC07BcmMZvAMfAW9Zm5O+DLRgKrO7cvtKPAeas4SWqXE65/76PKz?=
 =?us-ascii?Q?o7KDGoaaaXAwXJZdqeTCegHb6JneDu/Xhi7rqENJj1WjdPW14RVlhWxE/Q2z?=
 =?us-ascii?Q?RyLM5pnn6rceby4N5pb6d2CYI4mGdEVoOcx1AfbD3HkNyndpJCbzDdJ5KWv9?=
 =?us-ascii?Q?O2vQdGCPfwkpuOaihl4dAXLtLAsfCRGo+U5vupqXh0qZxWsHrTkvPWx8Ip7y?=
 =?us-ascii?Q?65MVTSbUwTPNxtVZwBgWufPyzPlkyeYFK6iF3PwASE8xs1STFqRiFlSxsSwq?=
 =?us-ascii?Q?qwtEb9kcJgbeLK8g8wC30eSD/nzOxifT5BMx+CbiLv9K0gOnf1C52BFidRPM?=
 =?us-ascii?Q?wlj62vh95+RXbRJaedRHxt+NvdKpguAPEqRGjRiyLjnuBBgaST0leSzWQwg5?=
 =?us-ascii?Q?R7dENrshyZ1Hw+d7+Ad07sEObimEqLi6mHQctiHSp7+RcJx0tTowFQY/Ugcd?=
 =?us-ascii?Q?o6asQsRdtq8YyE0cecDCf0wmP+SWpIHa4S20kzRH4BiccQB12z2BqWY8wPBU?=
 =?us-ascii?Q?KmCcPuXuK+xG7YtYqE4mg8mgDqxqBL9VDFpJcZy8DgjLYhB47UjyH9dDbchk?=
 =?us-ascii?Q?uRREstocJPbqI7trcBwRwXpfGuFste52OQnwMRLXLll8DOODGIwd74I9Dcpf?=
 =?us-ascii?Q?O9D8jXJKwD24UgJo7gkyAx8OJMVrB/3y1M34qno32MkF1tFN9+IHTwn99ny/?=
 =?us-ascii?Q?uHkOks4tBnrQREaTzT9ubmmCkY2W+XSO006rMvpypFmrpOSxtXGbXaL1anug?=
 =?us-ascii?Q?XILWFpFwxDXKfoJY6bVUNcW98o0IMQc4Xx1rAWu0v6CApMEPwsTrO3AtZedr?=
 =?us-ascii?Q?yolcsPLME55wmS/32RW6ql14Qg5lUMFUqSm4n1rSraQDzpnhaIocXmehZJUp?=
 =?us-ascii?Q?tGV9rmxLTA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KmMAuFhbHjDASViPKp1FcePJG4fI5ZR/8UPkEm7AUH/y8tqOiMmaY3ew9aRdwXEGyMT82RGRckmXIqQmj733m8oMKcHxc1wVMf3EuUDSRp3zFqk4AQIDueQ+XdAzCFKLLw5YBe84HkVqtUI9gsWE8Vhb+5NSVYJeCzoL4Ht9BofGAZbr8wMmlmh9ZkdXsG2DXwRgEnO1+peH1aWpCSKj5rBPRDCc/eN5jg0UQt/ndOicOCDUVXShBpKHkQyixrh0cJxRHF8u7cV6LeVcO2zuSpQfqAj2DsPBslZ/fsR9o9Q960ZsfIctvff2Ed5dW0S/7tTq29WfHGwahoqRXwWcBQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF4C5964328.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35870f83-8332-4550-0c11-08df448ceee5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 09:27:00.3806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZW58tmC80UQk90RarMxVU0t+kQl8LyS3IzQ/BR+B12odSH8ZJ8dwVkBTNSTbuY/EvxfLbM5y4dzcC9QerybhVWFKteRRYfPbt2tlM7dBdfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6080
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: 13 November 2026 21:25
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Yadav, Arvind <arvind.yadav@intel.com>
> Subject: Re: [PATCH] drm/xe: fix UAF race between exec-queue teardown and
> GuC CT pause-abort
>=20
> On Fri, Nov 13, 2026 at 06:51:50PM +0530, Tejas Upadhyay wrote:
> > xe_guc_submit_pause_abort() walks
> > guc->submission_state.exec_queue_lookup
> > and unconditionally calls guc_exec_queue_kill() on every entry found,
> > without verifying the queue hasn't already begun/finished its own
> > independent teardown. guc_exec_queue_fini() (run once a queue's own
> > refcount drops to zero via the normal close path) only erases its
> > xarray entry partway through its body, via release_guc_id() -- so
> > there is a window where a queue's refcount is already 0 but its xarray
> > entry is still present.
> >
> > This was caught as a debug assertion firing on both BMG and CRI:
> >
> > 	xe 0000:00:03.0: [drm] Assertion `kref_read(&q->refcount)` failed!
> > 	WARNING: drivers/gpu/drm/xe/xe_guc_submit.c:2242 at
> > guc_exec_queue_kill+0x2e2/0x360 [xe]
>=20
> xe_guc_submit.c:2242 in drm-tip is a comment:
>=20
> 2242          * on the hardware. Only wake any suspend waiter so it obser=
ves the
>=20
> I also don't see a 'Assertion `kref_read(&q->refcount)`
>=20
> What I am missing here?

Yes thanks for pointing about, this is actually in xekmd based on https://p=
atchwork.freedesktop.org/series/175996/#rev4 series, which is yet to merge =
in upstream, I will mark it depend. FYI @Charles, Daniel can you also have =
a look for your series merge along with this change?

Tejas
>=20
> Matt
>=20
> > 	Call Trace:
> > 	 guc_exec_queue_kill+0x2e2/0x360 [xe]
> > 	 xe_guc_submit_pause_abort+0x8e/0xf0 [xe]
> > 	 guc_submit_fini+0x11f/0x180 [xe]
> > 	 devm_action_release+0x15/0x30
> > 	 ...
> > 	 device_release_driver_internal+0x230/0x270
> > 	 unbind_store+0xac/0xc0                          [BMG: igt@xe_configfs=
, sysfs
> unbind]
> > 	 pci_iov_remove_virtfn+0xd1/0x140
> > 	 sriov_disable+0x42/0x100
> > 	 pci_disable_sriov+0x23/0x40
> > 	 xe_pci_sriov_configure+0x2b9/0x1350 [xe]
> > 	 sriov_numvfs_store+0x136/0x1f0           [CRI: igt@xe_pmu, SR-IOV VF
> disable]
> >
> > Pin the queue with kref_get_unless_zero() before touching it, skipping
> > entries that have already independently reached a zero refcount
> > instead of operating on an object that's already being torn down elsewh=
ere.
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index d76f125f9c3a..7a3bd698f217 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -3306,12 +3306,18 @@ void xe_guc_submit_pause_abort(struct
> xe_guc *guc)
> >  	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> >  		struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> >
> > -		/* Prevent redundant attempts to stop parallel queues */
> > -		if (q->guc->id !=3D index)
> > +		/*
> > +		 * Prevent redundant attempts to stop parallel queues, and
> skip
> > +		 * queues already dropped to a zero refcount via their own
> > +		 * independent teardown (guc_exec_queue_fini(), xarray entry
> > +		 * not yet erased)
> > +		 */
> > +		if (q->guc->id !=3D index || !kref_get_unless_zero(&q-
> >refcount))
> >  			continue;
> >
> >  		xe_sched_submission_start(sched);
> >  		guc_exec_queue_kill(q);
> > +		xe_exec_queue_put(q);
> >  	}
> >  	mutex_unlock(&guc->submission_state.lock);
> >  }
> > --
> > 2.52.0
> >
