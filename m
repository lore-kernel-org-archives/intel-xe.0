Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B7FC71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 16:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C49010E3F5;
	Mon, 16 Jun 2025 16:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xtng9rPy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C35310E40B
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 16:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750089685; x=1781625685;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gW/5XOZ9t/Hg4qVeIYAkCvUkOjugqH8SfOmCutzmMeg=;
 b=Xtng9rPya7OcnClk4xTQSfrUkV/XXBvqDe20ml9Z5AJi+FZaawJu0ssf
 r40TCLN/aRPpYn7SkW7+mtnqWUSKHA3MagQooMI3EcGhqrIKHaACoRfWN
 NPSVYIFsYwirIOtnXrEZ968ZpSxZMqUDb3mBzuPK2oPvLJFHhH7CuDoJD
 BZfI9nHIAXmzBRnPIlI6Fk/NdqrUXcVn47aSjc5EKo5NUw/sdcRwwKuou
 g66VSL9k91CBwRPQ5tvDWnlFC4FuPPAtGYyU6xYwHWTJjkmErYC6wjlY7
 8+6xCQK6O2x6Qy1xqM15EdFu15zS9lzDZ1GvfORwF9ad2hdS14fZKm2u/ g==;
X-CSE-ConnectionGUID: 7QIwl1CrTxWKfZzDoPW9zw==
X-CSE-MsgGUID: oBq+kj99QYKkVM8+0zDlag==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="56039364"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="56039364"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:01:25 -0700
X-CSE-ConnectionGUID: MfiB37AqT+2basJC6I/eNQ==
X-CSE-MsgGUID: Zr9IdqhtS/KTlbCJB2he/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="171738409"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:01:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:01:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 09:01:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.49)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:01:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrwsCen40mDpbg5jfBjR4qVo8mW8xa0H1ST69/Kh4Y/kzMPHRI395fj1XwHYp6/gkbMoaFA0FiqQEBlERNu+JjSMcW0XIMWlJJ7rMuPy0fCn3btGx53XoWwTwr5ZGgYxAltJ3eDBLhiG85cKaCjjnvVL6T4t8uJdq0kVfpJE1ZyhwWnp/gP7fqGxSbhpuD3i4mpwynZkEPIbd42tbpv7npT07B/RltV7WsAhp4m4IrZjk4FhHZ+eQE0/GJmRlkVUJsDa06MVKj8b+ZKoKo9KlW0LdKtohdBFBtqxH/+RaczostjxhCkX02EPnYOh5NjZmMCjx872xazVf+34OpZ96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWVqVYBJTcD4dkZevNKgbEJ9kXVnprVQuKkmD7VxiOc=;
 b=DL6AQvhOas7uB8PFykH8wA6ph3xV1RyflCRcX2i3D8F+2/vY1G1s7cC7GCw67ro6o17Bx8Uwg25SoRfl1vbsgXYuH1yCJjMOQDAM2wbFA611AIuHyPXLoL2lpj2SFIngM8KWLuO/hVJ0oOIdaXEuwNet/pDzxfnWPzq+rXQuEygBE8XBkFH0Qx+fg4/7BHRMn4QbQ3bgcHutS/V4t++GejuuD03GeUPmTKlojOC+1Fl4Xiyyn30oBx1h6UO1wzUNfllR3SUjHUnJLrQls/ekkayNHWKimcuXNIBwtp5SUShGp0GhYX/9XmwmQdKXWG+beKAwK1ss2OT7cNra20wqyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by DM4PR11MB7255.namprd11.prod.outlook.com (2603:10b6:8:10d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 16:01:21 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 16:01:21 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 8/9] drm/i915/wcl: C10 phy connected to port A and B
Thread-Topic: [PATCH v6 8/9] drm/i915/wcl: C10 phy connected to port A and B
Thread-Index: AQHb3JnZIehpGkx7CUGPoBeQxEygCbQFevWAgABqXMA=
Date: Mon, 16 Jun 2025 16:01:21 +0000
Message-ID: <IA1PR11MB6266B72FDB377689AA1E741AE270A@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
 <20250613193146.3549862-9-dnyaneshwar.bhadane@intel.com>
 <DM3PPF208195D8DF1F76C172386940583D7E370A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DF1F76C172386940583D7E370A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|DM4PR11MB7255:EE_
x-ms-office365-filtering-correlation-id: 91e37f2b-455d-42e3-57ed-08ddacef096a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?amp6OFzbFu1wP41wcSPwrTocrQQONFr5657KSLwfEsyN+FjKMxI0bqrcbRSA?=
 =?us-ascii?Q?KWgZBL0TvBYWo5TFBYVrXYn1uaBpojdenV0GN0qDCyQ1T2U69aAWQU723LNp?=
 =?us-ascii?Q?hG7b/zZr6TcRhOgi62dFNa1gJZqgjmth4lRBRsCi/A585oHZdtinkyygQ1wX?=
 =?us-ascii?Q?yQ4dekz4pNKZYYvUkgyQCl1Ely7oJblAAjRM9GQMf4g95kGxCFMFeg/yhY+L?=
 =?us-ascii?Q?NRue0V/kFvNjHiOyXXN+cQuo0vVxTvibUz1sPI/JfiHwpZkw5uzd/1CUEBPh?=
 =?us-ascii?Q?cSvGvSOrNaqpiGAwXrmicmKEhkrOjP+55LlKy02G9mvwliN4Ln0y1/etyLu1?=
 =?us-ascii?Q?3ACuV4MctsX61Di08RdX2fNCkPcfY42+t0Cs85hzdZuqVfjxNE5W/VUnAxSq?=
 =?us-ascii?Q?X8fBLCPIPseDX/buhAIuMdUyd8jy6Y7Az8uimcrh1wspFNASAb1MKHgR/B0K?=
 =?us-ascii?Q?82MpwjpX8WkwiBqUZH+EJoL+U8AovWBX+01rLVu8h0kl4vkHbXzQoWsZQ++I?=
 =?us-ascii?Q?/J1uZOwP9WLol1Ajq8kSQflcVO3T0AtAf3wMPZA6i3D3kG0xl7iOJyBlOENR?=
 =?us-ascii?Q?Lf1XOxiQ2cYpPuT3zzwQQ6pIqIuhxuG2ElBi6JlBiO1pawj4zNVuVq7M/jAE?=
 =?us-ascii?Q?T3z+VAHI9sOu69+TfWYZLsGiVEFzFXd3H4bRFaq3NKK9thTawoXJb3HKlYLW?=
 =?us-ascii?Q?HkGvCeJgfqanWMAi7A5AZGAU5FL8DaPvdArbsc986buEUmi+HV6XbTQzruys?=
 =?us-ascii?Q?zgu5NgETRTYNcCdYRdnqlJh3HgRyfYlJ2D9gWZAAIVtf7hZmh0e8F/owlQbo?=
 =?us-ascii?Q?JHn8TtS/Jm3i09Cl3NVInDAuwtUSzuYUvF7yH8xlHOhaFBN6sqiZGu4QlDes?=
 =?us-ascii?Q?tcEaAxLpi6NhqzCfTwSXnWpxlSBZ9tBpCQLfvyStoAH6Z6dyabfXPTTKEUcZ?=
 =?us-ascii?Q?R/pMYMe31iS3mKmI2kl42A6gfJAqGTtmRyf0N0DkIEyeY8cR4SqUua/DP7a9?=
 =?us-ascii?Q?voO7CqNDP7VJPQmdYI6HENcF2NjzoqJOlt4eFjd9+Id5XmwMj2h5CJiM3BF7?=
 =?us-ascii?Q?7JF+QQUqV0VWPvr/cG5PMAUXGgjObc9JQLyV0S1uSsY1ie6NO5+xdn+F+7jn?=
 =?us-ascii?Q?1otnOV7TYMHw8+lIUimOm8v3PPBEkYe+FntnkHEdcQqCsmBGKLIQqJqvCcPe?=
 =?us-ascii?Q?e5tp09PibHKc/RaTr44m1odNmWfjCvCZyCo2MxcZJsEdWW8ZNU0LNR5I3zK6?=
 =?us-ascii?Q?wJGUc8vz0q9VvIQKmAiLF8V6vaYOtEIOMYv5fXEKY+f+0jrNP7o4PCPxK/Lf?=
 =?us-ascii?Q?01IAP32Cr7sWGFxy+s4+di7O4jr3NNHw5tjBjcQpuM9gWF0iaLNbiD0O3UuZ?=
 =?us-ascii?Q?8ke+8N7wat+PAzIcmNmMemqtowflX7XAFpUAlLa+PlFE6A3XqHqQaXFYWlbq?=
 =?us-ascii?Q?LR12d9mwQZL17Tzw7r6EkiO1PH88TKvozGR7iNCOaZrtUKfo2i/nwQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0VkQ1qYHs0ciactGfQwxMYoJXLieyuNpSbg/DL+R6TeZonw05RKqIh6a+FP9?=
 =?us-ascii?Q?XsZQ9utjD7LUb1n7Qae8hZ3D6AChT1lfE4/uTeHbIZdCy153Nbd8iouBjF3s?=
 =?us-ascii?Q?UTy5u7u3cnlnZVRoWwlig44r/K6M1oQ4v1Xxsc3xMGe9zaiKu2GFJvPI/VCq?=
 =?us-ascii?Q?xxm/PCnL4j5tyDqqSMDQsVj7Kb0faBEdivBmdcFfAathr7p/7yL/OeVQDpr0?=
 =?us-ascii?Q?and1PcadaqJoiHdV9S3dFx6gdkZ6urMhtM6bGPZOHoozuhvyivYCIyhS7TKS?=
 =?us-ascii?Q?zwchfl3ehcI4mxmiiW9Ky1B8+S8surhPYyxE5uSk65DVLW93Q4lodnFmWpVY?=
 =?us-ascii?Q?c/cBLFxjR7qkVvHQQOQqdy+RXiIhJ+5F9WKHOVDbGmmCIYZTmVF2MDXjOED5?=
 =?us-ascii?Q?0JblzywussRpi3/1gx/+/IEQEWZVC8svVF36G1MFGbZpudsdrFxKWsZNbpvS?=
 =?us-ascii?Q?tfZez7fpokIKSkcfekPUf0a2dY93O8FnLvOum0YOpyQi8Hdo1carc7Y/fdrA?=
 =?us-ascii?Q?5ruBwJTD3HZlZnk48p+ETJfh5O2V4KEnJoUIujy9tgSUFbAu4a3LopdMt/Wr?=
 =?us-ascii?Q?EOdjvcRxjZJ+nZdtK0eIJLaxpgtOxvjM+9IxGoEIbPunq+Ih/q+ivZUo4fdm?=
 =?us-ascii?Q?Zzh3WX0cFkllkmKC2EjNbQ/sKQjG6OdPv3w/I0bjI/MtWUyuTa4YU7CMLuLE?=
 =?us-ascii?Q?5aDjV8DMU0bci0olG5oHJYqItEMs4yWw67vwOGI/J7FXU5vC2fMdfOZrDq9W?=
 =?us-ascii?Q?xx5hF4UeMIJfp5A09mR3nEY2PjoAbUH4q84XkkXNMZZXjKdOAk6SQ4IN+aii?=
 =?us-ascii?Q?8Blf0J1hlvy3NOnk0+1tIFJi8xRZuLZ7bW7eAVQfTFjOJwuDZ83rYuTVMJH/?=
 =?us-ascii?Q?iKukw5/ELvl+1DnPk63EA8HhTDfkivYiF7nrkCNggYUYMyw28xEGvevquFdy?=
 =?us-ascii?Q?j6hbUIazOWyjCW5uhp6eYTZ8HPoQ1i7SignclQQQ/ZIEL9zVivNkujrsuZ6m?=
 =?us-ascii?Q?Tw4YP39QXnkKcnFBk5wt93r0e36H5gddi5rchAOly619TXemi9O0XAJ/l4E7?=
 =?us-ascii?Q?SBtX4oMpbDWl5ByO1slXSlOaXLSH4TXByKYIktZQGT021pbx8sLEXFwyav/V?=
 =?us-ascii?Q?nWudcN+mkdcEBWU9R1mqvfvDM1ifJ/sphcpqI0I5RZ02fxR3SqOxKWtMnHvj?=
 =?us-ascii?Q?9tNhPgTvinjjYA7XaZlU032wAmqfuNbrQyCtFFLjT54euIbljWxA8+vn/tHD?=
 =?us-ascii?Q?8EYIHh3n7q0lD9hvWUgKJe7y7D6DsX49v+gZdLP0rZ0lHEnP6d0GP0kz3N2S?=
 =?us-ascii?Q?6lBE1U87x2KP/pILBN+eiiHfptbdiv5qFT/Qyc2ewC4rHxqVsQFG5NGwemxw?=
 =?us-ascii?Q?P/C5Den45DF5jCS488W2byVGMyy4ZH5ux6DlrVKBatghMGwCKLaxFl6jVC9v?=
 =?us-ascii?Q?nnvpGY6ZOLrl7ItuBshJXEtJrsVVY1+ETbpsWuT0HVNuvPhFL2jKLdfA8HwB?=
 =?us-ascii?Q?KixOD5j0pBg1s8MPORWVhZNoyz7391q1vyw6LPIZf+H4tgOxkr4bml9Rhvhc?=
 =?us-ascii?Q?FNApPYDT+1Fp+39e2sAv0oro5YyyjbgwHrl8xxWLUAk5fCgBN8zDZcWYz5qs?=
 =?us-ascii?Q?Uw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e37f2b-455d-42e3-57ed-08ddacef096a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 16:01:21.1418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2qt1D9OGWuvKfPNiqBGl625uWr9FBXcM3InWneZuARgJTn+WC3XQ9AumzXEd43k+mHW5Glba27gAIFedw0vutA+Gg6H3dXlRjzS1iSY0Mgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7255
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



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, June 16, 2025 2:09 PM
> To: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> Subject: RE: [PATCH v6 8/9] drm/i915/wcl: C10 phy connected to port A and=
 B
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Dnyaneshwar Bhadane
> > Sent: Saturday, June 14, 2025 1:02 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> > Subject: [PATCH v6 8/9] drm/i915/wcl: C10 phy connected to port A and
> > B
> >
> > WCL added a c10 phy connected to port B. PTL code is currently
> > restricting c10 to phy_a only.
> >
> > PTL doesn't have a PHY connected to PORT B; as such,there will never
> > be a case where PTL uses PHY B.
> > WCL uses PORT A and B with the C10 PHY.Reusing the condition for WCL
> > and extending it for PORT B should not cause any issues for PTL.
> >
> > -v2: Reuse and extend PTL condition for WCL (Matt)
>=20
> Add the bspec reference here
>=20
> >
> > Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_cx0_phy.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > index 83c8df9dbc0c..ed8e640b96b0 100644
> > --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > @@ -39,7 +39,13 @@ bool intel_encoder_is_c10phy(struct intel_encoder
> > *encoder)
> >  	struct intel_display *display =3D to_intel_display(encoder);
> >  	enum phy phy =3D intel_encoder_to_phy(encoder);
> >
> > -	if (display->platform.pantherlake && phy =3D=3D PHY_A)
> > +	/* PTL doesn't have a PHY connected to PORT B; as such,
> > +	 * there will never be a case where PTL uses PHY B.
> > +	 * WCL uses PORT A and B with the C10 PHY.
> > +	 * Reusing the condition for WCL and extending it for PORT B
> > +	 * should not cause any issues for PTL.
> > +	 */
> > +	if (display->platform.pantherlake && phy < PHY_C)
>=20
> Just because PTL does not have PHY connected to  Port B does not mean the=
 code
> wont come here it seemed like this is the check That made sure we go to c=
10 PHY
> and with this it will go for c10 phy when port becomes port B

This would be case ever. No,=20
PTL don't have PHY connected with Port B so this would never be a case ever=
.
Specs: 72571

As you could see similar condition is also extended for lunar lake which ha=
s the don't have PHY connected with port B,=20

Dnyaneshwar,=20


>=20
> Regards,
> Suraj Kandpal
> >  		return true;
> >
> >  	if ((display->platform.lunarlake || display->platform.meteorlake) &&
> > phy < PHY_C)
> > --
> > 2.34.1

