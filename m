Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0097C02180
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 00:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897E310E539;
	Thu, 16 Jan 2025 00:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RqSY0Odt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837E910E539
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 00:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736988719; x=1768524719;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+f3U55Chg1JlsRXsiZK+b0J3t19fB3y4ITVJu9G9gvA=;
 b=RqSY0Odt44CqOl1ccjXXzjbXe5cviTJAK4NOIeBzpwphux0w+cq5GDGT
 yCQ6zj1TlQ2SLzW7H5hhW7XbQYbKdq4yJuwsQzhRKgMV14ss8fmwz8OLn
 hxfGiXsAJARCFUnz1luF8AxQreTDDMEN6POfKZfUBbNx0ZhtS5MzEsXmJ
 mUxc9r65S7rAtSgfyChM7dwVGI8zPtu0dQ6rBYMI8W8XrYpv/w9kH+gK4
 r7koejFqgSGvS3XQkUp/Gso8LvJlxYdIH5ID2D+A67S4IE/PMP1P3e82i
 IhqtEEDxL6K2RXqwmtNhIUSGYdSzS+8Ef96stglWWgSOyBGEXS9/I8qRA g==;
X-CSE-ConnectionGUID: bosT8ZYOSyOvpJDHtEIvNw==
X-CSE-MsgGUID: pIDJNcMbSQG4tpFeOW9qbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41285202"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="41285202"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:51:59 -0800
X-CSE-ConnectionGUID: gPi+dhb4QtCs0rox9Ukziw==
X-CSE-MsgGUID: 9PoT6fRuT1WvOKq4tg9DrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="110276562"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 16:51:59 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 16:51:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 16:51:58 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 16:51:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFcAJEhtnI6OsfGQCTLNjUSnqBZ9+iayNMm7G64dkeD3CjeiiSg+nmFrN98jMs+TrVLYifnYpXX5FNHGDskcdXHl7W9E0zQOVR6lI0+vqcTdv9+DrlyLrIkPVWyNDzZl/EO+bjXENYai60g2apXlkXBvr5kxcIT8nOhhpaGOuhJYUp0EjS9lnCTg771qWCEtkRI0vJmVeU172HuJAYK3QnnZ7qWCARyVOvtYaNfFjTUeZOXPJLeUIiYnL5yBVLY2ENYBd0pD7lrhb3MpetZ1MKECAN+bkXdKk6NBlCXFLV2jzANg/DSBIR+UI468JeS3WKLLccALyEbqR/kW92b0vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GC1XbGyMfpw3IzezX17dq9F3No48ehrT0pkcvT4hvOI=;
 b=tNWTOT3K7xp15JH45e5bQrQhAUBr7K/F+p9nq2UWQ5Hma3hdsoLYinNVP0H/0q59N20Z+V2lNS+KQE2mzVcReuC4Spa+nJPNqGhtP8nH6ORJFGGIdQQI7CeDvnxQSd1GRenKG8ZwnSDH9rUHLFAX8T8Vw0tdmNG0jqhVeejkP/Um2kNCjmzee0buyc1fBzS0NIxuQZxk5mg/Qk6qbV2fUrAkXbgEEwSCgs7OwdaN7LPI76UZjcX0D9toYSXGFlqCl/ZTiMnA6HeX7vz/R3138dI/72vXBFkMujrUscdIxF0cAko/Y46h9/dohI82Xla0K9Kv8Qn4HkyNnIBtOQafFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6913.namprd11.prod.outlook.com (2603:10b6:930:5b::9)
 by SN7PR11MB8281.namprd11.prod.outlook.com (2603:10b6:806:26b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Thu, 16 Jan
 2025 00:51:56 +0000
Received: from CY8PR11MB6913.namprd11.prod.outlook.com
 ([fe80::854b:adef:2502:4cc6]) by CY8PR11MB6913.namprd11.prod.outlook.com
 ([fe80::854b:adef:2502:4cc6%5]) with mapi id 15.20.8335.017; Thu, 16 Jan 2025
 00:51:56 +0000
From: "Degrood, Felix J" <felix.j.degrood@intel.com>
To: "Chegondi, Harish" <harish.chegondi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Ausmus, James"
 <james.ausmus@intel.com>, "Cabral, Matias A" <matias.a.cabral@intel.com>,
 "Ranjan, Joshua Santhosh" <joshua.santosh.ranjan@intel.com>, "Kumar, Shubham"
 <shubham.kumar@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Olson, Matthew" <matthew.olson@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH v8 0/7] Add support for EU stall sampling
Thread-Topic: [PATCH v8 0/7] Add support for EU stall sampling
Thread-Index: AQHbZ4hoQ1aOjYb9tU2AWFl0Fi9LirMYkn1w
Date: Thu, 16 Jan 2025 00:51:56 +0000
Message-ID: <CY8PR11MB6913BABAACEEA5CC10C87D4DAB1A2@CY8PR11MB6913.namprd11.prod.outlook.com>
References: <cover.1736970203.git.harish.chegondi@intel.com>
In-Reply-To: <cover.1736970203.git.harish.chegondi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6913:EE_|SN7PR11MB8281:EE_
x-ms-office365-filtering-correlation-id: e83744c3-38e1-4217-fa2b-08dd35c7f9b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gC0RThJ1D1G6F9a8qSybtUkv2m8ZEbiOZJ7ISngmxbXbxonSN6birsD+S4JV?=
 =?us-ascii?Q?NI+f+JxNWq4wk3RFN+T/fCJzX99VGRTXdEe517FBAOh2hOE58zzzde4Ng8Sp?=
 =?us-ascii?Q?EfR8nDdLvojI9NhYT4/1RtM1OI5JbRe6w6Aj/OPLXTxA0zu3ayAnA0XWe9af?=
 =?us-ascii?Q?0zzxRrTPhWPTWkosMKiryJs74ae4fs8ILAUDH4EAK86iNDRP1qZfnt6LW1Jv?=
 =?us-ascii?Q?OfmiLnHLgNiCJf1Iu5jOdf8m7GoZjU9NJRwg7qYHq1aDo/C6YBzeLFMpiel1?=
 =?us-ascii?Q?2N9f477Ko+7hpP5jzvTuLXC8VJjtOCReeIIeZgPyZKdZjFRNE87GrSeGPDTX?=
 =?us-ascii?Q?8STwlVhdWjC4LQX486vm/jbYn4UT6ElU4rGGRv0LYQRJ/5IrnFEJUphyaOjj?=
 =?us-ascii?Q?t+jKq1+LiCdUpRiUAunL0L9+6Kk1hV9X7NcGNB10sBtL6SBlS/oNfZYUvgKk?=
 =?us-ascii?Q?ne+I95+Dm2ztkJoY1dIuZ49WLBJqiQOIwwOTfu9cLTTp2qyrtBElld/HNgAw?=
 =?us-ascii?Q?LLy3HimEAUio6/Z0Sajv411jPAVULV6WaUCYIEG2ztRX6kvbatJs9dpPnaOW?=
 =?us-ascii?Q?uMvSneYLRxbNoOTKCHlVjCUz7qen2qD0Nu+GFZ30YUNGho/oJImCsKslbnBp?=
 =?us-ascii?Q?R/PPoYGhR+q8G8oTIIeuZ+VRQ4DgJrgwo4Wg85QDDJESQ5/TTv3QJmC6HjCA?=
 =?us-ascii?Q?ceJX4GPMdZXIFbIhnfNWEWLTe6T8f1Mg+/bX+JaqVoAFu8LLzyQnNh1S0ypL?=
 =?us-ascii?Q?f3VUvRYuP8fqfbiYxqH1ncrkgp9Nl0iJSHmAuue5YpycnElRV+Ov0jtLHhDN?=
 =?us-ascii?Q?ew4CqyQ7ayZcbfln81w8fjTdvkSpshNLWyWOvaW8tAa34UeQ4Tj/6j+gR7UG?=
 =?us-ascii?Q?CvAEUIlTRnJ32Jx+4CC9G74nYcJUPo0Eu20EL9QsefVnIUTWF0lJec4+0ZU4?=
 =?us-ascii?Q?jDRrmKHk1GIpKmPCdqpqFaeRa03HGl5Qh/GEi5z46pxNHWM8FqRDsNQxfhHD?=
 =?us-ascii?Q?Gssaoy1kqr6qZWRg7tNkVaXn/e7IOiedud3xGhCVl5YVD4zJm9j1o8dH0SEc?=
 =?us-ascii?Q?yB3Uez+joL/cYF+GTOqnRx/RlNSZWKp7al5Vl6mXPeguhl1sEdHjViXkcdgU?=
 =?us-ascii?Q?VHDgg2KUoGa2pfBCdoN6GxgVRO+qLY0oPfqi402LVgTvRBBy4QsJM6OjTzsp?=
 =?us-ascii?Q?b2uxvuMNSe2yXpQhdSzI1D9xooRkE2FfdEIX0+n/uf4Vo9wNe+zFR5rUGuT7?=
 =?us-ascii?Q?1wtkgREaBpWP+RI4HhqhibVDKMwFC4paeGAfnCMtXnXq/nFJ2iGuBH+/zhcv?=
 =?us-ascii?Q?sEAZXxypZ1F5mmx4nOSPDfhcjHK49raYYTcxCiulSehWro+xL4ThQPSbzezC?=
 =?us-ascii?Q?c+vD6EVLhs+84l2AwJj6vl2TguSpCgJ0U/JdyIWJ5U6MDkP12w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Xm0tf6zlcIvqCh/dvwQ8dSWj4LFiE66LMTvUN0OPMxVzEthjMdzg4E7/umAz?=
 =?us-ascii?Q?OfiLKazuzBc1k2xdfT/+WrBCLdDmNjU0w6nuJVFIfagvxJkEIhiFO3QwETW4?=
 =?us-ascii?Q?afXaED0jbYiV+nYY2EgBaCFyDK0fEw221FQn82YxuKkoRzmbPT8jELCiNv7X?=
 =?us-ascii?Q?/DLLe57nxaZJzd23YkZi8AVGmNNgLBEFu/vPE9frMJNDzuvLr3Jy5MC9vrIy?=
 =?us-ascii?Q?A9qnYfP2l2LYggMPUO6MtN+joE7xPXfXcGd4Ko+qWDsqaC2UFaNaD3MiqS0L?=
 =?us-ascii?Q?WRymEcYBx1I/YG3FvQPu2yuuSOk5x184oEvExNo/cSRnjlWZ8tV8ocZhsQW9?=
 =?us-ascii?Q?94EaSYKSLVjPQ7hrsLVNgy1ZG7IMRVZ6AAwgty9r5n38hjF7DNk/1RFxoiAP?=
 =?us-ascii?Q?V9o+wHRRo52Fo/DvnWvwCFh3GCE5ivUwschvXPM1E+au4LTXfBKVxKhjqbN7?=
 =?us-ascii?Q?JJuAj5QdGl1Gd1RnkODWD/CW5eJVkCRhQLNsyLuQaB2Sryrhl3OC7MDP7ZoG?=
 =?us-ascii?Q?sFqKOHEiVrrkEZU+Vi4/nJI/t43FUbt/7R8il1cnKzvQgrtpz9AthFG/xXL+?=
 =?us-ascii?Q?8jUZDXiBzBACjnTbT3j3l+ZrpPAd9LVskw63YO+yDSGaoWUyJ6O6oeBZalMy?=
 =?us-ascii?Q?TQ8D4Q9SCFPHB6hLnSOTUdHHRbmeekoOx8oJVFBUTYk2heH1vMMgI4GaqjUR?=
 =?us-ascii?Q?PnWczinNvJdpyVcah+esoOMjZR1cSr/D5kRNK0GbHtWAxm/jZh2JzvoIfep5?=
 =?us-ascii?Q?8IjpSQdWTx2NSDV6FDP0gMiSOCct7UEQEAiEn2Ly9pOAbpVIdFvwAjzbvGWg?=
 =?us-ascii?Q?sQuRm/NmDbcP1ZBO8ZNqDLtMrgFmrJhmA6sVYSRvlYtnawQFCHNu/xImhfdj?=
 =?us-ascii?Q?v7Fmb37MPrbhsY18k1YNODURTBYzlLU5y4RMhTOSIcGdlrDoEEn0t09eUeN0?=
 =?us-ascii?Q?sJBBOQhZf6u2nSZWqlUFY5TS8CAr6HfAv/yjBHiWtmBNiSrVOoQY9+0Goq6f?=
 =?us-ascii?Q?5fDAsDy7QdFeZ4prfnY75ob3XXioArU5LmfH1L5z+7V65B70QmE7TjKRqgYz?=
 =?us-ascii?Q?3CoUiXu3LJW9NfwE+J/LCQG8qvvhrxGi8vk1NBLULqxpewtc5Po+gLhskqhR?=
 =?us-ascii?Q?ddDJSsOqn8cuH3Jyd9qp1/z0i4V4goJV2NASMvc0BxPx4H3ewnc8cPxZxM+T?=
 =?us-ascii?Q?0Yqs2/Y+CA0GQOg6OSUoHnPusn0rziqNQD1UYEmXN0ExCxxcya+PcGq+ha/b?=
 =?us-ascii?Q?b/GXEEsJFvx80oyHnj+hBxvF4snoCCeJw+ddH/NLDiNHQKKBB/ewVgrAqF2y?=
 =?us-ascii?Q?7V9accN96iMzCp07bBoYMvzUp3jBH7HQ8WQCZBrZKSvRPhBTkC9j21nb0Jo3?=
 =?us-ascii?Q?HoSBZ3VqFa+m6MjVoT6202hluFck44+5L8zl/rhIiuAdKzEFI8p9dSNYh9SC?=
 =?us-ascii?Q?1L0+ShSM1lOUmO11Si6AUWaUoYN1b+Z2SNw0HBKlDbQJNNlWKmswS3CL7y6E?=
 =?us-ascii?Q?jolYdb+aNvYOFvn5yi6V98QiBafFexb8UQC03NJ9EujDaSwk3Au23tbKfW8a?=
 =?us-ascii?Q?mx+dCHDfWG4WXG2a2ymOiMzn/jwTVLGH7YZbj/Tn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e83744c3-38e1-4217-fa2b-08dd35c7f9b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 00:51:56.0522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4O5S7vVWo18OPC+SvOVmNI9A4ka2xJy+MX0ongZA/yky7jMM85H3+2C3aoqhFpRKShK5f2vEsIV6xqviXo8Lf5YnRIBwdsP3kaapCOKbDLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8281
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

Acked-by: Felix Degrood <felix.j.degrood@intel.com>

-----Original Message-----
From: Chegondi, Harish <harish.chegondi@intel.com>=20
Sent: Wednesday, January 15, 2025 12:02 PM
To: intel-xe@lists.freedesktop.org
Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>; Ausmus, James <james.ausmus=
@intel.com>; Degrood, Felix J <felix.j.degrood@intel.com>; Cabral, Matias A=
 <matias.a.cabral@intel.com>; Ranjan, Joshua Santhosh <joshua.santosh.ranja=
n@intel.com>; Kumar, Shubham <shubham.kumar@intel.com>; Roper, Matthew D <m=
atthew.d.roper@intel.com>; Olson, Matthew <matthew.olson@intel.com>; De Mar=
chi, Lucas <lucas.demarchi@intel.com>; Chegondi, Harish <harish.chegondi@in=
tel.com>
Subject: [PATCH v8 0/7] Add support for EU stall sampling

The following patch series add support for EU stall sampling, a new hardwar=
e feature first added in PVC and is being supported in XE2 and later archit=
ecture GPUs. This feature would enable capturing of EU stall data which inc=
lude the IP address of the instruction stalled and various stall reason cou=
nts.

Support for this feature is being added into Mesa:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30142

New IGT tests for EU stall sampling are being added:
https://patchwork.freedesktop.org/series/143030/

This patch series has undergone basic testing with the new IGT tests.

Thank You.

v8: a. Used div_u64() instead of / to fix 32-bit build issue.
    b. Changed copyright year in new files to 2025.
    c. Renamed struct drm_xe_eu_stall_data_pvc to struct xe_eu_stall_data_p=
vc
    d. Renamed struct drm_xe_eu_stall_data_xe2 to struct xe_eu_stall_data_x=
e2

v7: a. Renamed input property DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT
       to DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS to be consistent with
       OA. Renamed the corresponding internal variables.
    b. Fixed some commit messages based on review feedback.
    c. Changed sampling_rates from a pointer to flexible array.

v6: a. Changed the uAPI input to accept sampling rate in GPU cycles
       instead of sampling rate multiplier.
    b. Fix buffer wrap around over write bug (Matt Olson).
    c. Include EU stall sampling rates information and per XeCore buffer si=
ze in the query information.

v5: Addressed review feedback from v4 including
    a. Removed DRM_XE_EU_STALL_PROP_POLL_PERIOD from the uAPI (Ashutosh)
    b. Separated the patches for Xe_HPC and Xe2 (Matt R)
    c. Moved read() returning -EIO into a separate patch
    d. Removed spinlocks around set_bit() and clear_bit() (Matt R)
    e. Renamed several variables, structures and enums (Ashutosh and Matt R=
)
    f. Addressed other review feedback.
v4: Addressed review feedback from v3 including
    a. Split the patch into multiple patches (Matt R)
    b. Added a new device query to get EU stall info (Ashutosh)
    c. Renamed all Dss to xecore (Matt R)
    d. Removed buffer size and disable at open input properties. (Matt R)
    e. Removed the "_SHIFT" macros (Matt R)
    f. Allocate the EU stall buffer only on system memory.
    g. Changed the work arounds to OOB (Matt R)
    h. Other review feedback.
v3: a. Removed data header and changed read() to return -EIO when data is d=
ropped by the HW.
    b. Added a new DRM_XE_OBSERVATION_IOCTL_INFO to query EU stall data rec=
ord info
    c. Added struct drm_xe_eu_stall_data_pvc and struct drm_xe_eu_stall_dat=
a_xe2
       to xe_drm.h. These declarations would help user space to parse the
       EU stall data
    d. Addressed other review comments from v2
v2: Rename xe perf layer as xe observation layer (Ashutosh)

Cc: Felix Degrood <felix.j.degrood@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Harish Chegondi (7):
  drm/xe/topology: Add a function to find the index of the last enabled
    DSS in a mask
  drm/xe/uapi: Introduce API for EU stall sampling
  drm/xe/eustall: Implement EU stall sampling APIs for Xe_HPC
  drm/xe/eustall: Return -EIO error from read() if HW drops data
  drm/xe/eustall: Add EU stall sampling support for Xe2
  drm/xe/uapi: Add a device query to get EU stall sampling information
  drm/xe/eustall: Add workaround 22016596838 which applies to PVC.

 drivers/gpu/drm/xe/Makefile                |    1 +
 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |   29 +
 drivers/gpu/drm/xe/xe_eu_stall.c           | 1103 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eu_stall.h           |   61 ++
 drivers/gpu/drm/xe/xe_gt.c                 |    6 +
 drivers/gpu/drm/xe/xe_gt_topology.h        |   13 +
 drivers/gpu/drm/xe/xe_gt_types.h           |    3 +
 drivers/gpu/drm/xe/xe_observation.c        |   14 +
 drivers/gpu/drm/xe/xe_query.c              |   38 +
 drivers/gpu/drm/xe/xe_trace.h              |   33 +
 drivers/gpu/drm/xe/xe_wa_oob.rules         |    1 +
 include/uapi/drm/xe_drm.h                  |   74 ++
 12 files changed, 1376 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c  create mode 100644 dr=
ivers/gpu/drm/xe/xe_eu_stall.h

--
2.47.1

