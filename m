Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26956C3ABC5
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BC810E898;
	Wed,  7 May 2025 20:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ar4Y5X3W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE3A10E895
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746650200; x=1778186200;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h3/GVhflinl0zyfK9w+e7zFQtx0gmDwjmGiXctvE4hM=;
 b=ar4Y5X3WnmZQoioLoePkhhjX2HN8pYhxL31c9uRxEmeWyyIDNv8FXEAF
 pUBzLuRSft7TmP56FsWqLZRntFYCcA7PJB1wydpEcUedxZ+QBm6DhSj3j
 DlPDN8eFAy+Tk08NlwedTb8Iz4LM1xyzaf/9DmiKvNpwZXLjqYvOFKyrc
 VLd6XBIKdzxMJXXEkIEpMcVuzd4VeBNTCKhUJ2GUpSE8DKJ6y+hMZ8o04
 byBDBaywo2revxc8gm2/OIKGFctMJ4SKxwwF7naxWTG6434DDnva0F+Rk
 0M5TG9MrjZdPUpbAgq87tKUs5p4q13lvzeullKlDuB3NnBhvCUJqKARQ7 w==;
X-CSE-ConnectionGUID: 8PfyyNlTSEiACcskCqpAxQ==
X-CSE-MsgGUID: dWlH22EfROeTsvfH700AjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="51062751"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="51062751"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:40 -0700
X-CSE-ConnectionGUID: g2HTYYrbTpyk2uKZhBLkwQ==
X-CSE-MsgGUID: M2fsWqH+TcOat9dMuxWC4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="137002514"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 13:36:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 13:36:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 13:36:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/Do6AJCrHUTCVT6zvM08N8tBMyXQJ0ojqfbgH88Y5EXrg2+HdK93xgdGaSZC6UFjJTTjJ3iqMvGvfHw7oLRtxwAygheA+WqmOU15iAXQtyivw+ajV5VTXSeMVzaqQoI5z6FhYLrjyhR5O4Ev6qXKqV9PY9rDP9OgWv+GfZG4xn0G+tb4vNDSMrjtd+JwJL+W71DZY7cZPGq58g96A1/VJBFonl/oEqovN9vKaguKMuEoZxhVVfTwW2FpiFbccATfjmxNc/nv6Q9Ckek1xE32sRIJAC1lBTzYzCYyN3Lcl+n0eygRVqxyHQVa4d8vpFxWEw4mSbgSxlrz5i9kx+b2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zxn7LP+K74XgVAhNFLdlczDW1fpwxwc2dRius6BbsDc=;
 b=ZdZZKsMtvRlXWj7EJZ7YKRNPRvIBiQlFS9UZeEXggx4Flhu5qLz70Q5VxtgPeVrmi5quacRo1nulHRFvorYs8NcSku1djSgItFrRDdeDgUB9ibZ58X+Y4r1cUaV2i9xf49FOd16jPqn7zyCLLTUuN0jmHB0KoKW5+hr5FZJa1KJEz1PEuZqxHQSt1x9DTN9modhXnWm+YC3qY7L5HCuc2WCv7cDpVZlN0fvMXJ+t9USouU5duHTy6BRtUOuFQrweL3h/DLe3L0tqH8L4U0WC3tNfZ//olh9qO/pQ0CQrqvcj2PjfLJJ5KA2POBNESc8+2vVaKyjbShAuOtBpyd11Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7009.namprd11.prod.outlook.com (2603:10b6:930:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.35; Wed, 7 May
 2025 20:36:32 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 20:36:31 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Souza, Jose" <jose.souza@intel.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Venkatesh Reddy, Sushma"
 <sushma.venkatesh.reddy@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 3/9] drm/xe: Add mem_region to properties line in VM
 snapshot capture
Thread-Topic: [PATCH v4 3/9] drm/xe: Add mem_region to properties line in VM
 snapshot capture
Thread-Index: AQHbv4yyTFZ6fFWF6k+fTTb5xSMRWrPHnXHg
Date: Wed, 7 May 2025 20:36:31 +0000
Message-ID: <CH0PR11MB544408CC592B4C71A0DE0FA2E588A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250507201539.1316770-1-matthew.brost@intel.com>
 <20250507201539.1316770-4-matthew.brost@intel.com>
In-Reply-To: <20250507201539.1316770-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7009:EE_
x-ms-office365-filtering-correlation-id: 5823fe48-5325-4108-97a9-08dd8da6d9ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?wWQAV671M/brYWcsQW0VxzxemWes3k63h+UeW9g2USXVQ8sVJEhW6OLKOb?=
 =?iso-8859-1?Q?05xOo05Ml2SpdyEh6+xmgqJpjVYTGymfTk6Ruj/pwxJKsgpv7rrFuD25pc?=
 =?iso-8859-1?Q?6bBtFvnomoCjrLa1OH3DiCzHMInWdtQCCYjuwLOceiQwtvpUM/gUbC1vkN?=
 =?iso-8859-1?Q?3mAV9BA75JdS/mqyY2tjbMwUCCHh02y8olm7X7IVUH/k/9isffNBL34roQ?=
 =?iso-8859-1?Q?ENC8w51Vd9emu0fN68HzPytffMSdy0xRoJmwDeZCijTHSZQY0wv9ET2TJQ?=
 =?iso-8859-1?Q?JBLCoLffeq45cswXR1WMHeNq2ea1xesZ11CgHviJkCkT0vOKK/aRg9vFxf?=
 =?iso-8859-1?Q?U96k+/SkG2Lu3RgtXRhGTM7byRVmxXflH3kbOs4Bh2z+/Em0tsHe/ZG6Yc?=
 =?iso-8859-1?Q?2/QzO8vxe1QFbRQpVy8ErV9/cC2EQn6p0DfyIa2n/KZQQxtasichnEj8zs?=
 =?iso-8859-1?Q?hYJOve1uM+uCHEqwWh1WwdRq5r0SX6XME8HBVkdxd5weNRys2pHOxQ4vlY?=
 =?iso-8859-1?Q?ZRhgRnM2xZQ2bDqjWRCNk65zPtXqJ8R6mtaDdGsSXyQG5EbcbG1/VoHkP+?=
 =?iso-8859-1?Q?wG06HqSvQ2o/PxopvQLcEduzGBRaHXAAVTbr6mNQ2+30l0OU+ZRoidcL53?=
 =?iso-8859-1?Q?7HpyZP6dlKLf1YVyqDefB8hNSyGSx9KM8lbQ0pLpstoTSDY7AyJ589DPgf?=
 =?iso-8859-1?Q?j7CEfLGYQZG4wirxkW8H0HKfm4cTy0EQu1lzbkrjfxc6TjriroE1v83JPd?=
 =?iso-8859-1?Q?R667/j+jJjbrWT60YahtheFdqsBP/iy8WtaKNXAaw55qKPKehk5ecszsI4?=
 =?iso-8859-1?Q?3Rn+g0twnPsSG2AyOWHTHWtI9i4SMtMySeMzqr68mauaEoxdsJW0JbNA8H?=
 =?iso-8859-1?Q?4moq6wjcNzlH68R5q+FC9XCoJrDrhT2IlGPbdP8M3S28+okMlswIMu9cOY?=
 =?iso-8859-1?Q?2n3FabQa2onnLWVI8WHOfkq4Pyx3YD5rxtpphVgpnNVq3XEOvpAVIMp2sJ?=
 =?iso-8859-1?Q?6WzB3ri3qDSaA+v4gymArWdZ6nX0JxdN4NmjMkYhWeg9EA6zhTLXvfiqki?=
 =?iso-8859-1?Q?tPldRSA91mxDqqr3iONL58msxWZMjL3f+8oMOhokKjZbryCO4Yl1mouQPc?=
 =?iso-8859-1?Q?6MVLwm24KulU+RR8jJVjaEtHi4TxFKQLVmelljf5S31/Njo0RqyzYeoHwN?=
 =?iso-8859-1?Q?pxWv8YxLEw1YtvyOvV7PL3ekkHuE4ueiXEEdOabOr2HR1f1m5vl5MYUdPI?=
 =?iso-8859-1?Q?y9LDlQy921paz6D8oT3NZz+v+PAT/BzWRQD1jAcsl09Am3pqqdeTIjGowK?=
 =?iso-8859-1?Q?eU5q7bKMoRysHrNblb58kmUCU+/A5BLlfqotK2lc8rYwVQk878ss8ZkXiw?=
 =?iso-8859-1?Q?fDt6N0y1+bI8EAp2oxwXnXE090uUlHlRze58olq5eAlPZ+8fNW2KgoFf2I?=
 =?iso-8859-1?Q?9vwDbR9Rp1/fSEQ4fCHNcFYnzj8jfU67QZPFOgW4Gyt9HXdg4IWvbju+No?=
 =?iso-8859-1?Q?M0ZOjtPQOZcS1g6b/f1xRW0EvskE3iB1stoWquqvrNuwA5JZ2zYXPXMVT9?=
 =?iso-8859-1?Q?k/alL7U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tkoxgtxZXrgiY6U+zmBVfNEsmF/r6jX84Catcavou0SLMAYjBZmay2hHIJ?=
 =?iso-8859-1?Q?iDWLcyfaAuHuGBl13Lj2TmPYdEuqx7TQZMNMjANmCD5yIEFphsUwIPgn67?=
 =?iso-8859-1?Q?n0oEovsDCLMLCalcJ28fhoRkmSkgtTDleBJ7153hVVrkpwzrfs6W6ZNjwj?=
 =?iso-8859-1?Q?3QF7c+GQGWAoV3Pg6G9oKogcrN9FhbMc0j/VwBsirs9R/2R8fpelC1jjuG?=
 =?iso-8859-1?Q?0/bOCL02KH250rb5TC4r9r2ttlAYcesJZ6mJursEDEDrFytcyywIOVa59v?=
 =?iso-8859-1?Q?XbvCBVX29dFosnV4HyrmAlL/GIVftJ1uuJ1k81Dne98HFAPksLBlL8djKi?=
 =?iso-8859-1?Q?7WwkqNx4/X+mwwMZDbxKsXMwad7cYR9kda/YN/Ub4kenY8G65/Nyo4t/tE?=
 =?iso-8859-1?Q?ug6JRpQSsRfhT9hNhU/SJkOJCUizTmyeumpd/WnKB4UX3KqLWXa3NZJwF1?=
 =?iso-8859-1?Q?KGVY9wP5wxijXBjLRvsA819Rnjvzh198b1tLcHPU+dtAwyRCABxl8fWdjU?=
 =?iso-8859-1?Q?chK1MjBxf9QRYObKZVwr01N4bqzJC/yXjnHSPL4NxrJnqku9RGGit/KflE?=
 =?iso-8859-1?Q?rh5U1LsNlvct3uNXPEXLMnaZ/PI9vJ4elUJ0wdt5fzzgJUwx9IJ+XLK10l?=
 =?iso-8859-1?Q?9t4WDJP7yuglQk2Bns6yT6GW9Ltb8u/bAsyxv8Jmal8a0aYWq83qyXj/B8?=
 =?iso-8859-1?Q?haKHYKKe1ZpW2R3+36p51n/4Y9NmIH9ngXXyaawHN4N858Z75dcSXd9ucU?=
 =?iso-8859-1?Q?FkRpR13lzuvG6eDFKgCGgpDI0l9DemVXbgBgq2zh+fxZvKpJ3VsPCtKFIS?=
 =?iso-8859-1?Q?XHIJ68CvUJrmCCsqbHd5DJk/8q6hFWoXLz8H6vttgXDziutV5bs5awapgZ?=
 =?iso-8859-1?Q?WZbW5VNX02Eztx0BPEXmknfCvQUprg+YRHS6uUF52YTLFKv2FuFYNiAY9D?=
 =?iso-8859-1?Q?ARMPThnMOAAx+ZDKNrOc2m081V0OCWmQ+/BPfMWNEwOdafLlXj0WLI/Yvh?=
 =?iso-8859-1?Q?J5Nc5x1qBAeYKmTWBAUavOJkVJNcSXOIqNXLbAy5k6zlsMMRhckPA7r3dW?=
 =?iso-8859-1?Q?RF4TbHAVRLUarGAUfw3aRcvfEzLxLgEc+y7Qg343Cqra6QWx9bHCDOxKsp?=
 =?iso-8859-1?Q?6zLEcEFeaDdwuKrzvQFcd6Z6tLYh99Ls9uQkm/Wr1yRGQuspEcp6yEzWFp?=
 =?iso-8859-1?Q?XC3rs1+gy9NbjB3bGx6+yrqpGwFxSMRpOUrStYagobYztZ0FZoubNVZO2G?=
 =?iso-8859-1?Q?f+/gXxUZS95p/4CSegyfYtz9pQ5OINMVQ96OIYYAT7H+JZZlN1k9DkLCuu?=
 =?iso-8859-1?Q?+6YtC/Hc5HRqzBrqU+KMl/svyNI+bcV8LoLpPVpTMpAYKp2TrSbUsxo2N4?=
 =?iso-8859-1?Q?l7YYHX5rfb44QgM5+5uKBj9nrqcE9O1lk8eYAQGr9Eqh9gt1h8WAgBUBZf?=
 =?iso-8859-1?Q?729WLOKhhDk06+SiHzO/9ldaQnppwExA6cWt4bhG+3rtmmHDFb+aryAbEJ?=
 =?iso-8859-1?Q?0xtU9HDgLg4wjN+fOgYV2yDE7RE3BRYBIrS/TIV8kyBi3hZtA6bu7Px1Fe?=
 =?iso-8859-1?Q?iD1SLAy5AsaEWCEqiuqIUOyPG644KnUjMVZDIL5KfM9EM4veFPpBqXCoEM?=
 =?iso-8859-1?Q?etkgU9N7Nfi5d5zgyVLQTwkU//KvpIXIox?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5823fe48-5325-4108-97a9-08dd8da6d9ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 20:36:31.6685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zPZWGT6av4m+9NXCOEvqKlBTC+P+teHFFjrIiNnI5jMR42HRvlvrKqts6OCJKAkEzl8xJi8X0hWBGDN0nveJS6qpTWbGet1vbX+XWGh2CQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7009
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Wednesday, May 7, 2025 1:16 PM
To: intel-xe@lists.freedesktop.org
Cc: Souza, Jose <jose.souza@intel.com>; Santa, Carlos <carlos.santa@intel.c=
om>; Venkatesh Reddy, Sushma <sushma.venkatesh.reddy@intel.com>
Subject: [PATCH v4 3/9] drm/xe: Add mem_region to properties line in VM sna=
pshot capture
>=20
> Add memory region to properties line in VM snapshot capture indicating
> where the memory is located. The memory region corresponds to regions in
> the uAPI. This is useful information for debug and will help build a
> robust GPU hang replay tool.
>=20
> The current format is:
>=20
> [<vma address>]: <permissions>|<type>|mem_region=3D0x%x
>=20
> Permissions has two options, either "read_only" or "read_write".
>=20
> Type has three options, either "userptr", "null_sparse", or "bo".
>=20
> Memory region is a bit mask of where the memory is located.
>=20
> Cc: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 95c51834c620..842e482b60b2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3731,6 +3731,7 @@ struct xe_vm_snapshot {
>  #define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
>  #define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
>  		unsigned long flags;
> +		int uapi_mem_region;
>  		struct xe_bo *bo;
>  		void *data;
>  		struct mm_struct *mm;
> @@ -3776,6 +3777,18 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(stru=
ct xe_vm *vm)
>  		if (bo) {
>  			snap->snap[i].bo =3D xe_bo_get(bo);
>  			snap->snap[i].bo_ofs =3D xe_vma_bo_offset(vma);
> +			switch (bo->ttm.resource->mem_type) {
> +			case XE_PL_SYSTEM:
> +			case XE_PL_TT:
> +				snap->snap[i].uapi_mem_region =3D 0;
> +				break;
> +			case XE_PL_VRAM0:
> +				snap->snap[i].uapi_mem_region =3D 1;
> +				break;
> +			case XE_PL_VRAM1:
> +				snap->snap[i].uapi_mem_region =3D 2;
> +				break;
> +			}
>  		} else if (xe_vma_is_userptr(vma)) {
>  			struct mm_struct *mm =3D
>  				to_userptr_vma(vma)->userptr.notifier.mm;
> @@ -3787,10 +3800,13 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(str=
uct xe_vm *vm)
> =20
>  			snap->snap[i].bo_ofs =3D xe_vma_userptr(vma);
>  			snap->snap[i].flags |=3D XE_VM_SNAP_FLAG_USERPTR;
> +			snap->snap[i].uapi_mem_region =3D 0;
>  		} else if (xe_vma_is_null(vma)) {
>  			snap->snap[i].flags |=3D XE_VM_SNAP_FLAG_IS_NULL;
> +			snap->snap[i].uapi_mem_region =3D -1;
>  		} else {
>  			snap->snap[i].data =3D ERR_PTR(-ENOENT);
> +			snap->snap[i].uapi_mem_region =3D -1;
>  		}
>  		i++;
>  	}
> @@ -3859,13 +3875,16 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *=
snap, struct drm_printer *p)
>  	for (i =3D 0; i < snap->num_snaps; i++) {
>  		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[=
i].len);
> =20
> -		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
> +		drm_printf(p, "[%llx].properties: %s|%s|mem_region=3D0x%lx\n",
> +			   snap->snap[i].ofs,
>  			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
>  			   "read_only" : "read_write",
>  			   snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL ?
>  			   "null_sparse" :
>  			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
> -			   "userptr" : "bo");
> +			   "userptr" : "bo",
> +			   snap->snap[i].uapi_mem_region =3D=3D -1 ? 0 :
> +			   BIT(snap->snap[i].uapi_mem_region));
> =20
>  		if (IS_ERR(snap->snap[i].data)) {
>  			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,
> --=20
> 2.34.1
>=20
>=20
