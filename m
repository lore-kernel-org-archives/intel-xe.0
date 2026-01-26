Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BCBD19502
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 18:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0313610E247;
	Mon, 26 Jan 2026 18:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LadNIhS4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFF510E247
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 18:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769453298; x=1800989298;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1m1/iu+xv+okOTt51b2shwnBYUzo2wp/HGjQarN4XpY=;
 b=LadNIhS4kBa8wVIkts0K/CwZejNSqfFqcOPS1o32WkWDInTPgtUnyCPj
 D0cLi5OVICDdj2jcqSJ/K43KNIsVOnjpamD78JdUNPokmqNUt9i/eHj4l
 ZHMonZe4Q28zKrPOOI7ECnbdyriDOwBvGV5ejYCWDr70DW7+Q6sXXgu1E
 UfF74VcvBNw/2nmieSn0/wHj9q7A/AnNZIOUEkEi7Nt+ErLw0ZJd4vlk1
 T/52g/soIPY0Iy/Y60TdI8iFPlg98Ay9n6/VomS7ymp9kDlO1eFzEyfXr
 TVsbM+77m/j+S03d57iKDwmJn5DXkW+2reViIAM+WEN5lX+f12zmo3K7K A==;
X-CSE-ConnectionGUID: r9uQj7KNRC671bEcFTenRQ==
X-CSE-MsgGUID: hpnrBM4XTruDvPS0kw/s+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82004602"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="82004602"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 10:48:17 -0800
X-CSE-ConnectionGUID: qQU5OZtqS9yh4J2GMzzrKA==
X-CSE-MsgGUID: n8K92VW2RlGjkg4AWZnU+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="207554217"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 10:48:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 10:48:16 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 10:48:16 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 10:48:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzDPtSRklWPWVK7xFVB6+ypWfHtkToGhxGE3DXHo0NlDBuXnNn8sHJCWxsYUF38D7XTujMwkeJ0yhdc/o644/SAt1X3NBkOdiVy2fj/RyvzkxPdLhtRlC4tFGM5o+0RAM5+dIEhJUJBATGAF9CfK4yOQrV7Z+olAWlNzVZSOKKlpi0sNbCYi7/xhYNN5yA6jA3tKs3nx9CO3V+J+Gv0ug5O5zpc9TBVQzZESQxU95FHVmhuxPBCjrcLo1taG9n4KpGvK62eg+dWycpBQXqNpsqzefnqgZT6ANltEB2geq4Bw7cFUBhKQkWdbQ7RN6PHDYbmeVOMSbgIaFccjEEz9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfaIG08u90pE+e2p1UcCvFbNQIFTlF/T+xQvxIoWGRc=;
 b=KJstaYTneLt4MUp5uqF2mOdabMThr8LhGQr52Lkui8geV3kfmi32U6dNrmyn4MSoQvfe2Q/922ri66sek8eLlEkETL0l4Yg3dPrX8XbPL1OESs58JjJcdCeE6uff2jutIpUhLJMYx+7FyGC+cUK/IurWvkNycRgI09OB4UkvjARe0FjqUsdXqS8Ikkxd8uYMupWcgUqqZbL4Oc8uRRctxmhImXOkkhfQA+nE2XQSUNNzswWnWvG+LaHvdtcKW4mUFxWBHjsDu7VgWIBZaK3KV9ol8CUs7Goxk+8zUcnI3yRkSijCfLLxTe543YiNs87x65sdyjkan5VatTuteHiEJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 18:48:13 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 18:48:13 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe: Unregister drm device on probe error
Thread-Topic: [PATCH] drm/xe: Unregister drm device on probe error
Thread-Index: AQHcgazWOAmGUTQFNECuVqKFvu/ZKrVkv2ig
Date: Mon, 26 Jan 2026 18:48:13 +0000
Message-ID: <DM4PR11MB5456545AAD6BFCA48E25A116EA93A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260109211041.2446012-2-shuicheng.lin@intel.com>
In-Reply-To: <20260109211041.2446012-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA0PR11MB4623:EE_
x-ms-office365-filtering-correlation-id: 107fd880-0a6f-457a-4a24-08de5d0b75f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Uh9u8Ws0c9pgjkdNIkHD2ALjHzrhb1kG+n5KpSN055rHSYBGkxM0DaWlQWqd?=
 =?us-ascii?Q?AaI4Lg9VwCoc2e4SgTvNL3upJ/BhYq7PioosXA5p8BHWuo693AtiZ7L56duj?=
 =?us-ascii?Q?ebTcWjKRsWijQzOZwtAa0ryPLpF6Q7zwzbAT6D3TfiCt4vTDzOoC3i6csl1s?=
 =?us-ascii?Q?X/+WAk4I5F+R9wmr0tHm7uFoahLnrOlWXzxDxRF1/jXlcWt69MQMk8o7NBIT?=
 =?us-ascii?Q?g3lV0lzEQHwYkX+s/s8fY+Umxt1i8dK7L272DZ4hTQcvba83W6u9Mij8ljZA?=
 =?us-ascii?Q?+o9O5PZ2vIJsiEQxpKeWHRA0mbQOmC20qN/mHVBsFUOg0H29zSLq559f/95S?=
 =?us-ascii?Q?kNPSjmsn3nxMQ2MItY5jQNUhQimPvDaJBs++t2ouD04B3HcwdiSaPb7YDjtO?=
 =?us-ascii?Q?rxxy9EzVuP+0PLnAnMYqiwmI7P6Yodr2TxRMvQnCwqXfIHLulEWQItNIkQmE?=
 =?us-ascii?Q?j+ucmp8v2fo2M9tjiU/LAGkyacvEtUroFrmMC0S9J2E5r7Sx2Mwvn7lfldzS?=
 =?us-ascii?Q?ykYyBdyhB/2vHRCcPwKzBXIEzTEwD9PJI6v2TEzB6QEW+oSGOzgWao41AaU/?=
 =?us-ascii?Q?TjmUdDEPBVjRB71wi2ef0l9q+aMk8ou/NEzO2eId3zAdCkdqpx/yPtzn0GMf?=
 =?us-ascii?Q?wWf5iIfCeH4mkBl1qJ9e7cP7SrP+A46ab2yOYKr7D9lskvBjozvYWtjOJ5tg?=
 =?us-ascii?Q?ov0mb7QOcK9sAGomIsoo+0kgJkbHcoIHG85ejcYxcRLOFKvAgDJY4JM4H2vT?=
 =?us-ascii?Q?y8nX5WedVtGVi5lsW5dx2zknlLjRynGXRe6OM9bI8ufNt7Bo7IW88dyFqHX2?=
 =?us-ascii?Q?Pq7XVtAWukgZFbhpPhe4GrE7Mh3/N5GOU0Z3aiebOkcsADtU7vdDl1HAenVw?=
 =?us-ascii?Q?W/ksd8Bkzp3fQ5eVG/+9bOIRxLZWJ9Kf3nfEKxbmmY6BcLzN0v3rhGS+jaIH?=
 =?us-ascii?Q?zeSSB4XzNeAb2j9HRXRid2VG3fqg7Ii6ci41Zjm6oEbkgc//ERaxd6uMuU61?=
 =?us-ascii?Q?hOid0hnRadHVzgZ5FCbJWthFX/X52srq4lBdwIMO5Wp6yunvA/kYqdX+8oSB?=
 =?us-ascii?Q?XPw1RuvGSfwpKE5E5oKEd4Z4uBbqORxDE9Ja5uaptno0KfuKIFWbYU/SW7zE?=
 =?us-ascii?Q?AJBBxz7Guxv8mAHZh57k3iWFJilnPKTep2FsVBln2MAQwMyj3gYm5c8fI4vr?=
 =?us-ascii?Q?FEFYIS1wn+ShQ0GRQBVKf7H1MUf40GPH99wnQHQkiCZO7J/CixDbXb2VBhO7?=
 =?us-ascii?Q?ExyYsIKNJz1xv44LEkFzP9aOgOhEoo5NWf572JsK/bToOd9Y/ELtyuFNJZY0?=
 =?us-ascii?Q?IR3U6ixogV4H/QKAkQvkvh/m/rrxvEfXVXQtj+5JV+l/sMTpeuer5uTW+eHS?=
 =?us-ascii?Q?noKywu29qgSyLgWC2Y/ntVWgUS7wNguBdiJx7clc+1ZhST2rrExWhSD7l7oU?=
 =?us-ascii?Q?wL5QN0x/cvynz02sf4QcXdIfUUVu38rAAiFRZpds4bIX2DE1N+vhJZfH2U0Y?=
 =?us-ascii?Q?p1kArV1tWR9oaLZxkp/ofGKfzL7sghcv6d5isfylZkr0iaJZxFF0tX8EP/gt?=
 =?us-ascii?Q?vRZsE1SbMxFDhH4aIY5OPQhH85ZuTzFMyVafRxTd1HFvRrB6twZckhcv8IIO?=
 =?us-ascii?Q?gKytbp7++YbL/evP/l3WK/8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s/yVwpp/AGg3r6RQwCSyBQoCQs9kNAEewEpN+MzX3Nzis+gZWnuGgKmBxS7E?=
 =?us-ascii?Q?SjNB4dBCdlyuBZSqna6ce3nedyamMEibP8kIDgeED6AECGHRsoAwBYq6bZ4R?=
 =?us-ascii?Q?cbYCe1I3VX+w81UOz6JhfK0YFjdXEY1AVi7enGU54CkEUANF4VyxplD7h+eQ?=
 =?us-ascii?Q?W6f3VZDHNqXKNwpcQVRRJuByEUiYTtAh8S5f6nt5lHBumhRdZ3cbm2VO/zKO?=
 =?us-ascii?Q?3YwUhALDFJ8JRxVgevUtAhIkkWXWY8JUelhYDtKTrh031NPDczvq7UtRQCbm?=
 =?us-ascii?Q?QaM5kEYXBl72P918j/uJ2943xicBFZ6QCm2XeRdrKK4GOreUueDssGZORAfz?=
 =?us-ascii?Q?x/6XDJ98oO5MrbXw8z9ZiTZ876YkfOTALYD5oU2taCGl3KUHiwgwqajlEWHD?=
 =?us-ascii?Q?Vwiz7k//vSMTRPxAJIASSeYHqgyRO0DAUaKZfQTj764mgvTm1uuhFuRQdpvZ?=
 =?us-ascii?Q?/G5jfrZYuI3SqXhe9wGlYeBCWfsHmARQynMA6mF5F5A6wSCzeRZOVwd+uCyT?=
 =?us-ascii?Q?Hh6lk4Z44w44UxHHEEQDi2syYzy4A30cm3Ofs1W6h7SBRjlQM1ZM3vUDvnlI?=
 =?us-ascii?Q?3suhoSIYG7U6HHAgFBwMDk1s3vxNwXV4rWs/Btmrk3zl65lY9kHkNv8eN8L6?=
 =?us-ascii?Q?38zPp9JC7myu1Qb6RPTCL+0RwobnkKIdojUfBDkiUhMoSZHYBJFj6aUXy/Dd?=
 =?us-ascii?Q?TZfHextYQPr4oxTtlqerf0CUl0dg1QE5avwT1hj+/yYZ47IxQO3/Loh4VNP4?=
 =?us-ascii?Q?tNOn9m256C1IUBGoVfwuvAyVJd7tf5TNQESkK6GL+ZCD1Gh8ZwS1XgXkS6Yf?=
 =?us-ascii?Q?NDjj2SO1lYzYdGxPMV9kPt8rReSxsZhlLBZQxApuf34GS04U8nLF7eziWjhG?=
 =?us-ascii?Q?crj+eLHUncjU6cc6Na4fk4XqH+zE+a0hWd/p2Lxj4BiRXJPGoh5aARsjWswa?=
 =?us-ascii?Q?3UMMcHPrea4MUKS78ZriAs1/WXFPvutxTCxFokmohOuLOBxFyZKbC+poJrPj?=
 =?us-ascii?Q?rUd+NJchNrIDvq71GzP1Mybc9kSv6A+uAlzbUUoDowZpLL/bFDRm0YWERzFR?=
 =?us-ascii?Q?R3SXpDHnjC2WKlA9MeBJMFnDOgIfYUh7wDoRSTZbRq9LE77JhjodAj0Jc6db?=
 =?us-ascii?Q?bP4T0TWh79PvDMuYvybdYP6Nlc5kh1Hnk+kDcKWxhl8Jw/64cjunifra2s+j?=
 =?us-ascii?Q?CLYIE+S5i1utQP4WnYNJWjjCLweRNkNWxxMOB3sQv31O/j2gDqgCzqYxnuss?=
 =?us-ascii?Q?kzt/8QLL38s2291Pbrh025wwX10ngTXovbdIF2kqbNQiTjeEEYMxHB93ilvn?=
 =?us-ascii?Q?xIcGmUthYcjdFHUjJuUvcpZPeettSF/q89o95+6jQJiDsKKWLIziazf9OioQ?=
 =?us-ascii?Q?g8IcSUvLB6YoashUZrlf1WBYM8z13tLGXcHMzI8HAv1fLpD6EweW0MkcUjFv?=
 =?us-ascii?Q?i97d3ICeuWL4ramsC/+9XqARdgWMBDpRsyd19YynRd0jdCZ3VoTdDrZ/1qPh?=
 =?us-ascii?Q?rfhlXjRxjP/yGM2UBYmxjRmuVO5QFDaENKIAmzkER4gRnGbF+kUO+1moJgDb?=
 =?us-ascii?Q?x37NZDZWAe+f97S8JwBYg7fwZUueKg8eGOGfOpwL1sDyyZTVG9wD9FveBTHL?=
 =?us-ascii?Q?uvSqyEvfFrb89tbE/rKgHPZJerWc40Ou9sHXJBOUTbyuqP6ZkbAo6G6M1JDd?=
 =?us-ascii?Q?85KFMp9Dar8VcNy65hQ0tFH1byed7V94i7mLRbilSwvDWr9It3kjEJLwSxo2?=
 =?us-ascii?Q?VMVsIWDMiQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 107fd880-0a6f-457a-4a24-08de5d0b75f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 18:48:13.7840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1KS58fzR/6UrYkIsimLWM8Vzfd4+eppBdGBi31uJzkhFiF48Q9BQpz1A2etV9MOXvD9mzdQR2r3q1dXvI8KvCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
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

Hi XE committers,
It already got one R-B. Could you please help me review and merge it?
Thanks.

Best Regards
Shuicheng

On Fri, Jan 9, 2026 1:11 PM Shuicheng Lin wrote:
> -----Original Message-----
> From: Lin, Shuicheng <shuicheng.lin@intel.com>
> Sent: Friday, January 9, 2026 1:11 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>
> Subject: [PATCH] drm/xe: Unregister drm device on probe error
>=20
> Call drm_dev_unregister() when xe_device_probe() fails after successful
> drm_dev_register(). This ensures the DRM device is promptly unregistered
> before returning an error, avoiding leaving it registered on the failure =
path.
> Otherwise, there is warn message if xe_device_probe() is called again:
> "
> [  207.322365] [drm:drm_minor_register]
> [  207.322381] debugfs: '128' already exists in 'dri'
> [  207.322432] sysfs: cannot create duplicate filename
> '/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:0
> 0.0/drm/renderD128'
> [  207.322435] CPU: 5 UID: 0 PID: 10261 Comm: modprobe Tainted: G    B   =
W
> 6.19.0-rc2-lgci-xe-kernel+ #223 PREEMPT(voluntary)
> [  207.322439] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN [  207.322440] Hardwar=
e
> name: ASUS System Product Name/PRIME Z790-P WIFI, BIOS 0812
> 02/24/2023 [  207.322441] Call Trace:
> [  207.322442]  <TASK>
> [  207.322443]  dump_stack_lvl+0xa0/0xc0 [  207.322446]
> dump_stack+0x10/0x20 [  207.322448]  sysfs_warn_dup+0xd5/0x110
> [  207.322451]  sysfs_create_dir_ns+0x1f6/0x280 [  207.322453]  ?
> __pfx_sysfs_create_dir_ns+0x10/0x10
> [  207.322455]  ? lock_acquire+0x1a4/0x2e0 [  207.322458]  ?
> __kasan_check_read+0x11/0x20 [  207.322461]
> kobject_add_internal+0x28d/0x8e0 [  207.322464]
> kobject_add+0x11f/0x1f0 [  207.322465]  ? lock_acquire+0x1a4/0x2e0
> [  207.322467]  ? __pfx_kobject_add+0x10/0x10 [  207.322469]  ?
> __kasan_check_write+0x14/0x20 [  207.322471]  ? kobject_put+0x62/0x4a0
> [  207.322473]  ? get_device_parent.isra.0+0x1bb/0x4c0
> [  207.322475]  ? kobject_put+0x62/0x4a0 [  207.322477]
> device_add+0x2d7/0x1500 [  207.322479]  ? __pfx_device_add+0x10/0x10
> [  207.322481]  ? drm_debugfs_add_file+0xfa/0x170 [  207.322483]  ?
> drm_debugfs_add_files+0x82/0xd0 [  207.322485]  ?
> drm_debugfs_add_files+0x82/0xd0 [  207.322487]
> drm_minor_register+0x10a/0x2d0 [  207.322489]
> drm_dev_register+0x143/0x860 [  207.322491]  ?
> xe_configfs_get_psmi_enabled+0x12/0x90 [xe] [  207.322667]
> xe_device_probe+0x185b/0x2c40 [xe] [  207.322812]  ?
> __pfx___drm_dev_dbg+0x10/0x10 [  207.322815]  ? add_dr+0x180/0x220
> [  207.322818]  ? __pfx___drmm_mutex_release+0x10/0x10
> [  207.322821]  ? __pfx_xe_device_probe+0x10/0x10 [xe] [  207.322966]  ?
> xe_pm_init_early+0x33a/0x410 [xe] [  207.323136]
> xe_pci_probe+0x936/0x1250 [xe] [  207.323298]  ?
> lock_acquire+0x1a4/0x2e0 [  207.323302]  ? __pfx_xe_pci_probe+0x10/0x10
> [xe] [  207.323464]  local_pci_probe+0xe6/0x1a0 [  207.323468]
> pci_device_probe+0x523/0x840 [  207.323470]  ?
> __pfx_pci_device_probe+0x10/0x10 [  207.323473]  ?
> sysfs_do_create_link_sd.isra.0+0x8c/0x110
> [  207.323476]  ? sysfs_create_link+0x48/0xc0 [  207.323479]
> really_probe+0x1fd/0x8a0 ...
> "
>=20
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index e400ad5c9f9e..329d17fd6100 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1059,6 +1059,7 @@ int xe_device_probe(struct xe_device *xe)
>=20
>  err_unregister_display:
>  	xe_display_unregister(xe);
> +	drm_dev_unregister(&xe->drm);
>=20
>  	return err;
>  }
> --
> 2.50.1

