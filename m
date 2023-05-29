Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D8FC77B7A
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 09:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C1610E259;
	Mon, 29 May 2023 09:10:48 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196E010E26F
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 09:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685351447; x=1716887447;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=VxM7ktBjeCBZ5D99m5cZeh37ZZuYuCOqh6g/B2Hn7qw=;
 b=ZHiW4YTulg5nL9EiSmOwGoN61UadNfBDtgbbwzM6TMEe4c0H9aZztJPV
 NpBmvTLkIk8SQlunL+gfNriJSJrEtWC/i2LKZOtYGZmucJ4C7eXVBpein
 pAykBMfKa8DhENnDrhtT5Z1rtKpqK2PEHMlMYthnhUNKgliwOSrGan7ub
 ooySMAEwdquI1mqRF9YV1vLwOMDFtpkFoumm6BBsSdCnaW5oE6HimVk0a
 vKWsiSdSv6l/aNYXIOTvnfk4gkpVs9BlFYpkl2sDoSx6IZwg8J4ft6qXH
 3BcFlJuh80fKcRofSSrEqk2gbK46ZfZvhtt9NmXn2h/MPUBEqt2+V5bdN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="441019206"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="441019206"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 02:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="739085783"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="739085783"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.136])
 ([10.249.254.136])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 02:10:44 -0700
Message-ID: <fb57ce4580a4dc102836d526581052c5bf88356f.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Mon, 29 May 2023 11:10:42 +0200
In-Reply-To: <20230526190609.61529-3-jose.souza@intel.com>
References: <20230526190609.61529-1-jose.souza@intel.com>
 <20230526190609.61529-3-jose.souza@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Replace PVC check by engine type
 check
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

T24gRnJpLCAyMDIzLTA1LTI2IGF0IDEyOjA2IC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOgo+IF9fZW1pdF9qb2JfZ2VuMTJfcmVuZGVyX2NvbXB1dGUoKSBtYXNrcyBzb21lIFBJ
UEVfQ09OVFJPTCBiaXRzIHRoYXQKPiBkbyBub3QgZXhpc3QgaW4gcGxhdGZvcm1zIHdpdGhvdXQg
cmVuZGVyIGVuZ2luZS4KPiBTbyBoZXJlIHJlcGxhY2luZyB0aGUgUFZDIGNoZWNrIGJ5IHNvbWV0
aGluZyBtb3JlIGdlbmVyaWMgdGhhdCB3aWxsCj4gc3VwcG9ydCBhbnkgZnV0dXJlIHBsYXRmb3Jt
cyB3aXRob3V0IHJlbmRlciBlbmdpbmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0
byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+CgpMR1RNLgpSZXZpZXdlZC1ieTogVGhv
bWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgoKUGVyaGFw
cyBuZWVkIGFuIEFjayBieSBtYnJvc3Qgb3IgbWxhbmtob3JzdCBhcyB3ZWxsLgoKCgo+IC0tLQo+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMgfCA2ICsrKy0tLQo+IMKgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9yaW5nX29wcy5jCj4gaW5kZXggNGYzZWYzOTEwOWI5Yi4uZWNhZTUxMDFjZmFkNiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jCj4gQEAgLTI1MSwxMSArMjUxLDExIEBAIHN0YXRp
YyB2b2lkCj4gX19lbWl0X2pvYl9nZW4xMl9yZW5kZXJfY29tcHV0ZShzdHJ1Y3QgeGVfc2NoZWRf
am9iICpqb2IsCj4gwqDCoMKgwqDCoMKgwqDCoHUzMiBwcGd0dF9mbGFnID0gZ2V0X3BwZ3R0X2Zs
YWcoam9iKTsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpndCA9IGpvYi0+ZW5naW5l
LT5ndDsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2RldmljZSAqeGUgPSBndF90b194ZShn
dCk7Cj4gLcKgwqDCoMKgwqDCoMKgYm9vbCBwdmMgPSB4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9Q
VkM7Cj4gK8KgwqDCoMKgwqDCoMKgYm9vbCBsYWNrc19yZW5kZXIgPSAhKHhlLT5ndFswXS5pbmZv
LmVuZ2luZV9tYXNrICYKPiBYRV9IV19FTkdJTkVfUkNTX01BU0spOwo+IMKgwqDCoMKgwqDCoMKg
wqB1MzIgbWFza19mbGFncyA9IDA7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgZHdbaSsrXSA9IHBy
ZXBhcnNlcl9kaXNhYmxlKHRydWUpOwo+IC3CoMKgwqDCoMKgwqDCoGlmIChwdmMpCj4gK8KgwqDC
oMKgwqDCoMKgaWYgKGxhY2tzX3JlbmRlcikKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoG1hc2tfZmxhZ3MgPSBQSVBFX0NPTlRST0xfM0RfQVJDSF9GTEFHUzsKPiDCoMKgwqDCoMKg
wqDCoMKgZWxzZSBpZiAoam9iLT5lbmdpbmUtPmNsYXNzID09IFhFX0VOR0lORV9DTEFTU19DT01Q
VVRFKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWFza19mbGFncyA9IFBJUEVf
Q09OVFJPTF8zRF9FTkdJTkVfRkxBR1M7Cj4gQEAgLTI3Nyw3ICsyNzcsNyBAQCBzdGF0aWMgdm9p
ZAo+IF9fZW1pdF9qb2JfZ2VuMTJfcmVuZGVyX2NvbXB1dGUoc3RydWN0IHhlX3NjaGVkX2pvYiAq
am9iLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGpvYi0KPiA+dXNl
cl9mZW5jZS52YWx1ZSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBk
dywgaSk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBpID0gZW1pdF9waXBlX2ltbV9nZ3R0KHhlX2xy
Y19zZXFub19nZ3R0X2FkZHIobHJjKSwgc2Vxbm8sCj4gcHZjLCBkdywgaSk7Cj4gK8KgwqDCoMKg
wqDCoMKgaSA9IGVtaXRfcGlwZV9pbW1fZ2d0dCh4ZV9scmNfc2Vxbm9fZ2d0dF9hZGRyKGxyYyks
IHNlcW5vLAo+IGxhY2tzX3JlbmRlciwgZHcsIGkpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGkg
PSBlbWl0X3VzZXJfaW50ZXJydXB0KGR3LCBpKTsKPiDCoAoK

