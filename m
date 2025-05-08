Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B0CC3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 13:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABB710E1CC;
	Thu,  8 May 2025 13:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SaFLhWJa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0BC10E1CC
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 13:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746709754; x=1778245754;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VJDvKvsovi+Lb/qPDQQ4chhh4NX6Xq6zET6WwkF5mVM=;
 b=SaFLhWJamrC2rc9UVIVGlSv4OMAfq8t2OLMG0I1nAaEfCyD/OvHolCpu
 /1vQqwMtdg275J/7XTPKBZGG+pJ3pC5uai2iLSzft+iT0qIHxoAtPH7sf
 CZG639ExMnphJDWLD9NBiNSsZxRH0vyc5JsQm6F8PAEwtfPvGMHysPC1h
 YimflvlEBKfC8pztkGH7zelFryQO5OSVSuHhoBpMu2uRsTihZe3ZoKhok
 vQB2g8ioSYmyD/71fhm+LorD+jUvrZ9pOWlJNUh6nFiLraxaeZIy24dLv
 N9ma8u1pIunJlrJQodEvL94mehwXrVAkOAD5gE0JXa3UCdEHnzB5AyOwk Q==;
X-CSE-ConnectionGUID: wIQ6cI04SemhfsD7Bq4KKA==
X-CSE-MsgGUID: D2nmiTPZTiG2xsBvBuy+3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48502491"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="48502491"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 06:09:13 -0700
X-CSE-ConnectionGUID: CqCF/YMTSGuxXiJ+X2WY7A==
X-CSE-MsgGUID: CqO838cZTdGRzWoklZqmhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="141241786"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 06:09:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 06:09:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 06:09:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 06:09:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0GPgcs70L+/lAoxYq3ovNGz/kSeDwkE69c8LPZlaTN3RNDSex3M6xMT9o9OG4FZyyHPbcV2DqKj1zYPlY/fDs0hvvm9HoM8ETEqyJjTrF9TIaE+kHpwFNshMogSA7qVgaF3NcygNW7KcPE2SeyeKlyHjcm/2Mi9Ac9Tu6UO7fM9Nk6TkDHpfaQ5DhdFv1oCPgiqLJdAgko00XjP4zEYRXZDjiZQ7RER3uASrSBDxnv/XSQpBbRgVrIT5ECYjyoUwkHKM4B7bCW+wdGdvnWWRi0rs/BeHfpXZnlhgcs2l4ft5d/EGNfMd6+gKwsCbMBtR1OocdkN+o5cT2mfJmrM7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+fpZtu5Lq0XVGRwkuE+ZJ1IkK0UU/FxhY5K4xhlXcQ=;
 b=Q8dtzjoaFJNjHFai8er0EUhhzTxj2Pgd9qrS/dmJ/zu/0/k1MfKbeI09fuqCfmIqhP8gCm3aYLzaL+PGJ12vc7j1DtHkPjqF5wpn4Jrp0HLnlugW638nLI+37USUWGrp2iJ57BHtuuS/DHqUjsmcP5C2XMEXOdU+2ERqqTEZg+XJE800ZrOUeyuU5y1/6f131H5PCUImbgkZ7Y83pgyKmrCpHZo20pvTkrhMgqYOIqRyOj9ZozmsoEooD6oB31walUsvZZZLK8QFfPFizH+rZXLbCc1mOakYPtmfdkWhxEHinqHD4FdFIo6ExrSkJ2QeurrGqHqBbq0wAfDKDT5ZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH3PPF6B7063D92.namprd11.prod.outlook.com (2603:10b6:518:1::d2a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.29; Thu, 8 May
 2025 13:09:06 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%3]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 13:09:06 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Johnstone, Nicholas" <nicholas.johnstone@intel.com>, "Box, David E"
 <david.e.box@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v2] drm/xe/vsec: Allow for kernel context access
Thread-Topic: [PATCH v2] drm/xe/vsec: Allow for kernel context access
Thread-Index: AQHbv4elhz3UP+BPZ0id1hst90bz4rPHkksAgAEgbHA=
Date: Thu, 8 May 2025 13:09:06 +0000
Message-ID: <IA1PR11MB6418919523DE73706B405790C18BA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250507193811.268719-1-michael.j.ruhl@intel.com>
 <gbcppvon5jrqdbplqzlg3lyqjd3p7s4uv36calvetvnnn3ghxj@elaaiqz2j37e>
In-Reply-To: <gbcppvon5jrqdbplqzlg3lyqjd3p7s4uv36calvetvnnn3ghxj@elaaiqz2j37e>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH3PPF6B7063D92:EE_
x-ms-office365-filtering-correlation-id: 17bd2da4-cd2b-4482-b911-08dd8e31834a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?3/8AR9GFjN03GAksSLGZLaHkpNgfjlJ2b7vGGPt+tUCVoBVangMbEygveEFa?=
 =?us-ascii?Q?cfzogUl3gOSSLFp8dTTsmexv561wD3odhC2WNa0Bjy7vRZp+L/MR66qpuw66?=
 =?us-ascii?Q?suPRP1EwMJ4hyi+AGJecvu95ZDzA5PbJ2rL/4uHOht4nAlipINxZA2tkZVVr?=
 =?us-ascii?Q?iP7ijZnfvBM5YbDcjhVQdH3Sx6g2b4IwqIbyabphvLQjexjtoSF6/qUZFao1?=
 =?us-ascii?Q?bMHKSEUvTGQ99K+lhtkHMXJbk9OMySrRWMA0lenOS1kUUm7BD/u91N7BS1LY?=
 =?us-ascii?Q?Y/lBAqWfiMbUZGQwDLgX0k/K8y1H2dhhWemg7Z+fZXhlwvVSQXvs4NrpY6Z4?=
 =?us-ascii?Q?NduaM8ZLp/Va5oochZlbf4hJc31qioec3ho/lQinRatNL6i4t9yJqAX+GV0M?=
 =?us-ascii?Q?7GVnDCD5jNCCBgNC6KXkkzYaHWmtRSnhuGfsIYaI2Wk7sI2PfJ4giDNPHg0e?=
 =?us-ascii?Q?k0h/IYOs5clYWc2gBOW54auMY1eO05UrmLvxrckFZgdI8byk+t0FTqVSOKkU?=
 =?us-ascii?Q?Ui5diYnK4qMbdGFnC3i3q04TTypEWaW4prGVRDjwK4DruQ3B5E1fQ0Hb5s+q?=
 =?us-ascii?Q?D7tWd33AX5FtpAQyPmnYPVDOp9iYSLtRHhBrg6Y+FYF10CxXNlHGmQ+slUdr?=
 =?us-ascii?Q?gGU75fIHzcf4l78zduIy/RxTnRTi+h5ccNbGHf8vK/OulB8pt1Wd3xCvyqfZ?=
 =?us-ascii?Q?IhXVyr6LU5AlXDMkNTcx5eajXy9T6IhjEFvjpmssFF7ZNNfsaypJfVwp55aR?=
 =?us-ascii?Q?/DBjQgeU7fySzmofj1FDMi9cggs3Jlwo7uLJQGlgXkSQ61/cwZa2sFFHBZsd?=
 =?us-ascii?Q?/Cbt5qyTLpNbYizdqTMwDosx0Qg3JE3IvuI9AysrYrzoWIth/KYLSncmOcwd?=
 =?us-ascii?Q?IGJUJzmTyV7ieRuk/FD+hExp+3ohPVHZe5TNwtDz4kSnQyYBPfWBqc8yUyZq?=
 =?us-ascii?Q?5B5QvXifUUpaGEqBq1sDtD8Z1T1czkzb47JqpwRWm+gRYTHOTUtsfJLMqZPz?=
 =?us-ascii?Q?0u2AfHUOERJyyRO6iaVdlNljKgKvku/6wAvbi+RJsIxhQvaK+6kBbRbgP+ra?=
 =?us-ascii?Q?vAxH/C1Vzr5XPaXyVuO19mViB1513OeTO/va9U/yQII5PRxqcggSS5d2rn+n?=
 =?us-ascii?Q?OMU27+jalGYf4vQB1C6Z1YBpSPK1t8+zO9mzJnkGUZAW5+g5IdDC+MNK7k/p?=
 =?us-ascii?Q?kfLg67W43FuoPoZykiq3/qeQDUhlJb7Rd0nfRpodtdABPwr8+qZ1oSHAw3v+?=
 =?us-ascii?Q?zwLxc+QUheECqbe2hcQ3EdSgin0HCsGyUgPlwI+7+ymfmtuuDtkzFfImKTHT?=
 =?us-ascii?Q?CL5PKC2KqfENFVQdgKsxEDoZiAzE0uFQMfKHqSk+bFinzjG+U3uGaYXZ3KKS?=
 =?us-ascii?Q?wNLFqecCRVSq2uaK9f+I2TAmL8e2oXo3Gp8fu9/2cXEtudC74y6frFK+aIZR?=
 =?us-ascii?Q?qS9Rig+BSKM8fk6uTtsdgRqKl2+1G0pF/uNb4ec5pSYdkO3Va3zEsKrrt624?=
 =?us-ascii?Q?2kEMDUxAotn5EhQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AopMYxTNGEjH1l6LsvkjTWi+UAQyooino29AFA4IndL/eRWvGOTLruhEh2ZN?=
 =?us-ascii?Q?XzU6p0+Nuv5jQFJk2TaNQ15+cJB/vTtSITnoE7Iuw6VRPjqiYmpFiz/uck3q?=
 =?us-ascii?Q?bOoTZdOUlwhazBHwjFgc0UlSQrqnDh1HMtmUP/EBEgX+lqp1BIYjWAl27rHq?=
 =?us-ascii?Q?Vw3Y4/H1rR/R/5UePT44W+LxCAAQ9pjO8YlKWfKeOq4M9M6r8oSVaLN0v4LH?=
 =?us-ascii?Q?YtowgLSRPmKm6v/lBS5x2JnqC5JJkWpLLcw1DWbm1qY57HqDe8H4q8XtFRb/?=
 =?us-ascii?Q?fTJt2V0jGfO0ojLTjyOLfNm0n7/wNYAFDiO0nKqtoweIrRncNvIA6b3jZOlW?=
 =?us-ascii?Q?AotJbrjjNhpjrX5EWSEv7Fs1U9/Fgn7c3iUAcqu6hvlvDPCQqjh2b+M5wOrM?=
 =?us-ascii?Q?Obayv1maoUFMZMnJam9oMqIhgZAzErSHnrAIYpsQTb0YSpcTaZdH/8Zv5PTh?=
 =?us-ascii?Q?cPgwq9S+u6VGUj8X4rSuHhgKzMexEhRWea30gmPouFb586PEwh4OqH9CqnpR?=
 =?us-ascii?Q?fGWM1ad7hDoAulRHOfJzhqlYpuNs7E36dyh1CV6F2v7o/Rxes3nZAq4v0AWJ?=
 =?us-ascii?Q?jMSSsdQsyGHwPIOihEROYs9DM2wBVtBU7KNVHDMd8EojgacJfUZoqjr9d8Io?=
 =?us-ascii?Q?z+ZhAF12K4/DpvLQ4Ydpx+flM+x2fTFyHQ3EGtiDgvROMWUxK15CVjPDSTHN?=
 =?us-ascii?Q?b80SZuXniVPaOlOXTKJIxtBEbIwuwJFy+rjnPZklhJNOVJT2g3iRJc2xETvx?=
 =?us-ascii?Q?aiygrjpSAFQYmX5yYItqA/atwyyHGN+gkGCduulxvprSA+Xi0QuwD58StZvF?=
 =?us-ascii?Q?HqKLkxOul5iu/9BT1AdLXgu/fRYYpu8Rnj530en0SZ7msv+Sdkq//xEMqwd2?=
 =?us-ascii?Q?fphLpxTkqT4Y7/a86PqsgpzA5kT3Lf4GRUBs8rjkg49S2mkBqJs8mRp+VPVd?=
 =?us-ascii?Q?bwDwV9063DZ5LASobZg0EEQU5E/J6dDsoGg7VyFH00adbEtTl7KbL3MN/ltL?=
 =?us-ascii?Q?P6qZ/FggOHJZTXCV9x26VqzDpulxfgjhFQHY0fk06huGE6YbMwlVB0lotcGc?=
 =?us-ascii?Q?xKs6vzzbQFRjL8Vj2N+kE8IKbZLTydffVhmFE0JhnrghcFraEKA4QIdiJ0tu?=
 =?us-ascii?Q?ogDKGpgcGGxZsbLB3BRlbNhWhNB4CfXuHOMjHDyTWeWckZoo5FJCH/DB2oTW?=
 =?us-ascii?Q?C48BGjPJaNe+3omcFU0FGHOfS8gQO6zhUP0Id+oTU1Fo/cBomO3WfC2AJnZK?=
 =?us-ascii?Q?jBvsaTmFifCZ7KWeE6oyCvbCgrn7HHLY9PzTH7GOhrfZgnliiiwOquJPkGvq?=
 =?us-ascii?Q?OZ7CMuOAejLw+DAyHYYq1h1qHNys+NlcA/zxH0UePKjGZORKQk02I1kY1n53?=
 =?us-ascii?Q?WxGB+KBG1BiY5dLhBYsCsRSpM4W/5tcpOmHdfHrXepyzgZEZsQ4LFn5Yphno?=
 =?us-ascii?Q?hiBUyZKULqN/KFnyEC6dKN0jTXhdNuJTo1f2/wbsr1gzYYy99Z8vhH4N0OEk?=
 =?us-ascii?Q?1+I5UlIImO6HzrWjPGZI9iCJ710DRpKeyTag4m5ui94EzTV9TfFYNU/6XatV?=
 =?us-ascii?Q?QugytXTdXfnucwRBJWNPggvgUz5q6c5wnOsPvgxX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bd2da4-cd2b-4482-b911-08dd8e31834a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 13:09:06.3632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ct2b6Hx4mjAZLRfa+8tsCglwmouuzrRCHGsRG8JDFgRO4XoF7sT5mHv4tu2+XXCy7swW8I0J7wuhkOCnPNpKeyiYutRUBZG7QvAZYLJ7K+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6B7063D92
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

>-----Original Message-----
>From: De Marchi, Lucas <lucas.demarchi@intel.com>
>Sent: Wednesday, May 7, 2025 3:46 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: intel-xe@lists.freedesktop.org; Johnstone, Nicholas
><nicholas.johnstone@intel.com>; Box, David E <david.e.box@intel.com>; Vivi=
,
>Rodrigo <rodrigo.vivi@intel.com>
>Subject: Re: [PATCH v2] drm/xe/vsec: Allow for kernel context access
>
>On Wed, May 07, 2025 at 03:37:40PM -0400, Michael J. Ruhl wrote:
>>The PMT driver API allows kernel level access to device
>
>ahn? What's that supposed to mean? what's the context that is calling
>this ?

Hi Lucas,

The PMT exports the pmt_telem_read_mmio() function which accesses HW regist=
ers
for telemetry information.

In this use case the SOCwatch kernel driver is accessing the API trying to =
read telemetry
information.

Since is happening from kernel level rather than user level, the mutex thro=
ws the
"might sleep" context error.

I tried to distill this the above comment...  Does adding the content above=
 explain this
enough, or should I be more expansive (what details do you need?)?

(I unfortunately don't have the trace any more...)

Thanks,

Mike

>>data.  Because of this, the mutex lock use by the Xe copy
>>callback function turns out to be a poor choice.
>>
>>Change the mutex to a spinlock to avoid sleeping when it
>>isn't allowed.
>>
>>Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
>
>need to be explicit what this is fixing.
>
>Lucas De Marchi
>
>
>>Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>>---
>>v2: checkpatch fix, update email address
>>
>> drivers/gpu/drm/xe/xe_device.c       | 5 ++---
>> drivers/gpu/drm/xe/xe_device_types.h | 2 +-
>> drivers/gpu/drm/xe/xe_vsec.c         | 4 ++--
>> 3 files changed, 5 insertions(+), 6 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
>>index 75e753e0a682..72c81b8203a5 100644
>>--- a/drivers/gpu/drm/xe/xe_device.c
>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>@@ -8,6 +8,7 @@
>> #include <linux/aperture.h>
>> #include <linux/delay.h>
>> #include <linux/fault-inject.h>
>>+#include <linux/spinlock.h>
>> #include <linux/units.h>
>>
>> #include <drm/drm_atomic_helper.h>
>>@@ -488,9 +489,7 @@ struct xe_device *xe_device_create(struct pci_dev
>*pdev,
>> 		goto err;
>> 	}
>>
>>-	err =3D drmm_mutex_init(&xe->drm, &xe->pmt.lock);
>>-	if (err)
>>-		goto err;
>>+	spin_lock_init(&xe->pmt.lock);
>>
>> 	err =3D xe_display_create(xe);
>> 	if (WARN_ON(err))
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>b/drivers/gpu/drm/xe/xe_device_types.h
>>index 06c65dace026..b57e1ba7cbdf 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -527,7 +527,7 @@ struct xe_device {
>> 	/** @pmt: Support the PMT driver callback interface */
>> 	struct {
>> 		/** @pmt.lock: protect access for telemetry data */
>>-		struct mutex lock;
>>+		spinlock_t lock;
>> 	} pmt;
>>
>> 	/**
>>diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>>index b378848d3b7b..df44e28abbdf 100644
>>--- a/drivers/gpu/drm/xe/xe_vsec.c
>>+++ b/drivers/gpu/drm/xe/xe_vsec.c
>>@@ -6,7 +6,7 @@
>> #include <linux/errno.h>
>> #include <linux/intel_vsec.h>
>> #include <linux/module.h>
>>-#include <linux/mutex.h>
>>+#include <linux/spinlock.h>
>> #include <linux/pci.h>
>> #include <linux/types.h>
>>
>>@@ -164,7 +164,7 @@ static int xe_pmt_telem_read(struct pci_dev *pdev,
>u32 guid, u64 *data, loff_t u
>>
>> 	telem_addr +=3D offset + user_offset;
>>
>>-	guard(mutex)(&xe->pmt.lock);
>>+	guard(spinlock)(&xe->pmt.lock);
>>
>> 	/* indicate that we are not at an appropriate power level */
>> 	if (!xe_pm_runtime_get_if_active(xe))
>>--
>>2.49.0
>>
