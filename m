Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83773C77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 09:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5028D10E259;
	Mon, 29 May 2023 09:08:58 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D71B10E25B
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 09:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685351335; x=1716887335;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=CIFA+Ci4UEBVwG9w4zzd2RkvRH69rTW/+b3APWH9kfI=;
 b=caqzK1I40cA+rxgqHyFKrUwWKdS6lXp5CUPELlL7JF8egs/G0YAj3Eu9
 Q2W9qzzENPO+0Eag5/IgkpIUz2q3aK4PkGsqOVDuMc7dsf+cQnqOI4cFD
 oike2dEvppf02rkS94ln0v8s9hxDL8kDT4KerluFEAFbJVBKhT1abgu20
 oADdNUScAz7zUGHO/XFauo+84G0JDU+QG3p/eoitXRfXrPGRQoXSFwdJC
 Ak7mSjloKB/7YtIziJ6KBmhdJ7Z2ZcUuVJwnBT0vkCRLoNeHMZzv5Dd0c
 B3GPKdYk05DG81XZFM6wGT6z4bg1xhVD/M5kpA+M507tEvY/lvw2zoxmZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="357043391"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="357043391"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 02:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="818368091"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="818368091"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.136])
 ([10.249.254.136])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 02:08:53 -0700
Message-ID: <d03fef471646a9e6141231ab38c264ea46ba291c.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Mon, 29 May 2023 11:08:51 +0200
In-Reply-To: <20230526190609.61529-2-jose.souza@intel.com>
References: <20230526190609.61529-1-jose.souza@intel.com>
 <20230526190609.61529-2-jose.souza@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add missing TLB invalidation to
 emit_pipe_invalidate()
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
IHdyb3RlOgo+IGk5MTUgaW52YWxpZGF0ZXMgVExCIGJlZm9yZSBlbWl0IEJCIHN0YXJ0LCBzbyBk
b2luZyB0aGUgc2FtZSBpbiBYZS4KCkhpLCBKb3PDqSwKCkRvIHlvdSBzZWUgYW4gaXNzdWUgYmVj
YXVzZSBvZiBtaXNzaW5nIFRMQiBmbHVzaGVzPyBJbiB0aGF0IGNhc2UgdGhhdApuZWVkcyB0byBi
ZSBhZGRlZCB0byB0aGUgY29tbWl0IG1lc3NhZ2UuIFdlIGRvIFRMQiBmbHVzaGVzIG9uIHVuYmlu
ZCwKYnV0IG5vdCBzdXJlIGlmIHdlIGRvIHRoZW0gb24gcmViaW5kLCBzbyBpZiB0aGF0J3MgdGhl
IGlzc3VlIHdlIG5lZWQgdG8KZmlndXJlIG91dCB3aGV0aGVyIHdlIHNob3VsZCBkbyB0aGVtIGFs
c28gb24gcmViaW5kIG9yLCBsaWtlIGluIHRoaXMKcGF0Y2gsIG9uIGVhY2ggZXhlYy4KClRoYW5r
cywKVGhvbWFzCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxq
b3NlLnNvdXphQGludGVsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hl
X2dwdV9jb21tYW5kcy5oIHwgMSArCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMu
Y8KgwqDCoMKgwqDCoMKgwqDCoCB8IDYgKysrKy0tCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3JlZ3MveGVfZ3B1X2NvbW1hbmRzLmgKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdz
L3hlX2dwdV9jb21tYW5kcy5oCj4gaW5kZXggMGY5YzViMGI4YTNiYS4uN2M3MzIwZWZlYTczOSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ncHVfY29tbWFuZHMuaAo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2dwdV9jb21tYW5kcy5oCj4gQEAgLTcz
LDYgKzczLDcgQEAKPiDCoCNkZWZpbmXCoMKgCj4gUElQRV9DT05UUk9MX1NUT1JFX0RBVEFfSU5E
RVjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMTw8MjEp
Cj4gwqAjZGVmaW5lwqDCoAo+IFBJUEVfQ09OVFJPTF9DU19TVEFMTMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMTw8MjApCj4g
wqAjZGVmaW5lwqDCoCBQSVBFX0NPTlRST0xfR0xPQkFMX1NOQVBTSE9UX1JFU0VUwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCgxPDwxOSkKPiArI2RlZmluZcKgwqAgUElQRV9DT05UUk9MX1RMQl9JTlZB
TElEQVRFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKDE8PDE4KQo+IMKgI2Rl
ZmluZcKgwqAKPiBQSVBFX0NPTlRST0xfUFNEX1NZTkPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKDE8PDE3KQo+IMKgI2RlZmlu
ZcKgwqAKPiBQSVBFX0NPTlRST0xfUVdfV1JJVEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKDE8PDE0KQo+IMKgI2RlZmluZcKg
wqAgUElQRV9DT05UUk9MX0RFUFRIX1NUQUxMwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgKDE8PDEzKQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cmluZ19vcHMuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMKPiBpbmRleCBk
MmZhMGI0YzhiY2MwLi40ZjNlZjM5MTA5YjliIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9yaW5nX29wcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3Bz
LmMKPiBAQCAtMzcsNyArMzcsOCBAQAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
UElQRV9DT05UUk9MX0lORElSRUNUX1NUQVRFX0RJU0FCTEUgfCBcCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBQSVBFX0NPTlRST0xfRkxVU0hfRU5BQkxFIHwgXAo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUElQRV9DT05UUk9MX1RFWFRVUkVfQ0FDSEVfSU5WQUxJ
REFURSB8IFwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUElQRV9DT05UUk9MX0RD
X0ZMVVNIX0VOQUJMRSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUElQRV9DT05U
Uk9MX0RDX0ZMVVNIX0VOQUJMRSB8IFwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
UElQRV9DT05UUk9MX1RMQl9JTlZBTElEQVRFKQo+IMKgCj4gwqBzdGF0aWMgdTMyIHByZXBhcnNl
cl9kaXNhYmxlKGJvb2wgc3RhdGUpCj4gwqB7Cj4gQEAgLTExNyw3ICsxMTgsOCBAQCBzdGF0aWMg
aW50IGVtaXRfcGlwZV9pbnZhbGlkYXRlKHUzMiBtYXNrX2ZsYWdzLAo+IHUzMiAqZHcsIGludCBp
KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUElQRV9DT05UUk9MX0NPTlNUX0NB
Q0hFX0lOVkFMSURBVEUgfAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUElQRV9D
T05UUk9MX1NUQVRFX0NBQ0hFX0lOVkFMSURBVEUgfAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgUElQRV9DT05UUk9MX1FXX1dSSVRFIHwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgUElQRV9DT05UUk9MX1NUT1JFX0RBVEFfSU5ERVg7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoFBJUEVfQ09OVFJPTF9TVE9SRV9EQVRBX0lOREVYIHwKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUElQRV9DT05UUk9MX1RMQl9JTlZBTElEQVRFOwo+IMKg
Cj4gwqDCoMKgwqDCoMKgwqDCoGZsYWdzICY9IH5tYXNrX2ZsYWdzOwo+IMKgCgo=

