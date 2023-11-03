Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D1DC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 15:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C475210E002;
	Fri,  3 Nov 2023 15:28:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A7010E002
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 15:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699025333; x=1730561333;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UVn5UM5xA0iVaA+3TIyOdtHOPXTlKb71iNGLDNQ4Zeg=;
 b=d8NHAhOQP9nvAZbgO2naWVcDNuCXO1MdkWhK+EOQiJb3ewzsUqcrSUn9
 AADqg8P6Yu5gS65iMss2UT6oooIYYUdfijuXndwB8uSFd76RtKB8Mx3X2
 vdcaG6P43kTexQsRqIeI48Zif3JeinoCsG4hZbGObNYunX88x8UVyip83
 l1lMwEaJHdsLtaTw5Cq7Xxiw95/I1YBJRyc0gliIrQ0askAzD6QfR81Rd
 Z3DUzeCA4goyGF4SRIrYCZtI6KoDDYad+iD2ZbZNrOPanQ9pJC6bn7gzN
 MqbhuYUCws0zf0jwIszqNhhgeNVtZ/D25WOWkPe3IDa/4oHqQwPj5J2GI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="368307285"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="368307285"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:28:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="852292010"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="852292010"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 08:28:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 08:28:51 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 08:28:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 08:28:51 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 08:28:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACBeC/I88VpfYhJlkJ5s4JomkVQQO6y5zDsidBnQWMYn68O4sXWwk+u+332eLv/Bez91+Flqk9GIOjqA/5BYJZJSe8jwAaQbYhT0rG1xsUHS+Z9P0v8HV4lHeq94LQvgGY01VkMzGyMWn68rXxWGOLR0rB4qL3IdMHfPFja7BFhAAHm3SvQBwyQsuF0cpRt7Tey1klZbhdhN3PcRMTpnAsWNSHK7VPg13Dyoy2V7Yu8dS11o4jxGXMIb8N3CxSyQZxgLnNuA5IfNkdO/vZl1btCkkXQdY5qMzg72N3eUTTCRRlwW3To4QJFQ1F4Y/hZEFVGuQnySLIVs5II1PMV1Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoVdwcUHQGHfYZ/7tzbezRyLERo++Y1X61djhlvQ7qw=;
 b=dV2VhzfXz2ZOkNeuu+ZFZirmUXxAqM1+znb/uz+eByHkMO7gVVlqo68Zrm8kevodP6JEAsb2kOuTEOrd+XOcU9mCGfvA4aUPezw7EBnyxs3vPdJ2AuJlMiEmWEaTG7qMa6njkDtz5tJrIljLjoXnBjhnZ8dQP+CQ4ceMy7VqH2pa4y/iVEz18p7SK1ODS6IHPSPF7GWCa7HS76cHbwOHvCrf7SYufszN3MesfwYXUfWg5Io3Mf17LTa8MME1ikMLpFYgWJmX3Lq5JxbXQWHdvgxq4WTgwLQXN3s3Tt5/3/aPRhnSPCJ3H1snSjgXZ7R8dsc5hcwKLZC7BlmoVPNrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 15:28:49 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915%4]) with mapi id 15.20.6954.024; Fri, 3 Nov 2023
 15:28:49 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [PATCH v3] drm/xe: Fix pagefault and access counter
 worker functions
Thread-Index: AQHaDfcjQEEQ+4G5jE+YF1Ktbeyd+LBn4w2ggADLTwCAAALIgIAABYyAgAACF+A=
Date: Fri, 3 Nov 2023 15:28:48 +0000
Message-ID: <SA1PR11MB6991F7CC1917B0E67C90095F92A5A@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20231103014309.13927-1-brian.welty@intel.com>
 <SA1PR11MB6991A3545369C82321D3F06592A5A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <bf600a6ec499ed6b8367759340f546c51d744686.camel@intel.com>
 <SA1PR11MB6991A29876A71CE58F2105B592A5A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZUUPy7DtDds0d7Ih@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZUUPy7DtDds0d7Ih@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DS0PR11MB8113:EE_
x-ms-office365-filtering-correlation-id: b71277bf-6ca3-40fb-f1f8-08dbdc8193b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DG4IaVZ2vN8Qhn6p+jFI4eHgCjuVamldFW/Phlbx7oD9bX18E3yPC76eO5mqp3co9dZhIicqTCVCQwhZ/ldYT/jbbseHknZyK4qqXZyUFqMnhhvDGkIfY3H7QZdvpM2dBEtE3VatOhjbANqedXkSmllGa1G3B7kqeKhj5WUtGOmC7kQl2V1eVQ6dYdAJsqNMuOhQXKA0Zvz+35yFCH8JIO0WiS04MrddFXl7ycsrlXUoHvmZ71RkXg7QwOemsVt+/jK2KamVtH6Kc902j0zOLgC0rOdEJ4DwmN0WSCZptFDvEYQMYycRl1+S/dESxPB5EhI0+xAI03TA8PX8qESbqkjtu663mhrx0L6Wf7W9c3qm/TNQ1hXeUFUF/ws+X3nLOZuH1WUg7FacYS3LUYIr2vzWZcmyRpkMVOBSwu7s40PH1RpA0tHe0iJcYJ+f+RpgjLTcgfYCs94hq/TCLJDTc8CJJn0D85lX84dcYG27fQifJaTQ5iLvw7vOF0JbAo/LeRlb/mHPT9KbS2alKtFvgL44VpsK1fv33fUpVfmXbUQ3+RW5Ol0JX8f5dqsjpVcSh5Ap7vv20ClRzSjf0ygBXNQBMPr+w7ec7MuyreAQc/PaqEPhVpGo+Ys3Z4qwomqM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(396003)(39860400002)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(122000001)(55016003)(2906002)(30864003)(5660300002)(41300700001)(52536014)(4326008)(8936002)(6862004)(38070700009)(33656002)(8676002)(86362001)(82960400001)(38100700002)(53546011)(7696005)(6506007)(316002)(6636002)(54906003)(64756008)(66946007)(76116006)(66446008)(107886003)(83380400001)(66476007)(26005)(71200400001)(9686003)(66556008)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?g4WK+dxqlrShjBkC9g7SOj8rEF+GhwqAWoh9Bs6uM2CF7vPoN1CA8ksvCI?=
 =?iso-8859-1?Q?hdup48Sm0flJRmsGQyqNEhLuhelVGcuI+iymYZzVoFluqP4utH9uHllpuX?=
 =?iso-8859-1?Q?w/PgapcOQATS5IcWBMR0O1x1b0j+yqHr6XxBphkiGAFBqZVD/wG3BRhB02?=
 =?iso-8859-1?Q?eDycCDXlDGkT42HYKtXhaabE6+Jx7EXNgp8CtFt4u8fdnK2ZHX3YMx8Lhi?=
 =?iso-8859-1?Q?AnSrB0LERHPuZk0qUbZIkqAotQmWCQncUrY+jUT92x01+14gMIT1Yg7+QZ?=
 =?iso-8859-1?Q?BnY1jARB9VVzZWU30D1uh/gOI2wTGcocf8dCFDwKRCspPxPrLxfRBblYsv?=
 =?iso-8859-1?Q?aEkLHqI9tGemjpHX11FoQ17UFDRrmEeX/mUm96Hf1mdYz/Ak7Ew+dvSPJW?=
 =?iso-8859-1?Q?DAxJCbS8vMgnPuIE+TvgrpQADoJUYnvscNdNXkFLCM//P0BD8EzsapUlRL?=
 =?iso-8859-1?Q?ORu02Yqv/FV4nydoPz8ZTcLF3agPUxawjieXWXtDZbYXYv9TA4JmjBXc9l?=
 =?iso-8859-1?Q?6MoM2rZ0fQM8WKTlt4UbzhJtjrR4p7a3k0Hf7O0hYJzvtDCpB21cTak839?=
 =?iso-8859-1?Q?8MW8fI96NB7KAQFsz/ca8CiDzrgqeC97kFJZ0lkDUsQHTgcN++Kf9LQ6r9?=
 =?iso-8859-1?Q?sg8J2K6rKsRFG4cvEdRM9B6QgcSykxBe2qyn4a9H8YA5A4oYV8LBhlJLSN?=
 =?iso-8859-1?Q?shenA4V5CmauvHESd45Nmg4PIMHXhSzpxlpWQQgF6L4+a95bpTC3deJ7Oi?=
 =?iso-8859-1?Q?svdyb4Jle1okn65t9/XuYhIVQgbB4ZpjaCdbRbZ7bdKzZ0RobOSTorI4uL?=
 =?iso-8859-1?Q?BLpxhZkKzmSVrCNYze+OG/vM/P1bV7Jkq/1QRVPso3acFST7ReqYAwhXag?=
 =?iso-8859-1?Q?969NTWz+U4A//ydhKQx6SRuH49Oe+h9P4UJnr9k7J9KRJzha2/gWnd5fRj?=
 =?iso-8859-1?Q?aAM2LOYO5oZopc2/O89nEOexwK/i94ZWL8cYRfhce9EYw24thTx3l2BOSe?=
 =?iso-8859-1?Q?yBXZ5y+Iafi+2VUJ0678bfd71RuO/FpcRHFlSQeesUWDMzVVsF7iJfyNBq?=
 =?iso-8859-1?Q?NP6iIBLsdi62kUWm+nFIv5xkhWQMe8ZJks1E5PdFjNGhOyRi5WqobroBHr?=
 =?iso-8859-1?Q?j186Zw8cQjchrETkvLIw8kzMd23EhqTaN4rbpiRlZ55czTpZRYL3H0vFzH?=
 =?iso-8859-1?Q?e23KzU7uGIdb+U3mSdtPakaJFAtTwy06lO3BbZ9iYBnSByVzM6wCFwXiAl?=
 =?iso-8859-1?Q?E/YLOLb78pHsXLRgVhHRTTC+um/Ce8Gd8EVfqnuwykEx7IbIqLUIFhjTGo?=
 =?iso-8859-1?Q?JTUQtiJNKU5snY1CScxpzTh1vocvug+y5kCjTHu2Q0ZLd4fVdRQ8KFNoiB?=
 =?iso-8859-1?Q?g7Ey4CrLsClmqEYZsGA1aSFxE7qUcyLiuQliF4igv9cEayfm6sgKq6pzPh?=
 =?iso-8859-1?Q?1Clr2b21esyKMtVmumEY0EOlKM/bJ/PI2vfZAhQYS2xcIJ10RNpBBWKHHo?=
 =?iso-8859-1?Q?yA1WFu5M4JAvLM+dYlg/lCPB+mhXjOsNJ0dEIqWzuqcsydP9TCyqrft5+D?=
 =?iso-8859-1?Q?Wr/H02SlcDhpNSU472eFahEQgfMLItQy4xpD5Izc/ffbdNy/H3duo7C4kn?=
 =?iso-8859-1?Q?7ve+jqsv0V13c=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b71277bf-6ca3-40fb-f1f8-08dbdc8193b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 15:28:49.0185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FB2LJxDqCXqjhWniQBDdzTr5jSA1Uk0aCdOL1lrACSKi4InACBmJenSuaQGzPE0ALCpAmwo0zxKlyPIvJ7Pk8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Fix pagefault and access counter
 worker functions
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, November 3, 2023 11:21 AM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: Summers, Stuart <stuart.summers@intel.com>; intel-
> xe@lists.freedesktop.org; Welty, Brian <brian.welty@intel.com>
> Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Fix pagefault and access count=
er
> worker functions
>=20
> On Fri, Nov 03, 2023 at 03:08:41PM +0000, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Summers, Stuart <stuart.summers@intel.com>
> > > Sent: Friday, November 3, 2023 10:51 AM
> > > To: intel-xe@lists.freedesktop.org; Welty, Brian <brian.welty@intel.c=
om>;
> Zeng,
> > > Oak <oak.zeng@intel.com>
> > > Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Fix pagefault and access c=
ounter
> > > worker functions
> > >
> > > On Fri, 2023-11-03 at 02:46 +0000, Zeng, Oak wrote:
> > > > Hi,
> > > >
> > > > Can someone explain why we introduced an circular buffer for page
> > > > fault handling in xekmd?
> > > >
> > > > I915 page fault is also handled in a work queue/worker way. Wheneve=
r
> > > > we have a guc2host request, we queue_work to process the incoming
> > > > request. No circular buffer. We didn't have a problem there.
> > >
> > > i915 also uses a circular buffer:
> >
> > By circular buffer, I meant the struct pf_queue::data. Xekmd copy the p=
age
> fault request to this buffer and process it in a worker. This buffer is a=
 xekmd
> internal thing.
> >
> > While in below code i915 handle request directly in a loop. The request=
 circular
> buffer is co-maintained by kmd and guc.  No above intermediate buffer.
> >
>=20
> In Xe we have a dedicated worker / queue to sink page faults into
> (pf_queue::data). This is needed as faults cannot be directly processed
> in the CT handler as this in the dma-fence signaling path (no memomry
> allocations allowed) as this will deadlock if the CT can't independently
> make forward progress. Fault are pushed this worker / queue from the CT
> handler. As we can't allocate memory in the CT this worker / queue is a
> preallocated circular buffer. I hope this clears this up.

Yes, that answered my question. Thanks.

Oak
>=20
> Matt
>=20
> > > static noinline void ct_incoming_request_worker_func(struct work_stru=
ct
> > > *w)
> > > {
> > >         struct intel_guc_ct *ct =3D
> > >                 container_of(w, struct intel_guc_ct, requests.worker)=
;
> > >         bool done;
> > >
> > >         do {
> > >                 done =3D ct_process_incoming_requests(ct, &ct-
> > > >requests.incoming);
> > >         } while (!done);
> > > }
> > >
> > > The issue with Xe here is the queue_work function is used to queue ea=
ch
> > > incoming fault. If we get too many concurrent faults though, there's =
a
> > > chance we could queue something while a prior fault is in the process
> > > of being launched. In that case the queue_work() function will return
> > > false and we miss the fault handling.
> > >
> > > In the i915 case (see above), we do handle this in a worker, but we
> > > continue to handle requests from the GuC until nothing is left to
> > > handle - circular buffer. In that case, the worker queue processing
> > > those incoming CT requests shouldn't ever hit that corner case of
> > > queue_work() returning false.
> >
> > So isn't i915 way better?
> >
> > Oak
> > >
> > > Thanks,
> > > Stuart
> > >
> > > >
> > > > Thanks,
> > > > Oak
> > > >
> > > > > -----Original Message-----
> > > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf
> > > > > Of Brian Welty
> > > > > Sent: Thursday, November 2, 2023 9:43 PM
> > > > > To: intel-xe@lists.freedesktop.org
> > > > > Subject: [Intel-xe] [PATCH v3] drm/xe: Fix pagefault and access
> > > > > counter worker
> > > > > functions
> > > > >
> > > > > When processing G2H messages for pagefault or access counters, we
> > > > > queue a
> > > > > work item and call queue_work(). This fails if the worker thread =
is
> > > > > already
> > > > > queued to run.
> > > > > The expectation is that the worker function will do more than
> > > > > process a
> > > > > single item and return. It needs to either process all pending
> > > > > items or
> > > > > requeue itself if items are pending. But requeuing will add laten=
cy
> > > > > and
> > > > > potential context switch can occur.
> > > > >
> > > > > We don't want to add unnecessary latency and so the worker should
> > > > > process
> > > > > as many faults as it can within a reasonable duration of time.
> > > > > We also do not want to hog the cpu core, so here we execute in a
> > > > > loop
> > > > > and requeue if still running after more than 20 ms.
> > > > > This seems reasonable framework and easy to tune this further if
> > > > > needed.
> > > > >
> > > > > This resolves issues seen with several igt@xe_exec_fault_mode
> > > > > subtests
> > > > > where the GPU will hang when KMD ignores a pending pagefault.
> > > > >
> > > > > v2: requeue the worker instead of having an internal processing
> > > > > loop.
> > > > > v3: implement hybrid model of v1 and v2
> > > > > =A0=A0=A0 now, run for 20 msec before we will requeue if still ru=
nning
> > > > >
> > > > > Signed-off-by: Brian Welty <brian.welty@intel.com>
> > > > > ---
> > > > > =A0drivers/gpu/drm/xe/xe_gt_pagefault.c | 80 ++++++++++++++++----=
----
> > > > > ----
> > > > > =A01 file changed, 46 insertions(+), 34 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > > index ab6daebbd77c..c99af751d1fb 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > > @@ -276,10 +276,10 @@ static void print_pagefault(struct xe_devic=
e
> > > > > *xe, struct
> > > > > pagefault *pf)
> > > > >
> > > > > =A0#define PF_MSG_LEN_DW=A0=A04
> > > > >
> > > > > -static int get_pagefault(struct pf_queue *pf_queue, struct
> > > > > pagefault *pf)
> > > > > +static bool get_pagefault(struct pf_queue *pf_queue, struct
> > > > > pagefault *pf)
> > > > > =A0{
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0const struct xe_guc_pagefault_desc *desc;
> > > > > -=A0=A0=A0=A0=A0=A0=A0int ret =3D 0;
> > > > > +=A0=A0=A0=A0=A0=A0=A0bool ret =3D false;
> > > > >
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0spin_lock_irq(&pf_queue->lock);
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0if (pf_queue->head !=3D pf_queue->tail) {
> > > > > @@ -303,8 +303,7 @@ static int get_pagefault(struct pf_queue
> > > > > *pf_queue, struct
> > > > > pagefault *pf)
> > > > >
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pf_queue->head =
=3D (pf_queue->head + PF_MSG_LEN_DW) %
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0PF_QUEUE_NUM_DW;
> > > > > -=A0=A0=A0=A0=A0=A0=A0} else {
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D -1;
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D true;
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0}
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0spin_unlock_irq(&pf_queue->lock);
> > > > >
> > > > > @@ -348,6 +347,8 @@ int xe_guc_pagefault_handler(struct xe_guc
> > > > > *guc, u32 *msg,
> > > > > u32 len)
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0return full ? -ENOSPC : 0;
> > > > > =A0}
> > > > >
> > > > > +#define USM_QUEUE_MAX_RUNTIME_MS=A0=A0=A0=A0=A0=A0=A020
> > > > > +
> > > > > =A0static void pf_queue_work_func(struct work_struct *w)
> > > > > =A0{
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0struct pf_queue *pf_queue =3D container_o=
f(w, struct
> > > > > pf_queue, worker);
> > > > > @@ -355,31 +356,37 @@ static void pf_queue_work_func(struct
> > > > > work_struct *w)
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0struct xe_device *xe =3D gt_to_xe(gt);
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0struct xe_guc_pagefault_reply reply =3D {=
};
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0struct pagefault pf =3D {};
> > > > > +=A0=A0=A0=A0=A0=A0=A0unsigned long threshold;
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0int ret;
> > > > >
> > > > > -=A0=A0=A0=A0=A0=A0=A0ret =3D get_pagefault(pf_queue, &pf);
> > > > > -=A0=A0=A0=A0=A0=A0=A0if (ret)
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return;
> > > > > +=A0=A0=A0=A0=A0=A0=A0threshold =3D jiffies +
> > > > > msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
> > > > >
> > > > > -=A0=A0=A0=A0=A0=A0=A0ret =3D handle_pagefault(gt, &pf);
> > > > > -=A0=A0=A0=A0=A0=A0=A0if (unlikely(ret)) {
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0print_pagefault(xe,=
 &pf);
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pf.fault_unsuccessf=
ul =3D 1;
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0drm_dbg(&xe->drm, "=
Fault response: Unsuccessful
> > > > > %d\n", ret);
> > > > > -=A0=A0=A0=A0=A0=A0=A0}
> > > > > +=A0=A0=A0=A0=A0=A0=A0while (get_pagefault(pf_queue, &pf)) {
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D handle_page=
fault(gt, &pf);
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (unlikely(ret)) =
{
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0print_pagefault(xe, &pf);
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0pf.fault_unsuccessful =3D 1;
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0drm_dbg(&xe->drm, "Fault response:
> > > > > Unsuccessful %d\n",
> > > > > ret);
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > > > +
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0reply.dw0 =3D FIELD=
_PREP(PFR_VALID, 1) |
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0FIELD_PREP(PFR_SUCCESS,
> > > > > pf.fault_unsuccessful) |
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0FIELD_PREP(PFR_DESC_TYPE,
> > > > > FAULT_RESPONSE_DESC) |
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0FIELD_PREP(PFR_ASID, pf.asid);
> > > > >
> > > > > -=A0=A0=A0=A0=A0=A0=A0reply.dw0 =3D FIELD_PREP(PFR_VALID, 1) |
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0FIELD_PREP(PFR_SUCC=
ESS, pf.fault_unsuccessful) |
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0FIELD_PREP(PFR_REPL=
Y, PFR_ACCESS) |
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0FIELD_PREP(PFR_DESC=
_TYPE, FAULT_RESPONSE_DESC) |
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0FIELD_PREP(PFR_ASID=
, pf.asid);
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0reply.dw1 =3D FIELD=
_PREP(PFR_VFID, pf.vfid) |
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0FIELD_PREP(PFR_ENG_INSTANCE,
> > > > > pf.engine_instance) |
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0FIELD_PREP(PFR_ENG_CLASS, pf.engine_class)
> > > > > |
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0FIELD_PREP(PFR_PDATA, pf.pdata);
> > > > >
> > > > > -=A0=A0=A0=A0=A0=A0=A0reply.dw1 =3D FIELD_PREP(PFR_VFID, pf.vfid)=
 |
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0FIELD_PREP(PFR_ENG_=
INSTANCE, pf.engine_instance) |
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0FIELD_PREP(PFR_ENG_=
CLASS, pf.engine_class) |
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0FIELD_PREP(PFR_PDAT=
A, pf.pdata);
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0send_pagefault_repl=
y(&gt->uc.guc, &reply);
> > > > >
> > > > > -=A0=A0=A0=A0=A0=A0=A0send_pagefault_reply(&gt->uc.guc, &reply);
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (time_after(jiff=
ies, threshold)) {
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0queue_work(gt->usm.pf_wq, w);
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0break;
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > > > +=A0=A0=A0=A0=A0=A0=A0}
> > > > > =A0}
> > > > >
> > > > > =A0static void acc_queue_work_func(struct work_struct *w);
> > > > > @@ -544,10 +551,10 @@ static int handle_acc(struct xe_gt *gt,
> > > > > struct acc *acc)
> > > > >
> > > > > =A0#define ACC_MSG_LEN_DW=A0=A0=A0=A0=A0=A0=A0 4
> > > > >
> > > > > -static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
> > > > > +static bool get_acc(struct acc_queue *acc_queue, struct acc *acc=
)
> > > > > =A0{
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0const struct xe_guc_acc_desc *desc;
> > > > > -=A0=A0=A0=A0=A0=A0=A0int ret =3D 0;
> > > > > +=A0=A0=A0=A0=A0=A0=A0bool ret =3D false;
> > > > >
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0spin_lock(&acc_queue->lock);
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0if (acc_queue->head !=3D acc_queue->tail)=
 {
> > > > > @@ -567,8 +574,7 @@ static int get_acc(struct acc_queue *acc_queu=
e,
> > > > > struct acc
> > > > > *acc)
> > > > >
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0acc_queue->head =
=3D (acc_queue->head +
> > > > > ACC_MSG_LEN_DW) %
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ACC_QUEUE_NUM_DW;
> > > > > -=A0=A0=A0=A0=A0=A0=A0} else {
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D -1;
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D true;
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0}
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0spin_unlock(&acc_queue->lock);
> > > > >
> > > > > @@ -581,16 +587,22 @@ static void acc_queue_work_func(struct
> > > > > work_struct *w)
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0struct xe_gt *gt =3D acc_queue->gt;
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0struct xe_device *xe =3D gt_to_xe(gt);
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0struct acc acc =3D {};
> > > > > +=A0=A0=A0=A0=A0=A0=A0unsigned long threshold;
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0int ret;
> > > > >
> > > > > -=A0=A0=A0=A0=A0=A0=A0ret =3D get_acc(acc_queue, &acc);
> > > > > -=A0=A0=A0=A0=A0=A0=A0if (ret)
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return;
> > > > > +=A0=A0=A0=A0=A0=A0=A0threshold =3D jiffies +
> > > > > msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
> > > > >
> > > > > -=A0=A0=A0=A0=A0=A0=A0ret =3D handle_acc(gt, &acc);
> > > > > -=A0=A0=A0=A0=A0=A0=A0if (unlikely(ret)) {
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0print_acc(xe, &acc)=
;
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0drm_warn(&xe->drm, =
"ACC: Unsuccessful %d\n", ret);
> > > > > +=A0=A0=A0=A0=A0=A0=A0while (get_acc(acc_queue, &acc)) {
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D handle_acc(=
gt, &acc);
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (unlikely(ret)) =
{
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0print_acc(xe, &acc);
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0drm_warn(&xe->drm, "ACC: Unsuccessful
> > > > > %d\n", ret);
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > > > +
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (time_after(jiff=
ies, threshold)) {
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0queue_work(gt->usm.acc_wq, w);
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0break;
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0}
> > > > > =A0}
> > > > >
> > > > > --
> > > > > 2.38.0
> > > >
> >
