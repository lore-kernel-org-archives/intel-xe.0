Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A65DC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 15:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E2010E91A;
	Thu, 10 Jul 2025 15:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ciA+s2li";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AD210E91C
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752162477; x=1783698477;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oHbRjhNk3HBb6mnz9XZq6mOtmOHnsIjpvA4tpcasf8g=;
 b=ciA+s2li37n2nP7cc26mkFhh5tXQFr2bN6NBnWrg+vvp4Wv2ssbaFdRn
 bkEF8y5w1NypKARpSitDTLRhK5KLm3LQhoSsOHM5Qx7sZXB0BmzHp5qpb
 YMRJ7GsbldepXRKU1dapM7lTHuVCGfVYATYJrDgfo3zmVsrLDueVSDG4/
 9haKxOoSKSGuiAe9YzwzNtpnhsv+5Z0LNNMSO3qUTRJKHKRkNZD5hrDba
 MIt0v8GaoD/nIV8B8EilPLs0x1e9mL5QPRGYXnDxFqeemEYbXD+tb1HaX
 NEPzPxL2UPA/YypK/9mvEaxD6Qij1l587nF+1dLNLx8dscbkzzef4moyF Q==;
X-CSE-ConnectionGUID: B38dwd8yTHCxobyV9FNUbQ==
X-CSE-MsgGUID: 28JT1O4rTSOG7RCh24D65A==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="72034453"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="72034453"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:47:56 -0700
X-CSE-ConnectionGUID: PpJIrEzwQlqagaP0YmeHbw==
X-CSE-MsgGUID: 0dViNNvuQH+6w6yesoiTTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="156607547"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:47:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:47:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 08:47:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:47:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTBnBiK0H8eNlvN0msvPJQirQiz8211jWZEYEYRcmUKhIin1cJw1ZF0V4ojO0M8yfD3WGVck3gNwmIhD54RTzUTWqbpnuH4vsWpks5Sj8e4M1eahiTr8hYxUlxHZ93NhdtU/9s0tXuhdcHG0ZazwxzpHZQDosIyA31q3BDnr+AgBX7XiXuVzSbB2oQmmNOm3xISDB3jBSTOPMJLCYe/dBer4+9DNhu7geF6y1eVffP1lYKxYBz92dX/tVJS/O8quZtj4kYwi9FUt1NOJ7dEycPBRR8/puy6ROH4LU2aS1dVWenfOaifCO+LjoKCKnX0qtkCo6/QS4p2i7GnaVwfe1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsyIfIMk1lwMWgra6Q8LYNt9xypcqaaiIrhQXd2s0nA=;
 b=LUH0Al5EelhQFiWahh7qMwvVMwNNPE9/vXl6FtnGdxPVI/54MJUlNK7mIys/9Is04VHqulgGegO/P7OUYeBw6O5Ak6gGnlWysaoXGD3sVnYVrj7DIdAtY8aF/fjv/SV81h7Qam11rvhA/sysROjjaTAC8QSn7LI7ZDGlwks7+jN7HfHtJHJLjvTiXYrpzoV3x96KJ8n9D3o6D28tdkJg7xgNjMPPCVi6MK7mi2V2s9VvSFU7ki4Wooox+794PyF+26MmpIWz+o5woP0Hd+hSabaCs8tcyjE8u8fv2WwLQ18svb6HOFWiACmv8ygXaqUV9ZHNknFd0weZuEQHd+qKvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by DM4PR11MB7349.namprd11.prod.outlook.com (2603:10b6:8:106::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 15:47:25 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6%2]) with mapi id 15.20.8901.023; Thu, 10 Jul 2025
 15:47:25 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v2 1/2] drm/xe/bmg: Don't use WA 16023588340 and
 22019338487 on VF
Thread-Topic: [PATCH v2 1/2] drm/xe/bmg: Don't use WA 16023588340 and
 22019338487 on VF
Thread-Index: AQHb8Yc0mdoCN7qzqk6rV3ICXh5XYLQre7qA
Date: Thu, 10 Jul 2025 15:47:25 +0000
Message-ID: <IA3PR11MB9304227D51E65C9A5EE463B4AC48A@IA3PR11MB9304.namprd11.prod.outlook.com>
References: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
 <20250710103040.375610-2-jakub1.kolakowski@intel.com>
In-Reply-To: <20250710103040.375610-2-jakub1.kolakowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9304:EE_|DM4PR11MB7349:EE_
x-ms-office365-filtering-correlation-id: 9048b930-3d24-419e-b5f2-08ddbfc9110c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ahAi5lh1OIyzMKaNy91+bDlHqhP08dJmeCIIazEgW4E2XuRFJDvr2qTnEXsS?=
 =?us-ascii?Q?zqLp7G3yPn1wJ8UxWcclCbF9LVun+QUrglbqTRY79sLsK2JsuCN17eGjC8kw?=
 =?us-ascii?Q?o2eZ5U6na4CyC/YscEJKMLWDCmJp/q+yQKBN/bPNM78hM4vGILX+zI/zMJt6?=
 =?us-ascii?Q?voY2WUndkb6dZi7sTxVol//yxdvW5L92lFOv5IEZzmHFc4hG17H+iMVY1/7u?=
 =?us-ascii?Q?5aI0zEA2W01UhkBA01dNTG+41xTmlCMvrino2W6hAIZYNrPNCEuFufNedSRH?=
 =?us-ascii?Q?W8QcDTbuenhNGjiil8MIsJ1/WFBv2DTkNxiAc42NCrNWbY1OkNrWaBzcP8+9?=
 =?us-ascii?Q?zhTJO8BrRPY3/EGGOahCRvXwF/o7YEzLCpf2KKQ87bIMmBS0j9qxdofLEOJZ?=
 =?us-ascii?Q?ZJN0zh7zAF6eZHKgDZUKsZya4nCqjU0NOMRppo4PHYLzOGRMDx6uXICzRX/v?=
 =?us-ascii?Q?F0TIIi6GebmUM9Dw8lGWTQQzUlxD6XBMFt+SandoLksPdt6QzTF7hrmVeL7z?=
 =?us-ascii?Q?CyOBb28SdXvKLkGaQcNoS6Ow/9APmddPK+hiEg5W0cRLxv8xP8XbJoarZL/0?=
 =?us-ascii?Q?03EYLuL/yKuZZZLufdXPgtX4B+QArNnqEFv0aLctdhUgzwTq5uZVq+m0/Y94?=
 =?us-ascii?Q?VdVYYABCCXmnws8Cvr5/SPZlPUlI47WWW617rx12KwF2xhbVSF1YKCz+zNZ6?=
 =?us-ascii?Q?V2sxOrywbEpQ/MxbzdfE4w0dQbkTSAGkiyJ9BT69tii013kiNIcmO51SDXZn?=
 =?us-ascii?Q?O6pnU6sGC5NF48a9/oBTrRwaBX5UpIYWSCePEQtQOv2p9A0/6bP+188md5hH?=
 =?us-ascii?Q?SrPHTNaLcJf/OwALulV0I5yBfUUmvb5F5o8NRIycMY3ftemY7lRkkugsDTCL?=
 =?us-ascii?Q?nEovkL2L6hnDHkd3/8RC+C2NJ3UVgNTTp2ItTrNYti0FBBJ7O9EkeEr0FzDL?=
 =?us-ascii?Q?K7LATBHQJqz60VnXT/krvdUTD3fpUJp7MWZNmGOnQDmc0W+4DQgWwxhsp1hT?=
 =?us-ascii?Q?JIoDMqt8p13bcATVkxp0B+Gl1WtYA8pq24kbT1I+Y5iDLW7rA53xdd27xUWn?=
 =?us-ascii?Q?KDHlt/pDyoAQPJ/avGjSIQvmfLUmfpHLEb58RcUofb8lJGJ8aM+/chzUPTu4?=
 =?us-ascii?Q?IGS13yqe9IxXEBiudPjx6Sxv4o7WrGNV8gPG2O6wNxsRifhw099yDyEN0JAR?=
 =?us-ascii?Q?l2VuD4AyrbA3hc75WeBWsFQJN7MOPy+RKtwBZMKi27kZVG1xyw0SNWAoFCND?=
 =?us-ascii?Q?2hYbI32HRKh2oRCvqc2xC1SefOkDOf3rLXbxMliXF8F1D0CRyCN+6wvlVKY/?=
 =?us-ascii?Q?fwENHmPwCBYzqUgE99DwgVyQXjVtnRz7Q6GHWabWEGDouUjznFLWujJBZXrP?=
 =?us-ascii?Q?XDR0eawYle4/gNgJH0p4mqM5YrfFfK5S8PgRFyxtqsih+5bury5GDid0+sY2?=
 =?us-ascii?Q?80w0pSC1tyGzVdyJBHVJCEvkOBrc1TlsXJKyVfywlqwDItmnhqBC+w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qacIw0x3kK/LWdS5gkDWEF8Dyem+p5WfrllSv9YPxhXWJEN6B6GnMnJsLhCC?=
 =?us-ascii?Q?oI96xFANYkq3rhdXMMjLwGleMTBhGp1834g1dqNQHHX6bT9sLQU31RQQNRd0?=
 =?us-ascii?Q?V9BrkOsb6wMS9B64EdaoeCx3o1M8OvVSjc5EugGNhQszOIQ4yUU8n3rNzkdG?=
 =?us-ascii?Q?W1qtmoqC4nyyYC13/92dpBvX8sTYX6RlJgi4wyXBfttwsXCNjJkAJyLQ5siq?=
 =?us-ascii?Q?o1etyG0k2lpDvt7oG0+rbYSvuuPiNP1r8mjScd5su7GNxfTGKv7qGxnCav3N?=
 =?us-ascii?Q?q+QTVjBNTA5mBW1OCaxbkgclgJ0YqogjKCh8bOvsDF0d5HoDH9Mb6qAPsYHh?=
 =?us-ascii?Q?CNWl46sg9m4y0TpiobKllu06LjozJywrJBmDs35HrAUc9k2pMI0deN6pwQcz?=
 =?us-ascii?Q?GCunBkVJE1OEDwW3LBx2EjB1z9K0aR+sR9/IycL9nnCPZI90KzkyvACzTJ0G?=
 =?us-ascii?Q?wIwMYpdc0nCnS3Gj4SQQo5zJezP6udYBcE/HclvSYR5qDOzbeYiRW/pFvQ19?=
 =?us-ascii?Q?a9fbjezTRqmE103j7RKdwVaHhBSWvbPVUtwpxoeDkoePWD9IxHurwJbFceH8?=
 =?us-ascii?Q?8TijGoDAhzY8J+AlOX9Xovf8kQpe2kr2/wgwgva0tXxzP93qAEix7IMVdD+Z?=
 =?us-ascii?Q?XZ+tvJ+Dn29p/DXu0Vxh84P+sNfDvdxUmyTY9za40cuJJarBiQEYhx//DRXh?=
 =?us-ascii?Q?sAkdOayDwGlwEYRDVigYS2DfjUTVt6bbboHnHZ+nDsFWfewo0VvhvbhbLv4l?=
 =?us-ascii?Q?nJ+VTiHVNke/R8Sxrn78xIRI3HZ8StmpXfnbzN+78Li02uYpEnZWq8U4YZTk?=
 =?us-ascii?Q?Tel07v/LSJ0bST//wejVZ4f3ihto7tc/gXpcX8Oe+2M6oaC+N2bZbjPk4Lp0?=
 =?us-ascii?Q?nSK/KVEymUKlzIhBIUGiaB3M+38rq5nbp/fCyqIv9GExo1HOsBzXILUSMmk6?=
 =?us-ascii?Q?GePQWm0LXh0O5QkZ4XzCjDMK9RTBH5XKZTpD1AZgfN2sTZGcRLzLTLUG8EMZ?=
 =?us-ascii?Q?8jRkdJyNFfmzKL957zMZvwAy4U34zh6qj6Bj16WHzEkNYOZ/owlsty+WcV22?=
 =?us-ascii?Q?oXkmV9Uco8I6kYz3CJzCabMPDV1UNFbMwQU7jgq+pExsEa2cvGFXItjip06u?=
 =?us-ascii?Q?D8x7pR/Vea349dQ0hMTzjwe94qTuKFIzNhVNKlslm5M9NkE1HBxFB9Qyhikm?=
 =?us-ascii?Q?Hlqw4Ahr6+IvK5miiDNc6nyq8Pg35NbNMT8799LEjGnZLlwnNXsQgn4O8Cjd?=
 =?us-ascii?Q?oP+YUG3jGlWBFqxVAwvTUDZsu0wKu5GUIcCpLDrMovDrNgC9fWR1hQ88ErNE?=
 =?us-ascii?Q?vmJYHBGYmt0LYvtEhlStThdlPzVI6Dux2yVROugGwYnnkG2p6gr1tSJwuELW?=
 =?us-ascii?Q?WpGV4yw7EJ1hhsbw+EFCaYkn8tNvmOduABy3oSFXVC3tI5AwSJwgTJT3VAcj?=
 =?us-ascii?Q?YL5Ba8FtdLepEzsfFnqMqbqWVMSsdYgiABFZ7UsbgwXvcdLHSBeAsII8AE7P?=
 =?us-ascii?Q?E+cxXh7reu88yrpwdxFEt36SBnmgq1se3/yqq4U3uDG9cQjrHHN69hMsv65H?=
 =?us-ascii?Q?i4z1QAsHE1DaPiwQzN+pWN5uJ4cuhAiRVMR7Uleol3bW5jzeO4ldObRQOfla?=
 =?us-ascii?Q?bdYM5OYf/ktXdJfvVDP0QDT5KBPupRA1I4y6Rh52f1wJMt1TplhgSeO8S2v7?=
 =?us-ascii?Q?nOqX9g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9048b930-3d24-419e-b5f2-08ddbfc9110c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 15:47:25.1759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /4e3n3nzeH3p7QzrYdmxXps2LF00HdFmY/+TwyL8DoW4LNu1ghCmOfqM7+gKjz4qE7jBPet1wlATKhapZLYVLKbIH6iEYxru23CCE8P+HOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7349
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

Adding my 'signed off by' tag

-----Original Message-----
From: Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>=20
Sent: Thursday, July 10, 2025 12:31 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Kolakowski, Jakub1 <jak=
ub1.kolakowski@intel.com>; K V P, Satyanarayana <satyanarayana.k.v.p@intel.=
com>
Subject: [PATCH v2 1/2] drm/xe/bmg: Don't use WA 16023588340 and 2201933848=
7 on VF

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

These workarounds are not applicable for use by the VFs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Tested-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_=
oob.rules
index 96cc33da0fb5..e7ed5d583d68 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -40,10 +40,10 @@
 		GRAPHICS_VERSION_RANGE(3000, 3001)
 		GRAPHICS_VERSION(3003)
 22019338487	MEDIA_VERSION(2000)
-		GRAPHICS_VERSION(2001)
+		GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
 22019338487_display	PLATFORM(LUNARLAKE)
-16023588340	GRAPHICS_VERSION(2001)
+16023588340	GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
 14019789679	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 2004)
 no_media_l3	MEDIA_VERSION(3000)
--=20
2.34.1

