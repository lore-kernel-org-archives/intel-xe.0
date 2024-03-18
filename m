Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2C5C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 14:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C3E10F826;
	Mon, 18 Mar 2024 14:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AEmtyeCs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490E710F826
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710773528; x=1742309528;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1cCL3VnLF40gz4jAsoIwcH88umpySMIavYUsElOyjgs=;
 b=AEmtyeCs/qqcViXcK8iC8y0I7XOTiOHC4fq8S3viNMbHzXZY1XQ8I4vu
 9Q4GwccxQAkz7KLMReDaJ44YnbdM9o7aC6FfBGju0c1uVV5jbQi6xN4fu
 bUEAWkY9j0SQYnYE6NYYRpTaifQscKup3dJ8TH6N5wRWw5uszGqfBFgDd
 H6qAYiC6DhXvq/05igoVZdShlEPY7bJzp9sZzNvLxATPM81MJc1JE0Av1
 iSSU9u2sOvN0sww9TUCmN3/YKBYNazdxaHnUQHx5M2gjHqN9t11YLGG8A
 2IbQvW2F5w/46Ro6DH0S/QDYDuNcfrxF55HQC1WZ47H9xr+Ym4NlVoZNj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5453951"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5453951"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:52:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="44422187"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 07:52:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 07:52:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 07:52:06 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 07:51:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMtInZ3gpc45/bU3Ae2Bxh0FGFcpgH2q5jnF9ahZeS8SE2t0AJV8o84aF7R2rSrh8YIlUuJo1/libZANhZK03m4ZfIIrAS52hSBwwxUJPP/3kse0rLXTQI0AGqoXjw6xH0blEa89Uqf5UNhQ1jyic2ULh4avRXFdEksoXa6T6uP7ChMaxZ3fd/ALZC2P0XPp5KSZ6M5n1GTJm2teKW8VWHFIthDTAs6eau7yHmtCtORNgeBwxWWbfsxmKPlSYcW9TnMw25rbnG2YVYHy43J/non3hIuWqZCJbq/ixu6emXuvhZE4XoKt+82+b3ggs9Ul3Thk/GBpefXa8slGmAjEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRXS7/32s1YPvq0Qh1oS0t/9gpzcQHkjNA2KnBPTpxA=;
 b=jQCeMQZD2AGiUvAW/ikatWUHfb2s2zN6AgT4PQzcTpQmgFlGQyCYP51HSnnKRsGiExMsx8+DgcHRn072jAg6iIjCZqXtc9SpFtl6psDR1beXZ5d1wlYwPFo5nFx+hm9kCsqKLS4dn6DvwVHeszCOYfd4XAvWmpj18Avoi2HY44/sklKYaTmPdOyrebeC2TEbpHsESVjQcUh71kKKXghEr1Zqkn8r54vul+xyhmTLhhqmtB33+aLnJSnR8iA0OVJieF2KKQv/X7ndCKpxP+RQjfW/JJude91mvkKYup7/y1SHKdY5yS+In9pIvVHW4YccWTf/LSuo5YjGhkFwdNJDCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CH3PR11MB8364.namprd11.prod.outlook.com (2603:10b6:610:174::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.9; Mon, 18 Mar
 2024 14:51:43 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 18 Mar 2024
 14:51:43 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "Welty, Brian" <brian.welty@intel.com>, "Ghimiray, Himal
 Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for GPU
 vram
Thread-Topic: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for GPU
 vram
Thread-Index: AQHadb8YemanJm4MK0iW0Qj9YyIrJ7E3e6GAgAAKcICAADCNgIAAbvWggAEgvACAAATdAIAASxAAgAQFhJA=
Date: Mon, 18 Mar 2024 14:51:43 +0000
Message-ID: <SA1PR11MB6991912F7FB40B8CECA75D18922D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-2-oak.zeng@intel.com>
 <ZfMxR/YHY/LP88KZ@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991042C806081949493087592292@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfNiw+M8ClCaR9Xn@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991E3115AC96F4A6FF257A792282@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfSyDEioCxXpJrTc@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991A38E8BD181BFA0C1701892282@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfT1GGV0mJMi2C4A@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZfT1GGV0mJMi2C4A@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CH3PR11MB8364:EE_
x-ms-office365-filtering-correlation-id: 76badcb6-b456-4870-32b3-08dc475aed41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZeBz+zznd/Wbrk0/JftlfIXAK+818Gqe/sx+jA4iGFBPhHAePFiLt59hW4f+Or4wefdQ8G9q2XYW4RAn6oKFR2ZiMU0OSADaAIzaZpuNyxYTyObXH7T/bBKA/AcfJH+fQGZJHAbeLbYn1OyITwMBUNIuUtdA5z1lK19Deq5ISwhwRmDIBuzjHe2I0f2J7PzCQaCcbzRV4qd5L5nj3v6riaABDWJ8bejenNdC3klK++wM8+V+aplwslY5Cx14KwgDtjbuYjOLNtceJyTOh5ag1qoHv6e2gbOediXv8vU8ny8jLFPpeBz40uHXNwiWqgbVym54adpy1Z0LuSw+NC5pSNLY3LNlZd2BGnfMWz/ejJSqYK9R8aJu1v3g4vBLa2k21hI24dcYvVL+fwvgPa2qe5UoD5LAeYnAtnKyaaLSpfvvRyj5Zrggt72jaenVZ1IKKheVTUfVcc79k7U2fxyycPuDs0tNZel6VncCs27cYtmMrUbI2i8R9hU35u0hw60/BPmO3NgSJk9k/ihETqnriKdmvOM5hO+t/A6oca2kxnyFMCNL7KZ6Mp7VEvE7bpA3Kp85JNO2DxltCQaa8n8gTuewJqLvPJ3RVzATcHr8ZN5hMaf4TqQoJbeN/bKLXNBERsbMRLuWA8i9wfQgJFrCkdwCLdK1Zr1tnKaGgoDOmj4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?mTIddJ9vjoDRJkB1ATPYlXFWwm8Xk5xgVmE+2zY2Nnxj0jdZ24vrijPfpk?=
 =?iso-8859-1?Q?MyXipC/6re7OouMk2epnOUppQO7tM8uOc+1fkvfEPuPa8t1XWbz8pCSuYI?=
 =?iso-8859-1?Q?hffOReZaSj8pBmwRJIX6Fk6tTRYExnk1lXPV5BwvCEipn96437EOgbJsjg?=
 =?iso-8859-1?Q?0v5jAPZFI4H2Uf6dgFkCLeDEf0rPkJ+wD54pBhxRkTX4Ga/AbNhbpKE2rC?=
 =?iso-8859-1?Q?70A/S4xZdo5pSKpi/IpguybvejUcGQEm6YL+6eQUUI/EhE8jbTDN47+q0j?=
 =?iso-8859-1?Q?ykqSC8FNUFspesmYHEumt+Fq4yqMAl5scJ8bxfIuAeY7n2KFEZ5s1bFwek?=
 =?iso-8859-1?Q?i1vRZaJA+eT1fTQWgaKPCsQWsx0ymAGbgRvm8gqKcZFtH6mV+oHcr+fMjn?=
 =?iso-8859-1?Q?qS0sKJnB7Par+PYKBiVRx4T6DUKP90SDV4PXeLDZpBbgqPbpEaZcQR66Vn?=
 =?iso-8859-1?Q?qtLL38LcOX41my1ATFFc7XAPjAHj+IuaIxo3cEzFx42d4HZIn7aA9oGBiI?=
 =?iso-8859-1?Q?R1qY3pW9C/ylaauWgX7Gfb3Lo1nZEWxukkSBjvdF0Bd3LqWJMh9Uip7vZI?=
 =?iso-8859-1?Q?RxK3Z9b7nwE3eNe5JR+xNyTMwjegsyuhKRbywuYi3scOkxv46pKRtEs/z2?=
 =?iso-8859-1?Q?r6CMKDUpVWv87WKXvEBReAWGVpialgEN+pSmideg/HcvGIAhEeCaAQv19Y?=
 =?iso-8859-1?Q?F+vLfJlT6m+FtfP21cq3v1Su/cb/WOA+vpIFFR6mA8TzP+00zzi3xLxNHM?=
 =?iso-8859-1?Q?btE6Sx7XFVWbzzOn3evylaHnKG8JMZ06ZAfb3oZ1a0qkdh0EpMpymn1FW/?=
 =?iso-8859-1?Q?jhenZ9CMcVHZv7vDmlokcaktDmT7/hYwye9d78kcQc+oQMtzDmAoTXk8mN?=
 =?iso-8859-1?Q?GJKUbuIWVZhC91rGngKtiru7wKgR7hxyetPTxU32kw6FwyjXO/tiD5dK2s?=
 =?iso-8859-1?Q?wdgjCPhJxv5SRRmC5Hl5SApAHQJGSf2ej0c/AXGioMZTv9FV+wQMa1eEAV?=
 =?iso-8859-1?Q?Yr1xkfzLrNpprdg1NDRYvRV/QjVC2vZ36KTed6/HVyGsn/Fk8FVkcnUlvq?=
 =?iso-8859-1?Q?OlXgo6rJdzthuVZHnmRuxG8sAG+LIhOjsUM6YeCN5Y3Kdf+Lr6V3GhuwfZ?=
 =?iso-8859-1?Q?ghaDRNosntq//VYS2peTVIR8AdkbHBqVy4MIIy+jG3mxwvCNlLXUZh06i2?=
 =?iso-8859-1?Q?ah24OA8ue57xWvDtP7Qw7EaOoiEgGzBWyFs80/+nxnZwmHyg+C6eFz3VBH?=
 =?iso-8859-1?Q?kOaC0nx3nfZbLoM6IWEpfGVeLaneHk0/gEkgOGGYc3n2ye/Xun6bAvzq52?=
 =?iso-8859-1?Q?eakh7zYO4SB6btR+sAhIsgGy8NunNFe+qjV+Eb3yS3giVzTkSZcCACvn3q?=
 =?iso-8859-1?Q?ipNzvNxCiQzMcG25zynm+qr/bYuWeGIsE2scIAHxUJJ+YvneapNRvd9hAA?=
 =?iso-8859-1?Q?4sde277oGDeJPqmQLZ/hnza4r+qH0JzMq1EUTo3Gentgl9qWHQZkiJtG+/?=
 =?iso-8859-1?Q?CFvzl2//N3wCIWtYSMSd1ksp96h6TJ9nIyfZHgD+RKcijrkVlB1W6ZiltR?=
 =?iso-8859-1?Q?SyZx9SwzX7Cz4MeL8uC7wIgHbl42mBHcxbT+3P94BPLeKaar1YzmA4V6g+?=
 =?iso-8859-1?Q?TEZ6eYD2A8YQQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76badcb6-b456-4870-32b3-08dc475aed41
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 14:51:43.2368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WrnseaA3F3KxIrCI72esbIcsZbHthfwrrR8HDpEunPU/3WosYhiGY4pGG4NNoUCLbDz+v0podANmYEaAVdas8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8364
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, March 15, 2024 9:26 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for
> GPU vram
>=20
> On Fri, Mar 15, 2024 at 03:31:24PM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Friday, March 15, 2024 4:40 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > > <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> > > <brian.welty@intel.com>; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>
> > > Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing
> for
> > > GPU vram
> > >
> > > On Fri, Mar 15, 2024 at 10:00:06AM -0600, Zeng, Oak wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > > Sent: Thursday, March 14, 2024 4:49 PM
> > > > > To: Zeng, Oak <oak.zeng@intel.com>
> > > > > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > > > > <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> > > > > <brian.welty@intel.com>; Ghimiray, Himal Prasad
> > > > > <himal.prasad.ghimiray@intel.com>
> > > > > Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap
> backing
> > > for
> > > > > GPU vram
> > > > >
> > > > > On Thu, Mar 14, 2024 at 12:32:36PM -0600, Zeng, Oak wrote:
> > > > > > Hi Matt,
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > > > > Sent: Thursday, March 14, 2024 1:18 PM
> > > > > > > To: Zeng, Oak <oak.zeng@intel.com>
> > > > > > > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > > > > > > <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> > > > > > > <brian.welty@intel.com>; Ghimiray, Himal Prasad
> > > > > > > <himal.prasad.ghimiray@intel.com>
> > > > > > > Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap
> > > backing
> > > > > for
> > > > > > > GPU vram
> > > > > > >
> > > > > > > On Wed, Mar 13, 2024 at 11:35:49PM -0400, Oak Zeng wrote:
> > > > > > > > Memory remap GPU vram using devm_memremap_pages, so each
> > > GPU
> > > > > vram
> > > > > > > > page is backed by a struct page.
> > > > > > > >
> > > > > > > > Those struct pages are created to allow hmm migrate buffer =
b/t
> > > > > > > > GPU vram and CPU system memory using existing Linux migrati=
on
> > > > > > > > mechanism (i.e., migrating b/t CPU system memory and hard d=
isk).
> > > > > > > >
> > > > > > > > This is prepare work to enable svm (shared virtual memory) =
through
> > > > > > > > Linux kernel hmm framework. The memory remap's page map typ=
e
> is
> > > set
> > > > > > > > to MEMORY_DEVICE_PRIVATE for now. This means even though
> each
> > > GPU
> > > > > > > > vram page get a struct page and can be mapped in CPU page t=
able,
> > > > > > > > but such pages are treated as GPU's private resource, so CP=
U can't
> > > > > > > > access them. If CPU access such page, a page fault is trigg=
ered
> > > > > > > > and page will be migrate to system memory.
> > > > > > > >
> > > > > > >
> > > > > > > Is this really true? We can map VRAM BOs to the CPU without h=
aving
> > > > > > > migarte back and forth. Admittedly I don't know the inner wor=
kings of
> > > > > > > how this works but in IGTs we do this all the time.
> > > > > > >
> > > > > > >   54         batch_bo =3D xe_bo_create(fd, vm, batch_size,
> > > > > > >   55                                 vram_if_possible(fd, 0),
> > > > > > >   56
> > > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > > > > >   57         batch_map =3D xe_bo_map(fd, batch_bo, batch_size=
);
> > > > > > >
> > > > > > > The BO is created in VRAM and then mapped to the CPU.
> > > > > > >
> > > > > > > I don't think there is an expectation of coherence rather cac=
hing mode
> > > > > > > and exclusive access of the memory based on synchronization.
> > > > > > >
> > > > > > > e.g.
> > > > > > > User write BB/data via CPU to GPU memory
> > > > > > > User calls exec
> > > > > > > GPU read / write memory
> > > > > > > User wait on sync indicating exec done
> > > > > > > User reads result
> > > > > > >
> > > > > > > All of this works without migration. Are we not planing suppo=
rting flow
> > > > > > > with SVM?
> > > > > > >
> > > > > > > Afaik this migration dance really only needs to be done if th=
e CPU and
> > > > > > > GPU are using atomics on a shared memory region and the GPU
> device
> > > > > > > doesn't support a coherent memory protocol (e.g. PVC).
> > > > > >
> > > > > > All you said is true. On many of our HW, CPU can actually acces=
s device
> > > memory,
> > > > > cache coherently or not.
> > > > > >
> > > > > > The problem is, this is not true for all GPU vendors. For examp=
le, on
> some
> > > HW
> > > > > from some vendor, CPU can only access partially of device memory.=
 The
> so
> > > called
> > > > > small bar concept.
> > > > > >
> > > > > > So when HMM is defined, such factors were considered, and
> > > > > MEMORY_DEVICE_PRIVATE is defined. With this definition, CPU can't
> access
> > > > > device memory.
> > > > > >
> > > > > > So you can think it is a limitation of HMM.
> > > > > >
> > > > >
> > > > > Is it though? I see other type MEMORY_DEVICE_FS_DAX,
> > > > > MEMORY_DEVICE_GENERIC, and MEMORY_DEVICE_PCI_P2PDMA. From
> my
> > > > > limited
> > > > > understanding it looks to me like one of those modes would suppor=
t my
> > > > > example.
> > > >
> > > >
> > > > No, above are for other purposes. HMM only support DEVICE_PRIVATE a=
nd
> > > DEVICE_COHERENT.
> > > >
> > > > >
> > > > > > Note this is only part 1 of our system allocator work. We do pl=
an to
> support
> > > > > DEVICE_COHERENT for our newer device, see below. With this option=
, we
> > > don't
> > > > > have unnecessary migration back and forth.
> > > > > >
> > > > > > You can think this is just work out all the code path. 90% of t=
he driver
> code
> > > for
> > > > > DEVICE_PRIVATE and DEVICE_COHERENT will be same. Our real use of
> system
> > > > > allocator will be DEVICE_COHERENT mode. While DEVICE_PRIVATE mode
> > > allow us
> > > > > to exercise the code on old HW.
> > > > > >
> > > > > > Make sense?
> > > > > >
> > > > >
> > > > > I guess if we want the system allocator to always coherent, then =
yes you
> > > > > need this dynamic migration with faulting on either side.
> > > > >
> > > > > I was thinking the system allocator would be behave like my examp=
le
> > > > > above with madvise dictating the coherence rules.
> > > > >
> > > > > Maybe I missed this in system allocator design but my feeling is =
we
> > > > > shouldn't arbitrarily enforce coherence as that could lead to poo=
r
> > > > > performance due to constant migration.
> > > >
> > > > System allocator itself doesn't enforce coherence. Coherence is bui=
lt in user
> > > programming model. So system allocator allow both GPU and CPU access
> system
> > > allocated pointers, but it doesn't necessarily guarantee the data acc=
essed
> from
> > > CPU/GPU is coherent. It is user program's responsibility to maintain =
data
> > > coherence.
> > > >
> > > > Data migration in driver is optional, depending on platform capabil=
ity, user
> > > preference, correctness and performance consideration. Driver interna=
l data
> > > migration of course shouldn't break data coherence.
> > > >
> > > > Of course different vendor can have different data coherence scheme=
. For
> > > example, it is completely designer's flexibility to build model that =
is HW
> automatic
> > > data coherence or software explicit data coherence. On our platform, =
we
> allow
> > > user program to select different coherence mode by setting pat_index =
for
> gpu
> > > and cpu_caching mode for CPU. So we have completely give the flexibil=
ity to
> user
> > > program. Nothing of this contract is changed in system allocator desi=
gn.
> > > >
> > > > Going back to the question of what memory type we should use to reg=
ister
> our
> > > vram to core mm. HMM currently support two types: PRIVATE and COHEREN=
T.
> > > The coherent type requires some HW and BIOS support which we don't ha=
ve
> > > right now. So the only available is PRIVATE. We have not other option=
 right
> now.
> > > As said, we plan to support coherent type where we can avoid unnecess=
ary
> data
> > > migration. But that is stage 2.
> > > >
> > >
> > > Thanks for the explaination. After reading your replies, the HMM doc,
> > > and looking at code this all makes sense.
> > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > For GPU device which supports coherent memory protocol b/t =
CPU
> and
> > > > > > > > GPU (such as CXL and CAPI protocol), we can remap device me=
mory
> as
> > > > > > > > MEMORY_DEVICE_COHERENT. This is TBD.
> > > > > > > >
> > > > > > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > > > > > Co-developed-by: Niranjana Vishwanathapura
> > > > > > > <niranjana.vishwanathapura@intel.com>
> > > > > > > > Signed-off-by: Niranjana Vishwanathapura
> > > > > > > <niranjana.vishwanathapura@intel.com>
> > > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > > > > > > > Cc: Brian Welty <brian.welty@intel.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/xe/Makefile          |  3 +-
> > > > > > > >  drivers/gpu/drm/xe/xe_device_types.h |  9 +++
> > > > > > > >  drivers/gpu/drm/xe/xe_mmio.c         |  8 +++
> > > > > > > >  drivers/gpu/drm/xe/xe_svm.h          | 14 +++++
> > > > > > > >  drivers/gpu/drm/xe/xe_svm_devmem.c   | 91
> > > > > > > ++++++++++++++++++++++++++++
> > > > > > > >  5 files changed, 124 insertions(+), 1 deletion(-)
> > > > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_svm.h
> > > > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > b/drivers/gpu/drm/xe/Makefile
> > > > > > > > index c531210695db..840467080e59 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > > > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > > > > > @@ -142,7 +142,8 @@ xe-y +=3D xe_bb.o \
> > > > > > > >  	xe_vram_freq.o \
> > > > > > > >  	xe_wait_user_fence.o \
> > > > > > > >  	xe_wa.o \
> > > > > > > > -	xe_wopcm.o
> > > > > > > > +	xe_wopcm.o \
> > > > > > > > +	xe_svm_devmem.o
> > > > > > >
> > > > > > > These should be in alphabetical order.
> > > > > >
> > > > > > Will fix
> > > > > > >
> > > > > > > >
> > > > > > > >  # graphics hardware monitoring (HWMON) support
> > > > > > > >  xe-$(CONFIG_HWMON) +=3D xe_hwmon.o
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > > > index 9785eef2e5a4..f27c3bee8ce7 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > > > @@ -99,6 +99,15 @@ struct xe_mem_region {
> > > > > > > >  	resource_size_t actual_physical_size;
> > > > > > > >  	/** @mapping: pointer to VRAM mappable space */
> > > > > > > >  	void __iomem *mapping;
> > > > > > > > +	/** @pagemap: Used to remap device memory as ZONE_DEVICE
> > > */
> > > > > > > > +    struct dev_pagemap pagemap;
> > > > > > > > +    /**
> > > > > > > > +     * @hpa_base: base host physical address
> > > > > > > > +     *
> > > > > > > > +     * This is generated when remap device memory as
> ZONE_DEVICE
> > > > > > > > +     */
> > > > > > > > +    resource_size_t hpa_base;
> > > > > > >
> > > > > > > Weird indentation. This goes for the entire series, look at c=
heckpatch.
> > > > > >
> > > > > > Will fix
> > > > > > >
> > > > > > > > +
> > > > > > > >  };
> > > > > > > >
> > > > > > > >  /**
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > > > index e3db3a178760..0d795394bc4c 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > > > @@ -22,6 +22,7 @@
> > > > > > > >  #include "xe_module.h"
> > > > > > > >  #include "xe_sriov.h"
> > > > > > > >  #include "xe_tile.h"
> > > > > > > > +#include "xe_svm.h"
> > > > > > > >
> > > > > > > >  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> > > > > > > >  #define TILE_COUNT		REG_GENMASK(15, 8)
> > > > > > > > @@ -286,6 +287,7 @@ int xe_mmio_probe_vram(struct xe_device
> *xe)
> > > > > > > >  		}
> > > > > > > >
> > > > > > > >  		io_size -=3D min_t(u64, tile_size, io_size);
> > > > > > > > +		xe_svm_devm_add(tile, &tile->mem.vram);
> > > > > > >
> > > > > > > Do we want to do this probe for all devices with VRAM or only=
 a subset?
> > > > > >
> > > > > > All
> > > > >
> > > > > Can you explain why?
> > > >
> > > > It is natural for me to add all device memory to hmm. In hmm design=
, device
> > > memory is used as a special swap out for system memory. I would ask w=
hy
> we
> > > only want to add a subset of vram? By a subset, do you mean only vram=
 of
> one
> > > tile instead of all tiles?
> > > >
> > >
> > > I think we talking about different things, my bad on wording in the
> > > original question.
> > >
> > > Let me ask again - should be calling xe_svm_devm_add on all *platform=
s*
> > > that have VRAM. i.e. Should we do this on PVC but not DG2?
> >
> >
> > Oh, I see. Good question. On i915, this feature was only tested on PVC.=
 We
> don't have a plan to enable it on older platform than PVC.
> >
> > Let me add a check here, only enabled it on platform newer than PVC
> >
>=20
> Probably actually check 'xe->info.has_usm'.
>=20
> We might want to rename field too and drop the 'usm' nomenclature but
> that can be done later.

Good idea. Let me check with "has_usm"

Oak

>=20
> Matt
>=20
> > Oak
> >
> > >
> > > Matt
> > >
> > > > Oak
> > > >
> > > >
> > > > >
> > > > > > >
> > > > > > > >  	}
> > > > > > > >
> > > > > > > >  	xe->mem.vram.actual_physical_size =3D total_size;
> > > > > > > > @@ -354,10 +356,16 @@ void xe_mmio_probe_tiles(struct
> xe_device
> > > *xe)
> > > > > > > >  static void mmio_fini(struct drm_device *drm, void *arg)
> > > > > > > >  {
> > > > > > > >  	struct xe_device *xe =3D arg;
> > > > > > > > +    struct xe_tile *tile;
> > > > > > > > +    u8 id;
> > > > > > > >
> > > > > > > >  	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
> > > > > > > >  	if (xe->mem.vram.mapping)
> > > > > > > >  		iounmap(xe->mem.vram.mapping);
> > > > > > > > +
> > > > > > > > +	for_each_tile(tile, xe, id)
> > > > > > > > +		xe_svm_devm_remove(xe, &tile->mem.vram);
> > > > > > >
> > > > > > > This should probably be above existing code. Typical on fini =
to do
> > > > > > > things in reverse order from init.
> > > > > >
> > > > > > Will fix
> > > > > > >
> > > > > > > > +
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static int xe_verify_lmem_ready(struct xe_device *xe)
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > b/drivers/gpu/drm/xe/xe_svm.h
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..09f9afb0e7d4
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > > > > > @@ -0,0 +1,14 @@
> > > > > > > > +// SPDX-License-Identifier: MIT
> > > > > > > > +/*
> > > > > > > > + * Copyright =A9 2023 Intel Corporation
> > > > > > >
> > > > > > > 2024?
> > > > > >
> > > > > > This patch was actually written 2023
> > > > > > >
> > > > > > > > + */
> > > > > > > > +
> > > > > > > > +#ifndef __XE_SVM_H
> > > > > > > > +#define __XE_SVM_H
> > > > > > > > +
> > > > > > > > +#include "xe_device_types.h"
> > > > > > >
> > > > > > > I don't think you need to include this. Rather just forward d=
ecl structs
> > > > > > > used here.
> > > > > >
> > > > > > Will fix
> > > > > > >
> > > > > > > e.g.
> > > > > > >
> > > > > > > struct xe_device;
> > > > > > > struct xe_mem_region;
> > > > > > > struct xe_tile;
> > > > > > >
> > > > > > > > +
> > > > > > > > +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_re=
gion
> > > *mem);
> > > > > > > > +void xe_svm_devm_remove(struct xe_device *xe, struct
> > > xe_mem_region
> > > > > > > *mem);
> > > > > > >
> > > > > > > The arguments here are incongruent here. Typically we want th=
ese to
> > > > > > > match.
> > > > > >
> > > > > > Will fix
> > > > > > >
> > > > > > > > +
> > > > > > > > +#endif
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > > > > b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > > > >
> > > > > > > Incongruent between xe_svm.h and xe_svm_devmem.c.
> > > > > >
> > > > > > Did you mean mem vs mr? if yes, will fix
> > > > > >
> > > > > > Again these two
> > > > > > > should
> > > > > > > match.
> > > > > > >
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..63b7a1961cc6
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > > > > > @@ -0,0 +1,91 @@
> > > > > > > > +// SPDX-License-Identifier: MIT
> > > > > > > > +/*
> > > > > > > > + * Copyright =A9 2023 Intel Corporation
> > > > > > >
> > > > > > > 2024?
> > > > > > It is from 2023
> > > > > > >
> > > > > > > > + */
> > > > > > > > +
> > > > > > > > +#include <linux/mm_types.h>
> > > > > > > > +#include <linux/sched/mm.h>
> > > > > > > > +
> > > > > > > > +#include "xe_device_types.h"
> > > > > > > > +#include "xe_trace.h"
> > > > > > >
> > > > > > > xe_trace.h appears to be unused.
> > > > > >
> > > > > > Will fix
> > > > > > >
> > > > > > > > +#include "xe_svm.h"
> > > > > > > > +
> > > > > > > > +
> > > > > > > > +static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *=
vmf)
> > > > > > > > +{
> > > > > > > > +	return 0;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static void xe_devm_page_free(struct page *page)
> > > > > > > > +{
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static const struct dev_pagemap_ops xe_devm_pagemap_ops =
=3D {
> > > > > > > > +	.page_free =3D xe_devm_page_free,
> > > > > > > > +	.migrate_to_ram =3D xe_devm_migrate_to_ram,
> > > > > > > > +};
> > > > > > > > +
> > > > > > >
> > > > > > > Assume these are placeholders that will be populated later?
> > > > > >
> > > > > >
> > > > > > corrrect
> > > > > > >
> > > > > > > > +/**
> > > > > > > > + * xe_svm_devm_add: Remap and provide memmap backing for
> > > device
> > > > > > > memory
> > > > > > > > + * @tile: tile that the memory region blongs to
> > > > > > > > + * @mr: memory region to remap
> > > > > > > > + *
> > > > > > > > + * This remap device memory to host physical address space=
 and
> create
> > > > > > > > + * struct page to back device memory
> > > > > > > > + *
> > > > > > > > + * Return: 0 on success standard error code otherwise
> > > > > > > > + */
> > > > > > > > +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_re=
gion
> *mr)
> > > > > > >
> > > > > > > Here I see the xe_mem_region is from tile->mem.vram, wonderin=
g
> rather
> > > > > > > than using the tile->mem.vram we should use xe->mem.vram when
> > > enabling
> > > > > > > svm? Isn't the idea behind svm the entire memory is 1 view?
> > > > > >
> > > > > > Still need to use tile. The reason is, memory of different tile=
 can have
> > > different
> > > > > characteristics, such as latency. So we want to differentiate mem=
ory b/t
> tiles
> > > also
> > > > > in svm. I need to change below " mr->pagemap.owner =3D tile->xe-
> >drm.dev ".
> > > the
> > > > > owner should also be tile. This is the way hmm differentiate memo=
ry of
> > > different
> > > > > tile.
> > > > > >
> > > > > > With svm it is 1 view, from virtual address space perspective a=
nd from
> > > physical
> > > > > struct page perspective. You can think of all the tile's vram is =
stacked
> together
> > > to
> > > > > form a unified view together with system memory. This doesn't pro=
hibit
> us
> > > from
> > > > > differentiate memory from different tile. This differentiation al=
low us to
> > > optimize
> > > > > performance, i.e., we can wisely place memory in specific tile. I=
f we don't
> > > > > differentiate, this is not possible.
> > > > > >
> > > > >
> > > > > Ok makes sense.
> > > > >
> > > > > Matt
> > > > >
> > > > > > >
> > > > > > > I suppose if we do that we also only use 1 TTM VRAM manager /
> buddy
> > > > > > > allocator too. I thought I saw some patches flying around for=
 that too.
> > > > > >
> > > > > > Ttm vram manager is not in the picture. We deliberately avoided=
 it per
> > > previous
> > > > > discussion
> > > > > >
> > > > > > Yes same buddy allocator. It is in my previous POC:
> > > https://lore.kernel.org/dri-
> > > > > devel/20240117221223.18540-12-oak.zeng@intel.com/. I didn't put t=
hose
> > > patches
> > > > > in this series because I want to merge this small patches separat=
ely.
> > > > > > >
> > > > > > > > +{
> > > > > > > > +	struct device *dev =3D &to_pci_dev(tile->xe->drm.dev)->de=
v;
> > > > > > > > +	struct resource *res;
> > > > > > > > +	void *addr;
> > > > > > > > +	int ret;
> > > > > > > > +
> > > > > > > > +	res =3D devm_request_free_mem_region(dev, &iomem_resource=
,
> > > > > > > > +					   mr->usable_size);
> > > > > > > > +	if (IS_ERR(res)) {
> > > > > > > > +		ret =3D PTR_ERR(res);
> > > > > > > > +		return ret;
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > > +	mr->pagemap.type =3D MEMORY_DEVICE_PRIVATE;
> > > > > > > > +	mr->pagemap.range.start =3D res->start;
> > > > > > > > +	mr->pagemap.range.end =3D res->end;
> > > > > > > > +	mr->pagemap.nr_range =3D 1;
> > > > > > > > +	mr->pagemap.ops =3D &xe_devm_pagemap_ops;
> > > > > > > > +	mr->pagemap.owner =3D tile->xe->drm.dev;
> > > > > > > > +	addr =3D devm_memremap_pages(dev, &mr->pagemap);
> > > > > > > > +	if (IS_ERR(addr)) {
> > > > > > > > +		devm_release_mem_region(dev, res->start,
> > > resource_size(res));
> > > > > > > > +		ret =3D PTR_ERR(addr);
> > > > > > > > +		drm_err(&tile->xe->drm, "Failed to remap tile %d
> > > memory,
> > > > > > > errno %d\n",
> > > > > > > > +				tile->id, ret);
> > > > > > > > +		return ret;
> > > > > > > > +	}
> > > > > > > > +	mr->hpa_base =3D res->start;
> > > > > > > > +
> > > > > > > > +	drm_info(&tile->xe->drm, "Added tile %d memory [%llx-%llx=
] to
> > > devm,
> > > > > > > remapped to %pr\n",
> > > > > > > > +			tile->id, mr->io_start, mr->io_start + mr-
> > > >usable_size,
> > > > > > > res);
> > > > > > > > +	return 0;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +/**
> > > > > > > > + * xe_svm_devm_remove: Unmap device memory and free
> resources
> > > > > > > > + * @xe: xe device
> > > > > > > > + * @mr: memory region to remove
> > > > > > > > + */
> > > > > > > > +void xe_svm_devm_remove(struct xe_device *xe, struct
> > > xe_mem_region
> > > > > > > *mr)
> > > > > > > > +{
> > > > > > > > +	/*FIXME: below cause a kernel hange during moduel remove*=
/
> > > > > > > > +#if 0
> > > > > > > > +	struct device *dev =3D &to_pci_dev(xe->drm.dev)->dev;
> > > > > > > > +
> > > > > > > > +	if (mr->hpa_base) {
> > > > > > > > +		devm_memunmap_pages(dev, &mr->pagemap);
> > > > > > > > +		devm_release_mem_region(dev, mr-
> > > >pagemap.range.start,
> > > > > > > > +			mr->pagemap.range.end - mr-
> > > >pagemap.range.start +1);
> > > > > > > > +	}
> > > > > > > > +#endif
> > > > > > >
> > > > > > > This would need to be fixed too.
> > > > > >
> > > > > >
> > > > > > Yes...
> > > > > >
> > > > > > Oak
> > > > > > >
> > > > > > > Matt
> > > > > > >
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > --
> > > > > > > > 2.26.3
> > > > > > > >
