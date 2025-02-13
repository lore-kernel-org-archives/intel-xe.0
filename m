Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0A8C02198
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 00:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7CB10E99C;
	Thu, 13 Feb 2025 00:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNVJoOAx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD01410E99C
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 00:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739408184; x=1770944184;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=qCyPAmm/8tlR+7azlG8eC+GzCd+04J6vHkBewbi5LJ8=;
 b=RNVJoOAx284FFY+TxTYE/W0hHAGejHuXjaXFe7/PZO5CQ0/HwuhXVUm1
 dq9up8Sadkj4UgyClusdt+3BoV4aC/m/6624cYu1puClShEV/kspCcErc
 ACFL07OvQtdnJyWhhq6IoSghZy0V0wZv1XJXPetcnTO5B/6z4J+DSTq4L
 hh2WbHAx78kvA3jUL9eXStOlaCkY65pkkBRFRJq23LP0rgmsLf7d0w3Po
 ESQHNnLHR9/LxJMQjZbTTqpkDhdl72qbpBCqC6IwW3Zi9ZKxT6jbqJNya
 y6CelZqTXcsUhAcuHRAD5OOBBCGrn87GIF13HRTZ4PKquXaxP3jW92RzZ Q==;
X-CSE-ConnectionGUID: +k3iW/m7RT2Em+lmcbs6cQ==
X-CSE-MsgGUID: 2KL9IhtRQXCp08ZB92WjNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="27687809"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="27687809"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 16:56:23 -0800
X-CSE-ConnectionGUID: snuDDpPLQcSi25MDohg6fQ==
X-CSE-MsgGUID: fGedIf+pRbuPr3NtiJtHKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136238052"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 16:56:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Feb 2025 16:56:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 16:56:22 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 16:56:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPvF5Njgg/TGsSvUS7TRuB23S3z3WVte79WduvjL6JQqT0lMV3lmFTVAE7cjaneHsw50JaNS7OzLo3NPvMqpyTeBEAmCskw2RjR3NJYX43os5HuPrK9/8L7CJu+WxIpEgqjDWePbxpPVuKqo12Jfi5RQm8kId3iM28YkTVZA1QCK/6LWpUuJSoqU2yIowFfq1gW+hiBu2LCPdW2dbtWCzCKEBqkYq/XzW8BKXt7spBn4PeSQzYiZyfXRyj4pdEzlZcvvn4IvVzK9PHqp7T84w+eHpskwNMAl3YaVj2EechkXWEeo3dkmJr1c/nS5sUUPi1NHG+i/CH/HJhYlX1Hgvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCyPAmm/8tlR+7azlG8eC+GzCd+04J6vHkBewbi5LJ8=;
 b=Lg22+bdVtdNhvnI1sA9XyxcGyWGJiKQFJf9c3PMo8LeXWx94KeBfAi35jkUr2lganXUZ7i36E55zLvfwFOh1FgmMVv4Avi2dEvtMLcFeJ7ODJ9863XqPTC3N5q50dJmo90kTmHSvkfZbgcCbzDAeuLrIu3PUEy8CcQ4FCpWss2EL76ViTguvia2n/iRUZFfIChqwBX2QoI4ANIo/Lya4vGsz+i4ymn4k0d+y2mYh3upMNMbFeeT1UDeAPywcsXBKRRNsDCvYJs+omTyFXiFHhMSiE3zNMkbpnxIKCblYsbKlWlvNwwGXqsGTCcfDdy+Z6UGed7m/j9jJTm9wkIFh5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB8456.namprd11.prod.outlook.com (2603:10b6:510:2fe::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Thu, 13 Feb
 2025 00:56:00 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 00:56:00 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBNYWludGVuZW5jZSBv?=
 =?utf-8?Q?f_devcoredump_<->_GuC-Err-Capture_plumbing?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIE1haW50ZW5lbmNlIG9mIGRl?=
 =?utf-8?Q?vcoredump_<->_GuC-Err-Capture_plumbing?=
Thread-Index: AQHbfIUTAKBMar5QEUK1LSLX2HnUNLNEawsA
Date: Thu, 13 Feb 2025 00:56:00 +0000
Message-ID: <06aff601a206ab2392be32c66833b2a9c6255b2f.camel@intel.com>
References: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
 <173927887684.917241.3584412810380166999@b555e5b46a47>
In-Reply-To: <173927887684.917241.3584412810380166999@b555e5b46a47>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB8456:EE_
x-ms-office365-filtering-correlation-id: 6ff241c5-5a1f-4acf-c7e1-08dd4bc92ed5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RVR0ZVcrWHJUUmtPWGczdEI5WnpweW43OHdFdWlCdU1mM21RQUltVXg3cXRG?=
 =?utf-8?B?THBMelZ0cFZNQitreVF6RHVDek4xbFdvWERoUkxZcENja0VGelZFMm5kR3pi?=
 =?utf-8?B?RmtPMEx3TGRoVG1YV0dOSlMrZFozSjR6alB0cXlZT1huMHFCWGdPMUR6c29M?=
 =?utf-8?B?Y3kwSVEwQzk4ZUhKb3RjdElmTGdSZ2dRbUpjdVFxTVNCTGJqTDBFSkFiSFlC?=
 =?utf-8?B?UWxoZmJONTArMUFFeHpDak5QV1hmU2xFZXczYThSSXlJTE5KTGNGWWkyNUhw?=
 =?utf-8?B?eE5sSjZqQUNHbExBNzNWOEF4UEVFMEFkaHEvY1pHWmViTXZkN1MrcVh2L0Qv?=
 =?utf-8?B?aXFmWEFHd3N1SHkxdmJVMDk0TjN1WlN4bFkvTlkyOGFXOU14dCthSjJjRmcz?=
 =?utf-8?B?dnRwMWR0N2djd1YzdUgzdkxSOEEwVmdMaGg2NlI4Yk5rRmxOYXF3TTQzOTBM?=
 =?utf-8?B?dXBBbk5velRqc0lYMzRMKy91UnhXUkJrekRLa2s3Rys2Y0xlVW9ILzlHK0tS?=
 =?utf-8?B?K0V3SnJycVlqd1crSVgxYkM5Q3dOemcvQTZjNGN4Z1Y3bmFJc3J3ZGd5WURG?=
 =?utf-8?B?ak9TUTlJZ3lRYjFGemdlMVRaQ0JHM3A0cHRrYlE5aFBFdGk2SzEzSStxdWEw?=
 =?utf-8?B?Rm5WalF6OEVQTTB6QnJUaEIwckJUalE2OXVLak1ZbHZJRFlQUzRqVzRSZDh5?=
 =?utf-8?B?aXVoVmpRL290TFUxdEVJcm9MMFpRcU5nUFFIQkg2NUQ0TEFtUjFXZFhzUSts?=
 =?utf-8?B?M01JdjBUbjNESmdrNHlES0diUzYwZmhzRVZyMGI3cGhCWjRqcUVBaXIwOEUz?=
 =?utf-8?B?TUxPS0VSdWlxZzloQVZvZXQ2bUl6SFVSTGcyMlVrcmFlOG51cGIzY2NxTlFx?=
 =?utf-8?B?NFdXL2FmN0VyVHM2VnFDUnlBQVBacmZJS2lxUTR5Ynh6R3FwMkZROFAzVThS?=
 =?utf-8?B?RjdKWFdYMDhXMThPTm5oWVd5RFRsUE0yVUdPRGlFK3BRak5EWGZRYUtaOUY3?=
 =?utf-8?B?czlLVUxIcnRuOFVEamFtcURmZ0syZG8rem5CbFU3UHRBdkJyd01EVDFiS0tU?=
 =?utf-8?B?eGJuemtoMS96SXBBVE12Q1dQcVdjQ1NDbXdmeHpac3M5SUc1NzdXTHZoQ3My?=
 =?utf-8?B?NUtuZUtxTXFCNlZiWGQ1OElYUDNKZmJ3T24ycUdnei9hWjI1YTR6NDcxRlF5?=
 =?utf-8?B?cVpNWmQyL0ZWcm5wREc0eDNxSlpzWkNZdEtjVFg4YkQrZVVOTzdHYWxGVUd5?=
 =?utf-8?B?NDlzUVRnaDVHckY3VEtWa3paUVlkWkRYaWFIKzBzaTRJZ0E3Y2dtbC82cVFh?=
 =?utf-8?B?Q1hVeUFBeGVrb29Ud2UycGFVdlBmRFBabllFbTlGTG8wS0dQQVZ6V2VXcWFa?=
 =?utf-8?B?K0FWekdoWWptSE4rcFl6V2g0Yk5xc0c4ZFR6RmxVQ283WVE0WGpzVU5JZ3Ax?=
 =?utf-8?B?QmUrcStZK0IwOWJ5b3BydTFYdEY1S3pmYlhma29tblR3NFVmUGZEaVM1V1RJ?=
 =?utf-8?B?U1A1eW8yb2dRd0RON2ZUTVZoYkNHeFlkdDYvbW9zTTNUZDhqWThGRnhSMVF2?=
 =?utf-8?B?RkFqUWZGaW43c1VUUHV3SUgvT0hRYUNTNmhGZmhCdGwxMjAyUTNQbU1TYVd6?=
 =?utf-8?B?VFhzQzcybVd4RW1pQ1V5WE4ydmJSbDA3ZVYwS1dMcmgyU1F2bllRVmxLcWZr?=
 =?utf-8?B?WUVCVmZrRjY1c0R0eGs3Q2ZxTFhNQXNJZkExS1IzNk1kYmltOEF5K08vdnZt?=
 =?utf-8?B?VjFCOEdzYy83RHJSOEVOUTB1RjB0WlY1bEdYVHJZT0pEYUdoYUFSZzgrNlBC?=
 =?utf-8?B?MlVrS3RDUmc5L085MXZiSXBwSTl4QjF4aXpxVnQ5bk5wWUR3WG00ampoUXQr?=
 =?utf-8?Q?+yljEX47cU9/s?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0tWN1FpZmk5bHRQektzZzBmdi9WNVgxRyt4MDk3ZVVlWC96LzFoVWh1a21I?=
 =?utf-8?B?NGUzdXFFbGthbFhXRTE5STZYRFJ6VlpOUVk1M3pBWGZXNWlUYVBOWW9ra20y?=
 =?utf-8?B?NmgzWFpWdFdnZWVsMzNXbEdIVVJJNWtiQjJ0UFN5ZCtUSGN0dFF1NDZhT3Ns?=
 =?utf-8?B?c2tnNVpkd0FsUWFYNUJ5SHloTjVha1M3bGEwTXd4R0kxVWFQdngranpXWUQ0?=
 =?utf-8?B?MkJLM0hyY2QzcCt5R0pOcjZZaGhLNkdIdHZsZ054c0Z4V0J3aExycWYwaTBj?=
 =?utf-8?B?SXJnbk1mTHQxQUE2eWVUY3FpTk5uQ3kxSXhZdW1qeTRxVXFSMXhaZWdONWNy?=
 =?utf-8?B?ME8zd1hjaGpEQzlYa01qa3lCK0VTaUtXd0RnTHN0UWYzQURzWjhUNXY1cE85?=
 =?utf-8?B?aUM0VTh3TjhHVU5TdTFRaFp3UXZRcTJLZUdsNlFnOXN3YUhQNUVKdVN0ZjJv?=
 =?utf-8?B?b2VKQ011dTRqRUkwYUZ1NnNlOTB3YzZNcFpyakgvTlQrMkRiNytUd0tqYWRD?=
 =?utf-8?B?NkhsaEpuYlRmeU5WUXY5d2RuRzNmRmY5N2x0R3pjYkhyUEZ6bmlob2hjOXNS?=
 =?utf-8?B?Q21YL2hQRjNoYm9EUmlBNXdoNjF2eWFOK1VjYjErbFIrRitmbXRiS1QwZkpN?=
 =?utf-8?B?M0o1UXIrTHNhRW1zZlNlZUhyYnBMSDNQaU9KRVhGditIcXhLSXpERVpSSnAz?=
 =?utf-8?B?N2NtKzExbjRrbTZKQUxUaEFyUjdsc3NUVitLc0ZnZklyM0ZMNGd3SzRNSTZK?=
 =?utf-8?B?SkN2NWVubVlBT284TXV4U0NUdHUydU4vSjJUZ1JMekpqTnFVMXVjZ3dGakwv?=
 =?utf-8?B?dkVpTmY1TnlVd2xrbS8yMTk4UTRLd1ZxaG5LSUw5WldQVGlZU0RxZklLQ00v?=
 =?utf-8?B?OTBNUWlOdWhHclh2UVJOdlFtYkFXYlRVMzAxOXA0ZEgvK2VVRFVkRkRuU2U0?=
 =?utf-8?B?ZXhIa2tJR1pleENKMDYwY0Z1WGVrTDZIbUk4cHdlWXZsZTBkT1ppT0ZxbDZk?=
 =?utf-8?B?RXNLSW8xSis3UjZxWWVNSFJ0STFjWXRZV0R4Z01tQ3Q2Ty9xdCtscm4vWlM3?=
 =?utf-8?B?TEI4Z2pHQWJaOEJmNkVBb2hYMmIzdHpSQzBQYllDZjgxRFU2UWlWemFXYk9S?=
 =?utf-8?B?U3B3NkZ0MXRGWG5CVVAveURxeXhWanFsNWdHNks3Wm4zeUtIdWFJeDZ5dlBF?=
 =?utf-8?B?cmY3TkNLbmdPUmduaVVvM2hia0hRV3NFc2kraC9KRHdGTDlseGFmRFNBWkJh?=
 =?utf-8?B?SlRncG9xcnZIb2VzS0sralc4ZHZ0RW1Qby9NK3BDNERiM2k1SWhubFdjcUF5?=
 =?utf-8?B?QkRsRHF0cWJQWE8wWGQ3aVdPUVgyMjRmbFdnQk5yN202UmFLNjlkcFliVnlh?=
 =?utf-8?B?Q21CdmU4TG9JYk0yREdnM01GMGVSZ3FFbjAwWG5JRnM3QStHV0xTS2MzMWNN?=
 =?utf-8?B?a2RCa3VGT1NkT3FXTmp4Y1VHZUh0U3ZMLzlYbFppd09keDVrd2NHNnUra3Fu?=
 =?utf-8?B?M21MUXJzRnVMOVk0cWoveGtkV2cvVXd5TjhsZW9OVjFqUDd6WFNHRzFLenUz?=
 =?utf-8?B?VitFbGtCUEU3NTVEVHJTRlIrS1J0WVV2VTRJMVFlVHlUZ2R0ZDF0Ri8zVWhB?=
 =?utf-8?B?N2VRaXZLaHZBQklqZFE3QVJNZVlvWmZtVTQzQXFNQ05IRVVaVUhLRFE1NWlN?=
 =?utf-8?B?ZlN6THg3VjFlc25jZThDeVNTK3gzQTg4dllweEpFZ0NFWWY4SXZmMC9GM1J4?=
 =?utf-8?B?OFNWaWs5cmVaVHcwSFRKUGFHZUJ0TS9qejY5NG5OcVlqNkZQdGNMcVYrNEcx?=
 =?utf-8?B?QStwYXUyM2I1TWNQL1U2YVdxamJHbGV3Q1NIbjBjS3JwejUvMFJLbXFlRlNp?=
 =?utf-8?B?SGxPNUhMRDdTOGp3RjRwVmhEMElNU1JIdUVmdmpPZnlnN01YeGxuU0VkWUpk?=
 =?utf-8?B?NjRpZnpQZjVROG8vZW1RRFBlMDdQNlV0SlBQZ0ZXY0k4MGdBRlhyakltVHBh?=
 =?utf-8?B?aXg3UXh0V1M1a3JjNzFGNGNLTVFpV2g2cTNobFpuL2dRc1dpSkVHa1JOUmhZ?=
 =?utf-8?B?YW5hSW0wVGU4ZWwwc0gvTFVTWE1hZHVHN09lT2Roei9meU9QU2NucERVTFpQ?=
 =?utf-8?B?TXJWKzlhN2JVQ2x6cVoyWk43NnBPOU5DdXFGVWNyaTNxZlZmZGE5MUlTdUx0?=
 =?utf-8?Q?x/pSqGyhq5jy1dFS9PfOM2o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F4AB84615E6AA468547346C934D4811@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff241c5-5a1f-4acf-c7e1-08dd4bc92ed5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 00:56:00.2186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QjceEe1xQTCCyZQ7Fk3O0Jiang4CGNez62jtDEqlOOSUSs7M5D8vjotOYi4GhaMB+eb1LnNYu5GgL+17zNnw0uS44nOLcQWwCNJq/u1cj44zekvXPR7HgeDju6q84A0a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8456
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

T24gVHVlLCAyMDI1LTAyLTExIGF0IDEzOjAxICswMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+IFBh
dGNoIERldGFpbHMNCj4gU2VyaWVzOiBNYWludGVuZW5jZSBvZiBkZXZjb3JlZHVtcCA8LT4gR3VD
LUVyci1DYXB0dXJlIHBsdW1iaW5nIFVSTDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3Nlcmllcy8xNDQ2MzQvDQo+IFN0YXRlOiBmYWlsdXJlIERldGFpbHM6IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE0NDYzNHYxL2luZGV4Lmh0bWwg
DQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20geGUtMjYzNS0yZmM1OGFiMTAxMzk4OTU2ODYw
MDFjN2UxZWUyNDdmMTUyMjZhYmM0X2Z1bGwgLT4geGUtcHctMTQ0NjM0djFfZnVsbFN1bW1hcnlG
QUlMVVJFDQo+IFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIHhlLXB3LTE0NDYz
NHYxX2Z1bGwgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+IMKgdmVyaWZpZWQgbWFudWFsbHkuDQo+
IElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0
aCB0aGUgY2hhbmdlcw0KPiDCoGludHJvZHVjZWQgaW4geGUtcHctMTQ0NjM0djFfZnVsbCwgcGxl
YXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZykgdG8gYWxsb3cgdGhlbQ0KPiDCoHRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9k
ZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KPiBQYXJ0aWNpcGF0
aW5nIGhvc3RzICg0IC0+IDQpTm8gY2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhvc3RzDQo+IFBv
c3NpYmxlIG5ldyBpc3N1ZXNIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhh
dmUgYmVlbiBpbnRyb2R1Y2VkIGluIHhlLXB3LTE0NDYzNHYxX2Z1bGw6DQo+IElHVCBjaGFuZ2Vz
UG9zc2libGUgcmVncmVzc2lvbnMgKiBpZ3RAa21zX2RwX2xpbmt0cmFpbl9mYWxsYmFja0BkcC1m
YWxsYmFjazpzaGFyZC1kZzItc2V0MjogTk9UUlVOIC0+IFNLSVAgKzEgb3RoZXINCj4gdGVzdCBz
a2lwDQo+IMKgKiBpZ3RAa21zX2ZsaXBAcGxhaW4tZmxpcC1mYi1yZWNyZWF0ZS1pbnRlcnJ1cHRp
YmxlQGMtaGRtaS1hNjpzaGFyZC1kZzItc2V0MjogUEFTUyAtPiBGQUlMDQo+IMKgKiBpZ3RAa21z
X2ZsaXBAcGxhaW4tZmxpcC10cy1jaGVjay1pbnRlcnJ1cHRpYmxlQGQtaGRtaS1hMjpzaGFyZC1k
ZzItc2V0MjogTk9UUlVOIC0+IEZBSUwNCj4gwqAqIGlndEBrbXNfcm1mYkBybWZiLWlvY3RsOnNo
YXJkLWFkbHA6IFBBU1MgLT4gRE1FU0ctV0FSTiArNiBvdGhlciB0ZXN0cyBkbWVzZy13YXJuDQo+
IMKgKiBpZ3RAeGVfcG1AczJpZGxlLWV4ZWMtYWZ0ZXI6c2hhcmQtZGcyLXNldDI6IFBBU1MgLT4g
QUJPUlQNCj4gwqAqIGlndEB4ZV9wbV9yZXNpZGVuY3lAdG9nZ2xlLWd0LWM2OnNoYXJkLWJtZzog
UEFTUyAtPiBJTkNPTVBMRVRFICsxIG90aGVyIHRlc3QgaW5jb21wbGV0ZQ0KY2hlY2tlZCBvdXQg
YWxsIG9mIHRoZW0gYW5kIHRoZXkgYWxsIHNlZW0gdW5yZWxhdGVkLiBtb3N0bHkgZGlzcGxheSBy
ZWxhdGVkIGlzc3Vlcy4NCg0KYWxhbjpzbmlwDQo=
